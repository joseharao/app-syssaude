unit UParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, FMTBcd, DB, SqlExpr, DBClient, Provider, StdCtrls, Buttons,
  PngBitBtn, pngimage, ExtCtrls, Mask, DBCtrls, rxToolEdit, RXDBCtrl;

type
  TfrmParam = class(TfrmPadrao)
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label7: TLabel;
    cdsTabCOD_PARAM: TIntegerField;
    cdsTabDAT_CAD: TDateField;
    cdsTabDESCRICAO: TStringField;
    cdsTabRESPONSAVEL: TStringField;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    procedure btNovoClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParam: TfrmParam;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmParam.btGravarClick(Sender: TObject);
begin
if Vazio(DBEdit2.Text) then begin
   application.MessageBox('Informe o Nome do PSF.', 'Atenção', MB_IconQuestion);
   DBEdit2.SetFocus;
   Exit;
end;
  Cod_Padrao := 0;
  inherited;
end;

procedure TfrmParam.btNovoClick(Sender: TObject);
begin
  inherited;
  cdsTabCOD_PARAM.AsInteger := PegaSequencia('GEN_PARAM_ID');
  cdsTabDAT_CAD.AsDateTime := Date;
  DBEdit2.SetFocus;
end;

end.
