unit UDeficiencia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, FMTBcd, DB, SqlExpr, DBClient, Provider, StdCtrls, Buttons,
  PngBitBtn, pngimage, ExtCtrls, Mask, DBCtrls, rxToolEdit, RXDBCtrl;

type
  TfrmDeficiencia = class(TfrmPadrao)
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label7: TLabel;
    cdsTabCOD_DEFICIENCIA: TIntegerField;
    cdsTabDAT_CAD: TDateField;
    cdsTabDESCRICAO: TStringField;
    procedure btNovoClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDeficiencia: TfrmDeficiencia;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmDeficiencia.btGravarClick(Sender: TObject);
begin
if Vazio(DBEdit2.Text) then begin
   application.MessageBox('Informe a Descrição da Deficiência.', 'Atenção', MB_IconQuestion);
   DBEdit2.SetFocus;
   Exit;
end;
  inherited;
end;

procedure TfrmDeficiencia.btNovoClick(Sender: TObject);
begin
  inherited;
  cdsTabCOD_DEFICIENCIA.AsInteger := PegaSequencia('GEN_DEFICIENCIA_ID');
  cdsTabDAT_CAD.AsDateTime := Date;
  DBEdit2.SetFocus;
end;

end.
