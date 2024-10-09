unit ULAgentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ULGenerico, FMTBcd, StdCtrls, DB, SqlExpr, Provider, DBClient, Grids,
  DBGrids, Buttons, PngBitBtn, ExtCtrls;

type
  TfrmLAgentes = class(TfrmLGenerico)
    Label1: TLabel;
    txtLocaliza: TEdit;
    Label2: TLabel;
    txtCampo: TComboBox;
    cdsTabCOD_AGENTE: TIntegerField;
    cdsTabDAT_CAD: TDateField;
    cdsTabNOME_DO_AGENTE: TStringField;
    cdsTabPOSICAO: TStringField;
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
  frmLAgentes: TfrmLAgentes;

implementation

uses UFuncoes, UAgentes;

{$R *.dfm}

{ TfrmLAgentes }

procedure TfrmLAgentes.AbreAgente;
begin
   Application.CreateForm(TfrmAgentes, frmAgentes);
   frmAgentes.sqlTab.Close;
   frmAgentes.cdsTab.Close;
   frmAgentes.sqlTab.ParamByName('COD_AGENTE').AsInteger := cdsTabCOD_AGENTE.AsInteger;
   frmAgentes.Campo := 'COD_AGENTE';
   frmAgentes.cdsTab.Open;
   frmAgentes.ShowModal;
  if cdsTab.Active then begin
   cdsTab.Refresh;
  end;
end;

procedure TfrmLAgentes.btConsultarClick(Sender: TObject);
begin
MontaSql;
  inherited;
end;

procedure TfrmLAgentes.btEditarClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLAgentes.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLAgentes.grdDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if key = 13 then
   AbreAgente;
end;

procedure TfrmLAgentes.MontaSql;
begin
sql := 'SELECT * FROM AGENTES';
if not Vazio(txtLocaliza.Text) then begin
  case txtCampo.ItemIndex of
    0: sql := sql + ' WHERE COD_AGENTE LIKE '+#39+txtLocaliza.Text+'%'+#39;
    1: sql := sql + ' WHERE NOME_DO_AGENTE LIKE '+#39+txtLocaliza.Text+'%'+#39;
  end;
end;
  case txtCampo.ItemIndex of
      0: sql := sql +  ' ORDER BY COD_AGENTE';
      1: sql := sql +  ' ORDER BY NOME_DO_AGENTE';
  end;
end;

end.
