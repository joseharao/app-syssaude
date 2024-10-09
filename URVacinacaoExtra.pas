unit URVacinacaoExtra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, URelPadrao, Data.FMTBcd, RLXLSFilter,
  RLFilters, RLPDFFilter, Data.SqlExpr, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, RLReport;

type
  TfrmRVacinacaoExtra = class(TfrmRelPadrao)
    cdsTabCOD_VACINA: TIntegerField;
    cdsTabNOME_VACINA: TStringField;
    cdsTabIDADE: TLargeintField;
    cdsTabNOME_CRIANCA: TStringField;
    cdsTabCOD_AGENTE: TIntegerField;
    cdsTabNOME_AGENTE: TStringField;
    cdsTabDAT_NASC: TDateField;
    cdsTabCART_SUS: TStringField;
    cdsTabOBS: TBlobField;
    RLGrupoVacina: TRLGroup;
    RLBand5: TRLBand;
    RLDraw4: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw2: TRLDraw;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel5: TRLLabel;
    RLDraw9: TRLDraw;
    RLLabel7: TRLLabel;
    RLDraw10: TRLDraw;
    RLLabel8: TRLLabel;
    RLBand3: TRLBand;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDraw11: TRLDraw;
    RLDBText4: TRLDBText;
    RLDraw12: TRLDraw;
    RLDBText5: TRLDBText;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLBand6: TRLBand;
    RLDBResult2: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDraw1: TRLDraw;
    RLDraw5: TRLDraw;
    RLLabel3: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    cdsTabDOSE: TStringField;
    cdsTabDESCRICAO: TStringField;
    cdsTabIDADE_VACINA: TStringField;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRVacinacaoExtra: TfrmRVacinacaoExtra;

implementation

{$R *.dfm}

end.
