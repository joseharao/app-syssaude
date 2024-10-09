unit ULAgravos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ULGenerico, FMTBcd, StdCtrls, DB, SqlExpr, Provider, DBClient, Grids,
  DBGrids, Buttons, PngBitBtn, ExtCtrls;

type
  TfrmLAgravos = class(TfrmLGenerico)
    Label1: TLabel;
    txtLocaliza: TEdit;
    Label2: TLabel;
    txtCampo: TComboBox;
    cdsTabCOD_AGRAVO: TIntegerField;
    cdsTabDAT_CAD: TDateField;
    cdsTabDESCRICAO: TStringField;
    procedure MontaSql;
    procedure AbreAgente;
    procedure btConsultarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure grdDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLAgravos: TfrmLAgravos;

implementation

uses UFuncoes, UAgravo;

{$R *.dfm}

{ TfrmLAgentes }

procedure TfrmLAgravos.AbreAgente;
begin
   Application.CreateForm(TfrmAgravo, frmAgravo);
   frmAgravo.sqlTab.Close;
   frmAgravo.cdsTab.Close;
   frmAgravo.sqlTab.ParamByName('COD_AGRAVO').AsInteger := cdsTabCOD_AGRAVO.AsInteger;
   frmAgravo.Campo := 'COD_AGRAVO';
   frmAgravo.cdsTab.Open;
   frmAgravo.ShowModal;
  if cdsTab.Active then begin
   cdsTab.Refresh;
  end;
end;

procedure TfrmLAgravos.btConsultarClick(Sender: TObject);
begin
MontaSql;
  inherited;
end;

procedure TfrmLAgravos.btEditarClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLAgravos.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLAgravos.grdDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if key = 13 then
   AbreAgente;
end;

procedure TfrmLAgravos.MontaSql;
begin
sql := 'SELECT * FROM AGRAVO';
if not Vazio(txtLocaliza.Text) then begin
  case txtCampo.ItemIndex of
    0: sql := sql + ' WHERE COD_AGRAVO LIKE '+#39+txtLocaliza.Text+'%'+#39;
    1: sql := sql + ' WHERE DESCRICAO LIKE '+#39+txtLocaliza.Text+'%'+#39;
  end;
end;
  case txtCampo.ItemIndex of
      0: sql := sql +  ' ORDER BY COD_AGRAVO';
      1: sql := sql +  ' ORDER BY DESCRICAO';
  end;
end;

end.
