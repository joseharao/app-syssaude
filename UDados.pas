unit UDados;

interface

uses
  SysUtils, Classes, WideStrings, DBXFirebird, DB, SqlExpr, FMTBcd, Provider,
  DBClient;

type
  TDados = class(TDataModule)
    DB: TSQLConnection;
    sqlBusca: TSQLQuery;
    sqlUsuario: TSQLQuery;
    cdsUsuario: TClientDataSet;
    dspUsuario: TDataSetProvider;
    dsUsuario: TDataSource;
    sqlParam: TSQLQuery;
    cdsParam: TClientDataSet;
    dspParam: TDataSetProvider;
    dsParam: TDataSource;
    cdsUsuarioCOD_USUARIO: TIntegerField;
    cdsUsuarioNOME: TStringField;
    cdsUsuarioSENHA: TStringField;
    cdsParamCOD_PARAM: TIntegerField;
    cdsParamDAT_CAD: TDateField;
    cdsParamDESCRICAO: TStringField;
    cdsParamRESPONSAVEL: TStringField;
    sqlClass: TSQLQuery;
    cdsClass: TClientDataSet;
    dspClass: TDataSetProvider;
    dsClass: TDataSource;
    cdsClassCOD_CLASS: TIntegerField;
    cdsClassDAT_CAD: TDateField;
    cdsClassDESCRICAO: TStringField;
    cdsClassACIMA_DE: TStringField;
    cdsClassIDADE_MIN: TIntegerField;
    cdsClassIDADE_MAX: TIntegerField;
    sqlPosicao: TSQLQuery;
    cdsPosicao: TClientDataSet;
    dspPosicao: TDataSetProvider;
    dsPosicao: TDataSource;
    cdsPosicaoCOD_POSICAO: TIntegerField;
    cdsPosicaoDAT_CAD: TDateField;
    cdsPosicaoDESCRICAO: TStringField;
    sqlAgente: TSQLQuery;
    cdsAgente: TClientDataSet;
    dspAgente: TDataSetProvider;
    dsAgente: TDataSource;
    cdsAgenteCOD_AGENTE: TIntegerField;
    cdsAgenteDAT_CAD: TDateField;
    cdsAgenteNOME_DO_AGENTE: TStringField;
    cdsAgentePOSICAO: TStringField;
    dsPessoa: TDataSource;
    dspPessoa: TDataSetProvider;
    cdsPessoa: TClientDataSet;
    sqlPessoa: TSQLQuery;
    cdsPessoaCOD_PESSOA: TIntegerField;
    cdsPessoaNOME: TStringField;
    sqlMed: TSQLQuery;
    cdsMed: TClientDataSet;
    dspMed: TDataSetProvider;
    dsMed: TDataSource;
    cdsMedCOD_MEDICAMENTO: TIntegerField;
    cdsMedNOME: TStringField;
    sqlDef: TSQLQuery;
    cdsDef: TClientDataSet;
    dspDef: TDataSetProvider;
    dsDef: TDataSource;
    dsAgravo: TDataSource;
    dspAgravo: TDataSetProvider;
    cdsAgravo: TClientDataSet;
    sqlAgravo: TSQLQuery;
    cdsAgravoCOD_AGRAVO: TIntegerField;
    cdsAgravoNOME: TStringField;
    cdsDefCOD_DEFICIENCIA: TIntegerField;
    cdsDefNOME: TStringField;
    cdsClassABAIXO_DE: TStringField;
    sqlVacina: TSQLQuery;
    cdsVacina: TClientDataSet;
    dspVacina: TDataSetProvider;
    dsVacina: TDataSource;
    cdsVacinaCOD_VACINA: TIntegerField;
    cdsVacinaNOME_VACINA: TStringField;
    cdsVacinaMES_PARA_APLICACAO: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dados: TDados;

implementation

{$R *.dfm}

end.
