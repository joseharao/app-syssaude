unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ExtCtrls, StdCtrls, pngimage;

type
  TfrmPrincipal = class(TForm)
    MenuPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Relatrios1: TMenuItem;
    OpesGerais1: TMenuItem;
    Sair1: TMenuItem;
    Usurios1: TMenuItem;
    BackupRestore1: TMenuItem;
    ParmetrosdoSistema1: TMenuItem;
    SobreoSistema1: TMenuItem;
    pnBarraStatus: TPanel;
    pnServidor: TPanel;
    pnHora: TPanel;
    pnData: TPanel;
    Image1: TImage;
    lblData: TLabel;
    lblHora: TLabel;
    Image2: TImage;
    lblServidor: TLabel;
    Image3: TImage;
    pnUsuario: TPanel;
    lblUsuario: TLabel;
    Image4: TImage;
    pnCentral: TPanel;
    Panel5: TPanel;
    Image5: TImage;
    Timer1: TTimer;
    Pacientes1: TMenuItem;
    Medicamentos1: TMenuItem;
    Agravos1: TMenuItem;
    Posio1: TMenuItem;
    Classificao1: TMenuItem;
    Agentes1: TMenuItem;
    RelatriodeEntregaMensal1: TMenuItem;
    Deficincia1: TMenuItem;
    Vacinas1: TMenuItem;
    RelatriodeVacinao1: TMenuItem;
    RelatriodeVacinaoExtra1: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BackupRestore1Click(Sender: TObject);
    procedure SobreoSistema1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Agentes1Click(Sender: TObject);
    procedure Classificao1Click(Sender: TObject);
    procedure Posio1Click(Sender: TObject);
    procedure Agravos1Click(Sender: TObject);
    procedure Medicamentos1Click(Sender: TObject);
    procedure Pacientes1Click(Sender: TObject);
    procedure Deficincia1Click(Sender: TObject);
    procedure ParmetrosdoSistema1Click(Sender: TObject);
    procedure RelatriodeEntregaMensal1Click(Sender: TObject);
    procedure Vacinas1Click(Sender: TObject);
    procedure RelatriodeVacinao1Click(Sender: TObject);
    procedure RelatriodeVacinaoExtra1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Logado : Boolean;
    Sistema : String;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses UDados, UFuncoes, ULogin, USobre, UBackUp, ULUsuario, ULAgentes,
  ULClassificacao, ULPosicao, ULAgravos, ULMedicamentos, ULPaciente,
  ULDeficiencia, UParam, UOrEntrega, ULVacina, UOrCriancasVacinacao,
  UOrCriancasVacinacaoExtra;

{$R *.dfm}

procedure TfrmPrincipal.Agentes1Click(Sender: TObject);
begin
  AbreForm(TfrmLAgentes, frmLAgentes);
end;

procedure TfrmPrincipal.Agravos1Click(Sender: TObject);
begin
  AbreForm(TfrmLAgravos, frmLAgravos);
end;

procedure TfrmPrincipal.BackupRestore1Click(Sender: TObject);
begin
  AbreForm(TfrmBackup, frmBackup);
end;

procedure TfrmPrincipal.Classificao1Click(Sender: TObject);
begin
   AbreForm(TfrmLClassificacao, frmLClassificacao);
end;

procedure TfrmPrincipal.Deficincia1Click(Sender: TObject);
begin
  AbreForm(TfrmLDeficiencia, frmLDeficiencia);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if application.MessageBox('Deseja Realmente Sair do Sistema?', 'Confirmação', MB_YesNo + MB_IconQuestion) = idYes then begin
  if dados.DB.Connected then begin
     Dados.DB.CloseDataSets;
     dados.DB.Close;
  end;
   application.Terminate;
end else begin
   application.Run;
end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   lblData.Caption := 'Data do Sistema: ' + DateToStr(date);
   lblServidor.Caption := 'Estação de Trabalho: ' + GetComputerNameFunc;
   CentralizaPainel(pnCentral, Screen.Height, Screen.Width);
   Sistema := 'InforAGENTE - Sistema de Gerenciamento de Agentes de Saúdes - [Versão: 1.0.0] - [Desenvolvido Por: InforCENTER Sistemas]';
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
   // formatando como aparecer a barra de status personalizada
   pnData.Width := Round(pnBarraStatus.Width / 4);
   pnHora.Width := Round(pnBarraStatus.Width / 4);
   pnUsuario.Width := Round(pnBarraStatus.Width / 4);
   pnServidor.Width := Round(pnBarraStatus.Width / 4);
  //Verifica se o banco de dados esta conectado para tentar logar no sistema
   if dados.DB.Connected then begin
    //se não estiver logado tentar fazer o login no sistema
     if not Logado then begin
        AbreForm(TfrmLogin, frmLogin);
     end;
   end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  dados.cdsParam.Open;
end;

procedure TfrmPrincipal.Medicamentos1Click(Sender: TObject);
begin
  AbreForm(TfrmLMedicamento, frmLMedicamento);
end;

procedure TfrmPrincipal.Pacientes1Click(Sender: TObject);
begin
  AbreForm(TfrmLPacientes, frmLPacientes);
end;

procedure TfrmPrincipal.ParmetrosdoSistema1Click(Sender: TObject);
begin
  application.CreateForm(TfrmParam, frmParam);
  frmParam.cdsTab.Close;
  frmParam.sqlTab.Close;
  frmParam.sqlTab.ParamByName('COD_PARAM').AsInteger := 0;
  frmParam.cdsTab.Open;
  frmParam.Campo := 'COD_PARAM';
  frmParam.ShowModal;
end;

procedure TfrmPrincipal.Posio1Click(Sender: TObject);
begin
  AbreForm(TfrmLPOsicao, frmLPosicao);
end;

procedure TfrmPrincipal.RelatriodeEntregaMensal1Click(Sender: TObject);
begin
  AbreForm(TfrmOrEntrega, frmOrEntrega);
end;

procedure TfrmPrincipal.RelatriodeVacinao1Click(Sender: TObject);
begin
  AbreForm(TfrmOrRVacina, frmOrRVacina);
end;

procedure TfrmPrincipal.RelatriodeVacinaoExtra1Click(Sender: TObject);
begin
    AbreForm(TfrmOrRVacinaExtra, frmOrRVacinaExtra);
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.SobreoSistema1Click(Sender: TObject);
begin
  AbreForm(TfrmSobre, frmSobre);
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
begin
    lblhora.Caption := 'Hora do Sistema: ' + FormatDateTime('hh:mm:ss', now);
end;

procedure TfrmPrincipal.Usurios1Click(Sender: TObject);
begin
  AbreForm(TfrmLUsuario, frmLUsuario);
end;

procedure TfrmPrincipal.Vacinas1Click(Sender: TObject);
begin
  AbreForm(TfrmLVacinas, frmLvacinas);
end;

end.
