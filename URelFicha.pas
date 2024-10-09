unit URelFicha;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, URelPadrao, FMTBcd, RLXLSFilter, RLFilters, RLPDFFilter, DB, SqlExpr,
  DBClient, Provider, RLReport;

type
  TfrmRelFicha = class(TfrmRelPadrao)
    dsMed: TDataSource;
    dspMed: TDataSetProvider;
    cdsMed: TClientDataSet;
    cdsMedCOD_SEQ: TIntegerField;
    cdsMedCOD_PESSOA: TIntegerField;
    cdsMedCOD_MEDICAMENTO: TIntegerField;
    cdsMedCOD_REMEDIO: TStringField;
    sqlMed: TSQLQuery;
    sqlMedCOD_SEQ: TIntegerField;
    sqlMedCOD_PESSOA: TIntegerField;
    sqlMedCOD_MEDICAMENTO: TIntegerField;
    sqlDef: TSQLQuery;
    sqlDefCOD_SEQ: TIntegerField;
    sqlDefCOD_PESSOA: TIntegerField;
    sqlDefCOD_DEFICIENCIA: TIntegerField;
    cdsDef: TClientDataSet;
    cdsDefCOD_SEQ: TIntegerField;
    cdsDefCOD_PESSOA: TIntegerField;
    cdsDefCOD_DEFICIENCIA: TIntegerField;
    cdsDefDEFICIENCIA: TStringField;
    dspDef: TDataSetProvider;
    dsDef: TDataSource;
    dsDependente: TDataSource;
    dspDependente: TDataSetProvider;
    cdsDependente: TClientDataSet;
    cdsDependenteCOD_DEPENDENTE: TIntegerField;
    cdsDependenteCOD_PESSOA: TIntegerField;
    cdsDependenteCOD_DEP: TIntegerField;
    cdsDependenteCOD_DEPEN: TStringField;
    sqlDependente: TSQLQuery;
    sqlDependenteCOD_DEPENDENTE: TIntegerField;
    sqlDependenteCOD_PESSOA: TIntegerField;
    sqlDependenteCOD_DEP: TIntegerField;
    sqlAgravo: TSQLQuery;
    sqlAgravoCOD_SEQ: TIntegerField;
    sqlAgravoCOD_PESSOA: TIntegerField;
    sqlAgravoCOD_AGRAVO: TIntegerField;
    cdsAgravo: TClientDataSet;
    cdsAgravoCOD_SEQ: TIntegerField;
    cdsAgravoCOD_PESSOA: TIntegerField;
    cdsAgravoCOD_AGRAVO: TIntegerField;
    cdsAgravoAGRAVO: TStringField;
    dspAgravo: TDataSetProvider;
    dsAgravo: TDataSource;
    RLBand3: TRLBand;
    cdsTabCOD_PESSOA: TIntegerField;
    cdsTabCOD_IND: TIntegerField;
    cdsTabDAT_CAD: TDateField;
    cdsTabDAT_NASC: TDateField;
    cdsTabCOD_AGENTE: TIntegerField;
    cdsTabNOME: TStringField;
    cdsTabENDERECO: TStringField;
    cdsTabBAIRRO: TStringField;
    cdsTabCIDADE: TStringField;
    cdsTabUF: TStringField;
    cdsTabGRAU_INSTRUCAO: TStringField;
    cdsTabSEXO: TStringField;
    cdsTabGESTANTE: TStringField;
    cdsTabDUM: TDateField;
    cdsTabDPP: TDateField;
    cdsTabNIS: TStringField;
    cdsTabCART_SUS: TStringField;
    cdsTabOBS: TBlobField;
    cdsTabPOSICAO: TIntegerField;
    cdsTabAGENTE: TStringField;
    cdsTabDPOSICAO: TStringField;
    RLLabel3: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    cdsTabIDADE: TStringField;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    SubDependentes: TRLSubDetail;
    RLBand4: TRLBand;
    RLDBText19: TRLDBText;
    RLBand5: TRLBand;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    sqlDependenteNOME: TStringField;
    cdsDependenteNOME: TStringField;
    SubMedicamentos: TRLSubDetail;
    RLBand6: TRLBand;
    RLDBText18: TRLDBText;
    RLBand7: TRLBand;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    sqlMedDESCRICAO: TStringField;
    cdsMedDESCRICAO: TStringField;
    SubDeficiencia: TRLSubDetail;
    RLBand8: TRLBand;
    RLDBText20: TRLDBText;
    RLBand9: TRLBand;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    sqlDefDESCRICAO: TStringField;
    cdsDefDESCRICAO: TStringField;
    SubAgravo: TRLSubDetail;
    RLBand10: TRLBand;
    RLDBText21: TRLDBText;
    RLBand11: TRLBand;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    sqlAgravoDESCRICAO: TStringField;
    cdsAgravoDESCRICAO: TStringField;
    RLBand12: TRLBand;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    txtOBS: TRLMemo;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    procedure RLBand3BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand12BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelFicha: TfrmRelFicha;

implementation

{$R *.dfm}

procedure TfrmRelFicha.RLBand12BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  txtOBS.Lines.Clear;
  txtOBS.Lines.Add(cdsTabOBS.AsString);
end;

procedure TfrmRelFicha.RLBand3BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
 cdsMed.Close;
 sqlMed.Close;
 sqlMed.ParamByName('COD_PESSOA').AsInteger := cdsTabCOD_PESSOA.AsInteger;
 cdsMed.Open;

 cdsDependente.Close;
 sqlDependente.Close;
 sqlDependente.ParamByName('COD_PESSOA').AsInteger := cdsTabCOD_PESSOA.AsInteger;
 cdsDependente.Open;

 cdsDef.Close;
 sqlDef.Close;
 sqlDef.ParamByName('COD_PESSOA').AsInteger := cdsTabCOD_PESSOA.AsInteger;
 cdsDef.Open;

 cdsAgravo.Close;
 sqlAgravo.Close;
 sqlAgravo.ParamByName('COD_PESSOA').AsInteger := cdsTabCOD_PESSOA.AsInteger;
 cdsAgravo.Open;

  if not cdsMed.Eof then
     SubMedicamentos.Visible := true
  else
     SubMedicamentos.Visible := false;
  if not cdsDef.Eof then
     SubDeficiencia.Visible := true
  else
     SubDeficiencia.Visible := false;
  if not cdsDependente.Eof then
     SubDependentes.Visible := true
  else
     SubDependentes.Visible := false;
  if not cdsAgravo.Eof then
     SubAgravo.Visible := true
  else
     SubAgravo.Visible := false;
end;

end.
