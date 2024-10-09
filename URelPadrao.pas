unit URelPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, FMTBcd, DB, SqlExpr, DBClient, Provider, RLFilters,
  RLPDFFilter, RLXLSFilter;

type
  TfrmRelPadrao = class(TForm)
    RLReport1: TRLReport;
    dsTab: TDataSource;
    dspTab: TDataSetProvider;
    cdsTab: TClientDataSet;
    sqlTab: TSQLQuery;
    RLPDFFilter1: TRLPDFFilter;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLBand2: TRLBand;
    RLLabel2: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLXLSFilter1: TRLXLSFilter;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelPadrao: TfrmRelPadrao;

implementation

uses UDados;

{$R *.dfm}

procedure TfrmRelPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    release;
end;

end.
