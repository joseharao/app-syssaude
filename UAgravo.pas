unit UAgravo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, FMTBcd, DB, SqlExpr, DBClient, Provider, StdCtrls, Buttons,
  PngBitBtn, pngimage, ExtCtrls, Mask, DBCtrls, rxToolEdit, RXDBCtrl;

type
  TfrmAgravo = class(TfrmPadrao)
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label7: TLabel;
    cdsTabCOD_AGRAVO: TIntegerField;
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
  frmAgravo: TfrmAgravo;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmAgravo.btGravarClick(Sender: TObject);
begin
if Vazio(DBEdit2.Text) then begin
   application.MessageBox('Informe a Descrição do Agravo.', 'Atenção', MB_IconQuestion);
   DBEdit2.SetFocus;
   Exit;
end;

  inherited;
end;

procedure TfrmAgravo.btNovoClick(Sender: TObject);
begin
  inherited;
  cdsTabCOD_AGRAVO.AsInteger := PegaSequencia('GEN_AGRAVO_ID');
  cdsTabDAT_CAD.AsDateTime := Date;
  DBEdit2.SetFocus;
end;

end.
