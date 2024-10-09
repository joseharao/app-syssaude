unit ULPosicao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ULGenerico, FMTBcd, StdCtrls, DB, SqlExpr, Provider, DBClient, Grids,
  DBGrids, Buttons, PngBitBtn, ExtCtrls;

type
  TfrmLPosicao = class(TfrmLGenerico)
    Label1: TLabel;
    txtLocaliza: TEdit;
    Label2: TLabel;
    txtCampo: TComboBox;
    cdsTabCOD_POSICAO: TIntegerField;
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
  frmLPosicao: TfrmLPosicao;

implementation

uses UFuncoes, UPosicao;

{$R *.dfm}

{ TfrmLAgentes }

procedure TfrmLPosicao.AbreAgente;
begin
   Application.CreateForm(TfrmPOsicao, frmPOsicao);
   frmPOsicao.sqlTab.Close;
   frmPOsicao.cdsTab.Close;
   frmPOsicao.sqlTab.ParamByName('COD_POSICAO').AsInteger := cdsTabCOD_POSICAO.AsInteger;
   frmPOsicao.Campo := 'COD_POSICAO';
   frmPOsicao.cdsTab.Open;
   frmPOsicao.ShowModal;
  if cdsTab.Active then begin
   cdsTab.Refresh;
  end;
end;

procedure TfrmLPosicao.btConsultarClick(Sender: TObject);
begin
MontaSql;
  inherited;
end;

procedure TfrmLPosicao.btEditarClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLPosicao.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLPosicao.grdDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if key = 13 then
   AbreAgente;
end;

procedure TfrmLPosicao.MontaSql;
begin
sql := 'SELECT * FROM POSICAO';
if not Vazio(txtLocaliza.Text) then begin
  case txtCampo.ItemIndex of
    0: sql := sql + ' WHERE COD_POSICAO LIKE '+#39+txtLocaliza.Text+'%'+#39;
    1: sql := sql + ' WHERE DESCRICAO LIKE '+#39+txtLocaliza.Text+'%'+#39;
  end;
end;
  case txtCampo.ItemIndex of
      0: sql := sql +  ' ORDER BY COD_POSICAO';
      1: sql := sql +  ' ORDER BY DESCRICAO';
  end;
end;

end.
