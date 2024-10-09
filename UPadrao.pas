unit UPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, pngimage, Buttons, PngBitBtn, FMTBcd, DB,
  SqlExpr, DBClient, Provider, DBXCommon, DBCtrls;

type
  TfrmPadrao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    btNovo: TPngBitBtn;
    btCancelar: TPngBitBtn;
    btGravar: TPngBitBtn;
    btEditar: TPngBitBtn;
    btExcluir: TPngBitBtn;
    dspTab: TDataSetProvider;
    dsTab: TDataSource;
    cdsTab: TClientDataSet;
    sqlTab: TSQLQuery;
    procedure dsTabStateChange(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure AbreDados;
  private
    { Private declarations }
  public
    { Public declarations }
    Cod_Padrao : integer;
    Campo : String;
  end;

var
  frmPadrao: TfrmPadrao;
  Tr : TDBXTransaction;
implementation

uses UDados, Uerro;

{$R *.dfm}

procedure TfrmPadrao.AbreDados;
begin
  cdsTab.Close;
  sqlTab.Close;
  sqlTab.ParamByName(Campo).AsInteger := Cod_Padrao;
  cdsTab.Open;
end;

procedure TfrmPadrao.btCancelarClick(Sender: TObject);
begin
try
  if cdsTab.Active then begin
     cdsTab.CancelUpdates;
     Dados.DB.CommitFreeAndNil(Tr);
  end;
  except on E : Exception do begin
      application.CreateForm(TfrmErro, frmErro);
      frmErro.lblClasse.Caption := E.ClassName;
      frmErro.lblErro.Lines.Add(PChar(E.Message));
      frmErro.ShowModal;
      Dados.DB.RollbackFreeAndNil(tr);
    end;
  end;
end;

procedure TfrmPadrao.btEditarClick(Sender: TObject);
begin
try
  Tr := Dados.DB.BeginTransaction(TDBXIsolations.ReadCommitted);
  if cdsTab.Active then begin
     Cod_Padrao := cdsTab.FieldByName(Campo).AsInteger;
     cdsTab.Edit;
  end;
  except on E : Exception do begin
      application.CreateForm(TfrmErro, frmErro);
      frmErro.lblClasse.Caption := E.ClassName;
      frmErro.lblErro.Lines.Add(PChar(E.Message));
      dados.DB.RollbackIncompleteFreeAndNil(tr);
      frmErro.ShowModal;
    end;
  end;
end;

procedure TfrmPadrao.btExcluirClick(Sender: TObject);
begin
if application.MessageBox('Deseja Excluir o Registro?', 'Confirmação', MB_YesNo + MB_IconQuestion) = idYes then begin
    try
      Tr := Dados.DB.BeginTransaction(TDBXIsolations.ReadCommitted);
      if cdsTab.Active then begin
         cdsTab.Delete;
         cdsTab.ApplyUpdates(-1);
         Dados.DB.CommitFreeAndNil(Tr);
      end;
      except on E : Exception do begin
          application.CreateForm(TfrmErro, frmErro);
          frmErro.lblClasse.Caption := E.ClassName;
          frmErro.lblErro.Lines.Add(PChar(E.Message));
          frmErro.ShowModal;
          Dados.DB.RollbackFreeAndNil(tr);
        end;
      end;
end;
end;

procedure TfrmPadrao.btGravarClick(Sender: TObject);
begin
if application.MessageBox('Deseja Realmente Gravar as Alterações o Registro?', 'Confirmação', MB_YesNo + MB_IconQuestion) = idYes then begin
    try
      if cdsTab.Active then begin
         cdsTab.Post;
         cdsTab.ApplyUpdates(-1);
         Dados.DB.CommitFreeAndNil(Tr);
      end;
      AbreDados;
      except on E : Exception do begin
          application.CreateForm(TfrmErro, frmErro);
          frmErro.lblClasse.Caption := E.ClassName;
          frmErro.lblErro.Lines.Add(PChar(E.Message));
          frmErro.ShowModal;
          Dados.DB.RollbackFreeAndNil(tr);
        end;
      end;
end;
end;

procedure TfrmPadrao.btNovoClick(Sender: TObject);
begin
try
  Tr := Dados.DB.BeginTransaction(TDBXIsolations.ReadCommitted);
  if cdsTab.Active then begin
     Cod_Padrao := cdsTab.FieldByName(Campo).AsInteger;
     cdsTab.Append;
  end;
  except on E : Exception do begin
      application.CreateForm(TfrmErro, frmErro);
      frmErro.lblClasse.Caption := E.ClassName;
      frmErro.lblErro.Lines.Add(PChar(E.Message));
      dados.DB.RollbackIncompleteFreeAndNil(tr);
      frmErro.ShowModal;
    end;
  end;
end;

procedure TfrmPadrao.dsTabStateChange(Sender: TObject);
begin
//procedimento para habilitar e desabilitar os botões
  if dsTab.State in [dsBrowse] then begin
     btNovo.Enabled := True;
     btEditar.Enabled := True;
     btExcluir.Enabled := true;
     btCancelar.Enabled := false;
     btGravar.Enabled := false;
  end else if dsTab.State in [dsEdit, dsInsert] then begin
     btNovo.Enabled := false;
     btEditar.Enabled := false;
     btExcluir.Enabled := false;
     btCancelar.Enabled := true;
     btGravar.Enabled := true;
  end;
end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if dsTab.State in [dsEdit, dsInsert] then begin
   Application.MessageBox('Registro Em Modo de Edição / Inclusão Cancele ou Grave as Alterações', 'Atenção', MB_ICONEXCLAMATION);
   Action := caNone;
end else begin
  release;
end;
end;

procedure TfrmPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then begin
  Key := #0;
  Perform(WM_NEXTDLGCTL, 0, 0)
end;
end;

end.
