unit UAssistente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, PngBitBtn, IniFiles;

type
  TfrmAssistente = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    txtServidor: TComboBox;
    Label1: TLabel;
    txtIP: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    txtDiretorio: TEdit;
    Label4: TLabel;
    txtNome: TEdit;
    btGravar: TPngBitBtn;
    btSair: TPngBitBtn;
    btLocalizar: TPngBitBtn;
    Arquivo: TOpenDialog;
    procedure btSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GravarIni;
    procedure txtServidorChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btLocalizarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAssistente: TfrmAssistente;
  Arq : TIniFile;
implementation

{$R *.dfm}

procedure TfrmAssistente.btGravarClick(Sender: TObject);
begin
   GravarIni;
   Close;
end;

procedure TfrmAssistente.btLocalizarClick(Sender: TObject);
begin
  Arquivo.Execute();
  txtDiretorio.Text := Arquivo.FileName;
end;

procedure TfrmAssistente.btSairClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAssistente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  release;
end;

procedure TfrmAssistente.FormShow(Sender: TObject);
begin
  txtServidor.ItemIndex := 0;
  txtServidorChange(sender);
end;

procedure TfrmAssistente.GravarIni;
begin
if application.MessageBox('Deseja Realemente Gravar Informações de Conexões do Banco de Dados?', 'Confirmação', MB_YesNo + MB_IconQuestion) = idYes then begin
   Arq := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Sistema.ini');
   case txtServidor.ItemIndex of
      0 : Arq.WriteString('Banco', txtNome.Text, txtDiretorio.Text);
      1 : Arq.WriteString('Banco', txtNome.Text, txtIP.Text+':'+txtDiretorio.Text);
   end;
   Arq.Free;
end;
end;

procedure TfrmAssistente.txtServidorChange(Sender: TObject);
begin
    case txtServidor.ItemIndex of
      0: txtIP.Enabled := false;
      1: txtIP.Enabled := true;
    end;
end;

end.
