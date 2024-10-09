unit UBackUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DateUtils,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Buttons, PngBitBtn, IBServices, IniFiles,
  pngimage;

type
  TfrmBackup = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    btCopia: TPngBitBtn;
    btRestaurar: TPngBitBtn;
    GroupBox1: TGroupBox;
    txtLogC: TMemo;
    txtCaminho: TEdit;
    btLocalizarC: TPngBitBtn;
    Caminho: TOpenDialog;
    Bcks: TIBBackupService;
    Rsts: TIBRestoreService;
    GroupBox2: TGroupBox;
    txtArquivo: TEdit;
    btBAqruivo: TPngBitBtn;
    txtLogR: TMemo;
    Panel3: TPanel;
    Label1: TLabel;
    Image1: TImage;
    procedure btLocalizarCClick(Sender: TObject);
    procedure btCopiaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btRestaurarClick(Sender: TObject);
    procedure btBAqruivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBackup: TfrmBackup;
  I : TIniFile;
implementation

uses UDados, UFuncoes;

{$R *.dfm}

procedure TfrmBackup.btBAqruivoClick(Sender: TObject);
begin
  Caminho.Execute();
  txtArquivo.Text := Caminho.FileName;
end;

procedure TfrmBackup.btCopiaClick(Sender: TObject);
begin
if application.MessageBox('Deseja Iniciar Cópia de Segurança Agora?', 'Confirmação', MB_YesNo + MB_IconQuestion) = idYes then begin
try
   txtLogC.Lines.Clear;
   txtLogC.Lines.Add('Iniciando Cópia de Segurança...');
   txtLogC.Lines.Add('');
   txtLogC.Lines.Add('Verificando Informações de Conexão...');
   txtLogC.Lines.Add('');
   I := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Sistema.ini');
   Bcks.DatabaseName := i.ReadString('Backup', 'Banco', '');
   Bcks.ServerName := i.ReadString('Backup', 'Servidor', '');
   i.Free;
   Bcks.Params.Values['user_name']:= 'SYSDBA';
   Bcks.Params.Values['password']:= 'masterkey';
   Bcks.BackupFile.Add(Pchar(txtCaminho.Text + 'bckCompleto' +TiraBarra(DateToStr(date))+TiraBarra(TimeToStr(Now))+'.bck'));
   Bcks.LoginPrompt := false;
   txtLogC.Lines.Add('Ativando Verbose...');
   txtLogC.Lines.Add('');
   Bcks.Verbose := true;
   txtLogC.Lines.Add('Iniciando Cópia de Segurança...');
   txtLogC.Lines.Add('');
   Bcks.Active := true;
   dados.DB.Close;
   Bcks.ServiceStart;
    while not Bcks.Eof do begin
      txtLogC.Lines.Add(Bcks.GetNextLine);
    end;
   Bcks.Active := false;
   dados.DB.Open;
   txtLogC.Lines.Add('Cópia de Segurança Finalizada Com Sucesso...');
except on E : Exception do begin
       txtLogC.Lines.Add(e.Message);
       dados.DB.Open;
    end;
  end;
end;
end;

procedure TfrmBackup.btLocalizarCClick(Sender: TObject);
begin
  Caminho.Execute();
  txtCaminho.Text := ExtractFilePath(Caminho.FileName);
end;

procedure TfrmBackup.btRestaurarClick(Sender: TObject);
begin
if application.MessageBox('Deseja Iniciar a Restauração da Cópia de Segurança Agora?', 'Confirmação', MB_YesNo + MB_IconQuestion) = idYes then begin
try
   txtLogR.Lines.Clear;
   txtLogR.Lines.Add('Iniciando Restauração da Cópia de Segurança...');
   txtLogR.Lines.Add('');
   txtLogR.Lines.Add('Verificando Informações de Conexão...');
   txtLogR.Lines.Add('');
   Rsts.DatabaseName.Clear;
   I := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Sistema.ini');
   Rsts.DatabaseName.Add(i.ReadString('Backup', 'Banco', ''));
   Rsts.ServerName := i.ReadString('Backup', 'Servidor', '');
   i.Free;
   Rsts.Params.Values['user_name']:= 'SYSDBA';
   Rsts.Params.Values['password']:= 'masterkey';
   Rsts.BackupFile.Clear;
   Rsts.BackupFile.Add(txtArquivo.Text);
   Rsts.LoginPrompt := false;
   txtLogR.Lines.Add('Ativando Verbose...');
   txtLogR.Lines.Add('');
   Rsts.Verbose := true;
   txtLogR.Lines.Add('Iniciando a Restauração da Cópia de Segurança...');
   txtLogR.Lines.Add('');
   Rsts.Active := true;
   dados.DB.Close;
   Rsts.ServiceStart;
    while not Rsts.Eof do begin
      txtLogR.Lines.Add(Rsts.GetNextLine);
    end;
   Rsts.Active := false;
   dados.DB.Open;
   txtLogR.Lines.Add('Cópia de Segurança Finalizada Com Sucesso...');
except on E : Exception do begin
       txtLogR.Lines.Add(e.Message);
       dados.DB.Open;
    end;
  end;
end;
end;

procedure TfrmBackup.FormShow(Sender: TObject);
begin
  i := TIniFile.Create(ExtractFilePath(application.ExeName) + 'Sistema.ini');
  txtCaminho.Text := i.ReadString('Backup', 'Caminho', '');
  I.Free;
end;

end.
