unit ULVacina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ULGenerico, Data.DB, Data.FMTBcd,
  Vcl.StdCtrls, Data.SqlExpr, Datasnap.Provider, Datasnap.DBClient, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, PngBitBtn, Vcl.ExtCtrls;

type
  TfrmLVacinas = class(TfrmLGenerico)
    txtCampo: TComboBox;
    Label2: TLabel;
    txtLocaliza: TEdit;
    Label1: TLabel;
    cdsTabCOD_VACINA: TIntegerField;
    cdsTabNOME_VACINA: TStringField;
    cdsTabMES_PARA_APLICACAO: TIntegerField;
    procedure MontaSQL;
    procedure AbreVacina;
    procedure btEditarClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure btConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLVacinas: TfrmLVacinas;

implementation

{$R *.dfm}

uses UFuncoes, UVacina;

{ TfrmLGenerico1 }

procedure TfrmLVacinas.AbreVacina;
begin
   Application.CreateForm(TfrmVAcina, frmVacina);
   frmVacina.sqlTab.Close;
   frmVacina.cdsTab.Close;
   frmVacina.sqlTab.ParamByName('COD_VACINA').AsInteger := cdsTabCOD_VACINA.AsInteger;
   frmVacina.Campo := 'COD_VACINA';
   frmVacina.cdsTab.Open;
   frmVacina.ShowModal;
  if cdsTab.Active then begin
   cdsTab.Refresh;
  end;
end;

procedure TfrmLVacinas.btConsultarClick(Sender: TObject);
begin
MontaSQL;
  inherited;
end;

procedure TfrmLVacinas.btEditarClick(Sender: TObject);
begin
  inherited;
  AbreVacina;
end;

procedure TfrmLVacinas.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  AbreVacina;
end;

procedure TfrmLVacinas.MontaSQL;
begin
sql := 'SELECT * FROM VACINA';
if not Vazio(txtLocaliza.Text) then begin
  case txtCampo.ItemIndex of
    0: sql := sql + ' WHERE COD_VACINA LIKE '+#39+txtLocaliza.Text+'%'+#39;
    1: sql := sql + ' WHERE NOME_VACINA LIKE '+#39+txtLocaliza.Text+'%'+#39;
  end;
end;
  case txtCampo.ItemIndex of
      0: sql := sql +  ' ORDER BY COD_VACINA';
      1: sql := sql +  ' ORDER BY NOME_VACINA';
  end;
end;

end.
