unit UBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, PngBitBtn, ExtCtrls, IniFiles, pngimage;

type
  TfrmBD = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lstBanco: TListBox;
    Assistente: TPngBitBtn;
    btConectar: TPngBitBtn;
    btSair: TPngBitBtn;
    Image1: TImage;
    procedure btSairClick(Sender: TObject);
    procedure CarregaBanco;
    procedure FormShow(Sender: TObject);
    procedure ConectarBanco;
    procedure btConectarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AssistenteClick(Sender: TObject);
    procedure lstBancoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBD: TfrmBD;
  Arq : TIniFile;
implementation

uses UDados, UFuncoes, UAssistente;

{$R *.dfm}

procedure TfrmBD.AssistenteClick(Sender: TObject);
begin
  AbreForm(TfrmAssistente, frmAssistente);
  CarregaBanco;
end;

procedure TfrmBD.btConectarClick(Sender: TObject);
begin
  ConectarBanco;
end;

procedure TfrmBD.btSairClick(Sender: TObject);
begin
 if application.MessageBox('Deseja Realmente Sair do Sistema?', 'Confirmação', MB_YesNo + MB_IconQuestion) = idYes then begin
  if dados.DB.Connected then begin
     Dados.DB.CloseDataSets;
     dados.DB.Close;
  end;
   application.Terminate;
 end;
end;

procedure TfrmBD.CarregaBanco;
begin
   //procedimento para ler todos os bancos de dados cadastrados no arquivo de inicilização
    lstBanco.Items.Clear;
    Arq :=  TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Sistema.ini');
    Arq.ReadSection('Banco', lstBanco.Items);
    Arq.Free;
end;

procedure TfrmBD.ConectarBanco;
begin
  //Procedimento para conectar a banco de dados do sistema
  try
    Arq :=  TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Sistema.ini');
    dados.DB.Close;
    Dados.DB.Params.Values['DATABASE'] := Arq.ReadString('Banco', lstBanco.Items.Strings[lstBanco.ItemIndex], 'C:\InforCENTER\Banco\SISCOFI.gdb');
    Dados.DB.Params.Values['USERNAME'] := 'SYSDBA';
    Dados.DB.Params.Values['PASSWORD'] := 'masterkey';
    dados.DB.Open;
    close;
  except on E : Exception do begin
      application.MessageBox(PChar('Erro ao Conectar o Banco de dados' + e.Message),'Atenção', MB_IconError);
    end;
  end;
end;

procedure TfrmBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
end;

procedure TfrmBD.FormShow(Sender: TObject);
begin
CarregaBanco;
end;

procedure TfrmBD.lstBancoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then begin
     if application.MessageBox('Deseja Realmente Excluir Configurações do Banco de Dados?', 'Confirmação', MB_YesNo + MB_IconQuestion) = idYes then begin
        Arq :=  TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Sistema.ini');
        Arq.DeleteKey('Banco', lstBanco.Items[lstBanco.ItemIndex]);
        Arq.Free;
        CarregaBanco;
     end;
  end;
end;

end.
