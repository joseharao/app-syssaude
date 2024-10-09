unit ULClassificacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ULGenerico, FMTBcd, StdCtrls, DB, SqlExpr, Provider, DBClient, Grids,
  DBGrids, Buttons, PngBitBtn, ExtCtrls;

type
  TfrmLClassificacao = class(TfrmLGenerico)
    Label1: TLabel;
    txtLocaliza: TEdit;
    Label2: TLabel;
    txtCampo: TComboBox;
    cdsTabCOD_CLASS: TIntegerField;
    cdsTabDAT_CAD: TDateField;
    cdsTabDESCRICAO: TStringField;
    cdsTabACIMA_DE: TStringField;
    cdsTabIDADE_MIN: TIntegerField;
    cdsTabIDADE_MAX: TIntegerField;
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
  frmLClassificacao: TfrmLClassificacao;

implementation

uses UFuncoes, UClassificacao;

{$R *.dfm}

{ TfrmLAgentes }

procedure TfrmLClassificacao.AbreAgente;
begin
   Application.CreateForm(TfrmClassificacao, frmClassificacao);
   frmClassificacao.sqlTab.Close;
   frmClassificacao.cdsTab.Close;
   frmClassificacao.sqlTab.ParamByName('COD_CLASS').AsInteger := cdsTabCOD_CLASS.AsInteger;
   frmClassificacao.Campo := 'COD_CLASS';
   frmClassificacao.cdsTab.Open;
   frmClassificacao.ShowModal;
  if cdsTab.Active then begin
   cdsTab.Refresh;
  end;
end;

procedure TfrmLClassificacao.btConsultarClick(Sender: TObject);
begin
MontaSql;
  inherited;
end;

procedure TfrmLClassificacao.btEditarClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLClassificacao.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLClassificacao.grdDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if key = 13 then
   AbreAgente;
end;

procedure TfrmLClassificacao.MontaSql;
begin
sql := 'SELECT * FROM CLASSIFICACAO';
if not Vazio(txtLocaliza.Text) then begin
  case txtCampo.ItemIndex of
    0: sql := sql + ' WHERE COD_CLASS LIKE '+#39+txtLocaliza.Text+'%'+#39;
    1: sql := sql + ' WHERE DESCRICAO LIKE '+#39+txtLocaliza.Text+'%'+#39;
  end;
end;
  case txtCampo.ItemIndex of
      0: sql := sql +  ' ORDER BY COD_CLASS';
      1: sql := sql +  ' ORDER BY DESCRICAO';
  end;
end;

end.
