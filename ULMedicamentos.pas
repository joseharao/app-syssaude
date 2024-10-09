unit ULMedicamentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ULGenerico, FMTBcd, StdCtrls, DB, SqlExpr, Provider, DBClient, Grids,
  DBGrids, Buttons, PngBitBtn, ExtCtrls;

type
  TfrmLMedicamento = class(TfrmLGenerico)
    Label1: TLabel;
    txtLocaliza: TEdit;
    Label2: TLabel;
    txtCampo: TComboBox;
    cdsTabCOD_MEDICAMENTO: TIntegerField;
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
  frmLMedicamento: TfrmLMedicamento;

implementation

uses UFuncoes, UAgentes, UMedicamento;

{$R *.dfm}

{ TfrmLAgentes }

procedure TfrmLMedicamento.AbreAgente;
begin
   Application.CreateForm(TfrmMedicamento, frmMedicamento);
   frmMedicamento.sqlTab.Close;
   frmMedicamento.cdsTab.Close;
   frmMedicamento.sqlTab.ParamByName('COD_MEDICAMENTO').AsInteger := cdsTabCOD_MEDICAMENTO.AsInteger;
   frmMedicamento.Campo := 'COD_MEDICAMENTO';
   frmMedicamento.cdsTab.Open;
   frmMedicamento.ShowModal;
  if cdsTab.Active then begin
   cdsTab.Refresh;
  end;
end;

procedure TfrmLMedicamento.btConsultarClick(Sender: TObject);
begin
MontaSql;
  inherited;
end;

procedure TfrmLMedicamento.btEditarClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLMedicamento.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLMedicamento.grdDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if key = 13 then
   AbreAgente;
end;

procedure TfrmLMedicamento.MontaSql;
begin
sql := 'SELECT * FROM MEDICAMENTOS';
if not Vazio(txtLocaliza.Text) then begin
  case txtCampo.ItemIndex of
    0: sql := sql + ' WHERE COD_MEDICAMENTO LIKE '+#39+txtLocaliza.Text+'%'+#39;
    1: sql := sql + ' WHERE DESCRICAO LIKE '+#39+txtLocaliza.Text+'%'+#39;
  end;
end;
  case txtCampo.ItemIndex of
      0: sql := sql +  ' ORDER BY COD_MEDICAMENTO';
      1: sql := sql +  ' ORDER BY DESCRICAO';
  end;
end;

end.
