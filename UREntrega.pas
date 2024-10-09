unit UREntrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URelPadrao, FMTBcd, RLFilters, RLPDFFilter, DB, SqlExpr, DBClient,
  Provider, RLReport, RLXLSFilter;

type
  TfrmREntrega = class(TfrmRelPadrao)
    cdsTabCOD_IND: TIntegerField;
    cdsTabNOME: TStringField;
    cdsTabIDADE: TStringField;
    cdsTabOBS: TBlobField;
    RLBand3: TRLBand;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    TipoRelatorio: TRLMemo;
    RLBand5: TRLBand;
    RLLabel6: TRLLabel;
    RLDraw4: TRLDraw;
    RLLabel5: TRLLabel;
    RLDraw3: TRLDraw;
    RLDraw2: TRLDraw;
    RLLabel4: TRLLabel;
    RLLabel3: TRLLabel;
    RLDraw1: TRLDraw;
    RLDraw9: TRLDraw;
    RLLabel7: TRLLabel;
    RLDraw11: TRLDraw;
    RLDBText4: TRLDBText;
    cdsTabCART_SUS: TStringField;
    RLDraw10: TRLDraw;
    RLLabel8: TRLLabel;
    RLDraw12: TRLDraw;
    RLDBText5: TRLDBText;
    cdsTabDAT_NASC: TDateField;
    cdsTabP_CONSULTA: TDateField;
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    tipo:string;
  end;

var
  frmREntrega: TfrmREntrega;

implementation

{$R *.dfm}

uses UFuncoes;

procedure TfrmREntrega.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if not vazio(tipo) then begin
      TipoRelatorio.Lines.Clear;
      TipoRelatorio.Lines.Add(tipo);
  end;
end;

end.
