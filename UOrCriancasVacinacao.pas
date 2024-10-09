unit UOrCriancasVacinacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UOrPadrao, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Buttons, PngBitBtn, Vcl.Imaging.pngimage, Vcl.DBCtrls;

type
  TfrmOrRVacina = class(TfrmOrPadrao)
    GroupBox7: TGroupBox;
    DBLookupComboBox6: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure btImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrRVacina: TfrmOrRVacina;

implementation

{$R *.dfm}

uses UDados, UFuncoes, URVacinacao;

procedure TfrmOrRVacina.btImprimirClick(Sender: TObject);
begin
  inherited;
  if application.MessageBox('Deseja Imprimir Listagem Agora?', 'Confirmação', MB_YesNo + MB_IconQuestion) = id_Yes then begin
    sql := 'SELECT * FROM LISTA_CRIANCAS_VACINACAO L WHERE L.COD_VACINA > 0';
    if not vazio(DBLookupComboBox6.Text) then begin
       sql := sql + ' AND L.COD_AGENTE = ' + QuotedStr(dados.cdsAgenteCOD_AGENTE.AsString);
    end;
    if not vazio(DBLookupComboBox1.Text) then begin
       sql := sql + ' AND L.COD_VACINA = ' + QuotedStr(dados.cdsVacinaCOD_VACINA.AsString);
    end;
    case txtOrdernado.ItemIndex of
      0:begin
        SQL := sql + ' ORDER BY L.COD_VACINA';
      end;
      1:begin
        SQL := sql + ' ORDER BY L.NOME_CRIANCA';
      end;
      2:begin
        SQL := sql + ' ORDER BY L.COD_VACINA';
      end;
      3:begin
        SQL := sql + ' ORDER BY L.NOME_AGENTE';
      end;
    end;
    application.CreateForm(TfrmRVacinacao, frmRVacinacao);
    with frmRVacinacao do begin
      cdsTab.Close;
      sqlTab.Close;
      sqlTab.SQL.Clear;
      sqlTab.SQL.Add(sql);
      cdsTab.Open;
      if cdsTab.Eof then begin
         application.MessageBox('Não Há Dados a Serem Impresso.', 'Atenção', MB_ICONEXCLAMATION);
         cdsTab.Close;
         Close;
      end else begin
         RLReport1.PreviewModal;
         Close;
      end;
   end;
  end;
end;

procedure TfrmOrRVacina.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dados.cdsAgente.Close;
  dados.cdsVacina.Close;
  inherited;
end;

procedure TfrmOrRVacina.FormShow(Sender: TObject);
begin
  inherited;
  dados.cdsAgente.Open;
  dados.cdsVacina.Open;
end;

end.
