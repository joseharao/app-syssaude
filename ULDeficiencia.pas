unit ULDeficiencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ULGenerico, FMTBcd, StdCtrls, DB, SqlExpr, Provider, DBClient, Grids,
  DBGrids, Buttons, PngBitBtn, ExtCtrls;

type
  TfrmLDeficiencia = class(TfrmLGenerico)
    Label1: TLabel;
    txtLocaliza: TEdit;
    Label2: TLabel;
    txtCampo: TComboBox;
    cdsTabCOD_DEFICIENCIA: TIntegerField;
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
  frmLDeficiencia: TfrmLDeficiencia;

implementation

uses UFuncoes, UAgentes, UDeficiencia;

{$R *.dfm}

{ TfrmLAgentes }

procedure TfrmLDeficiencia.AbreAgente;
begin
   Application.CreateForm(TfrmDeficiencia, frmDeficiencia);
   frmDeficiencia.sqlTab.Close;
   frmDeficiencia.cdsTab.Close;
   frmDeficiencia.sqlTab.ParamByName('COD_DEFICIENCIA').AsInteger := cdsTabCOD_DEFICIENCIA.AsInteger;
   frmDeficiencia.Campo := 'COD_DEFICIENCIA';
   frmDeficiencia.cdsTab.Open;
   frmDeficiencia.ShowModal;
  if cdsTab.Active then begin
   cdsTab.Refresh;
  end;
end;

procedure TfrmLDeficiencia.btConsultarClick(Sender: TObject);
begin
MontaSql;
  inherited;
end;

procedure TfrmLDeficiencia.btEditarClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLDeficiencia.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLDeficiencia.grdDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if key = 13 then
   AbreAgente;
end;

procedure TfrmLDeficiencia.MontaSql;
begin
sql := 'SELECT * FROM DEFICIENCIA';
if not Vazio(txtLocaliza.Text) then begin
  case txtCampo.ItemIndex of
    0: sql := sql + ' WHERE COD_DEFICIENCIA LIKE '+#39+txtLocaliza.Text+'%'+#39;
    1: sql := sql + ' WHERE DESCRICAO LIKE '+#39+txtLocaliza.Text+'%'+#39;
  end;
end;
  case txtCampo.ItemIndex of
      0: sql := sql +  ' ORDER BY COD_DEFICIENCIA';
      1: sql := sql +  ' ORDER BY DESCRICAO';
  end;
end;

end.
