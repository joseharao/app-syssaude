unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, PngBitBtn, ImgList, PngImageList, RxGIF,
  FMTBcd, DB, SqlExpr;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    lblData: TLabel;
    Label2: TLabel;
    txtUsuario: TEdit;
    Label3: TLabel;
    txtSenha: TEdit;
    btConfirmar: TPngBitBtn;
    btSair: TPngBitBtn;
    panel4: TPanel;
    AtualizacaoDiaria: TSQLStoredProc;
    procedure FormShow(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ProcedimentosIniciais;
    procedure btConfirmarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  Tentativa : Integer;
implementation

uses UDados, UPrincipal, UFuncoes;

{$R *.dfm}

procedure TfrmLogin.btConfirmarClick(Sender: TObject);
begin
  //Abre o cadastro de usuarios para verficar se existe o usuário informado
 if Tentativa < 3 then begin
   with dados do begin
      sqlUsuario.Close;
      cdsUsuario.Close;
      sqlUsuario.SQL.Clear;
      sqlUsuario.SQL.Add('SELECT * FROM USUARIOS WHERE NOME = '+#39+ txtUsuario.Text +#39+ ' AND SENHA = '+#39+ MD5(txtSenha.Text) +#39);
      cdsUsuario.Open;
   end;
   if dados.cdsUsuario.Eof then begin
     application.MessageBox('Usuário / Senha Inválido', 'Atenção', MB_IconError);
     Tentativa := Tentativa + 1;
     txtUsuario.SetFocus;
     exit;
   end else begin
     frmPrincipal.Logado := true;
     frmPrincipal.lblUsuario.Caption := 'Usuário Logado: ' + dados.cdsUsuarioNOME.AsString;
     close;
   end;
 end else begin
  if dados.DB.Connected then begin
      dados.DB.CloseDataSets;
      Dados.DB.Close;
  end;
   Application.Terminate;
 end;
end;

procedure TfrmLogin.btSairClick(Sender: TObject);
begin
if application.MessageBox('Deseja Realmente Sair do Sistema?', 'Confirmação', MB_YesNo + MB_IconQuestion) = idYes then begin
  if dados.DB.Connected then begin
     Dados.DB.CloseDataSets;
     dados.DB.Close;
  end;
   application.Terminate;
end;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  txtUsuario.SetFocus;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   UnregisterHotKey(self.Handle, 2);
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
   //Executa os procedimentos iniciais do sistema
    ProcedimentosIniciais;
    Tentativa := 0;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then begin
  Key := #0;
  Perform(WM_NEXTDLGCTL, 0, 0)
end;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
   lblData.Caption := DateToStr(Date);
   //Desabilita a Tecla ALT + F4
   RegisterHotKey(self.Handle, 2, MOD_ALT, VK_F4);
end;

procedure TfrmLogin.ProcedimentosIniciais;
begin
    //Abre os dados do usuario
    dados.cdsUsuario.Open;
    dados.cdsUsuario.First;
  //Verifica se existe usuários cadastrados;
   if dados.cdsUsuario.Eof then begin
       dados.cdsUsuario.Append;
       Dados.cdsUsuarioCOD_USUARIO.AsInteger := PegaSequencia('GEN_USUARIOS_ID');
       dados.cdsUsuarioNOME.AsString := 'ADMIN';
       Dados.cdsUsuarioSENHA.AsString := MD5('MASTERKEY');
       dados.cdsUsuario.Post;
       Dados.cdsUsuario.ApplyUpdates(-1);
    end;
end;

end.
