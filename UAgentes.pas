unit UAgentes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, FMTBcd, DB, SqlExpr, DBClient, Provider, StdCtrls, Buttons,
  PngBitBtn, pngimage, ExtCtrls, Mask, DBCtrls, rxToolEdit, RXDBCtrl;

type
  TfrmAgentes = class(TfrmPadrao)
    cdsTabCOD_AGENTE: TIntegerField;
    cdsTabDAT_CAD: TDateField;
    cdsTabNOME_DO_AGENTE: TStringField;
    cdsTabPOSICAO: TStringField;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    Label7: TLabel;
    procedure btNovoClick(Sender: TObject);
    procedure btGravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAgentes: TfrmAgentes;

implementation

uses UFuncoes;

{$R *.dfm}

procedure TfrmAgentes.btGravarClick(Sender: TObject);
begin
if Vazio(DBEdit2.Text) then begin
   application.MessageBox('Informe o Nome do Agente.', 'Atenção', MB_IconQuestion);
   DBEdit2.SetFocus;
   Exit;
end;

  inherited;
end;

procedure TfrmAgentes.btNovoClick(Sender: TObject);
begin
  inherited;
  cdsTabCOD_AGENTE.AsInteger := PegaSequencia('GEN_AGENTES_ID');
  cdsTabDAT_CAD.AsDateTime := Date;
  DBEdit2.SetFocus;
end;

end.
