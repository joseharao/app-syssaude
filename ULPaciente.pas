unit ULPaciente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ULGenerico, FMTBcd, StdCtrls, DB, SqlExpr, Provider, DBClient, Grids,
  DBGrids, Buttons, PngBitBtn, ExtCtrls, DBCtrls;

type
  TfrmLPacientes = class(TfrmLGenerico)
    Label1: TLabel;
    txtLocaliza: TEdit;
    Label2: TLabel;
    txtCampo: TComboBox;
    cdsTabCOD_PESSOA: TIntegerField;
    cdsTabCOD_IND: TIntegerField;
    cdsTabDAT_CAD: TDateField;
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
    cdsTabPOSICAO: TIntegerField;
    cdsTabAGENTE: TStringField;
    cdsTabDAT_NASC: TDateField;
    cdsTabIDADE_REAL: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    cdsTabIDADE: TSingleField;
    procedure MontaSql;
    procedure AbreAgente;
    procedure btConsultarClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure grdDadosDblClick(Sender: TObject);
    procedure grdDadosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBLookupComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBLookupComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLPacientes: TfrmLPacientes;

implementation

uses UFuncoes, UAgentes, UDados, UPessoa;

{$R *.dfm}

{ TfrmLAgentes }

procedure TfrmLPacientes.AbreAgente;
begin
   Application.CreateForm(TfrmPessoa, frmPessoa);
   frmPessoa.sqlTab.Close;
   frmPessoa.cdsTab.Close;
   frmPessoa.sqlTab.ParamByName('COD_PESSOA').AsInteger := cdsTabCOD_PESSOA.AsInteger;
   frmPessoa.Campo := 'COD_PESSOA';
   frmPessoa.cdsTab.Open;
   frmPessoa.ShowModal;
  if cdsTab.Active then begin
   cdsTab.Refresh;
  end;
end;

procedure TfrmLPacientes.btConsultarClick(Sender: TObject);
begin
MontaSql;
  inherited;
end;

procedure TfrmLPacientes.btEditarClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLPacientes.DBLookupComboBox1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key = VK_ESCAPE then
    DBLookupComboBox1.KeyValue := -1
end;

procedure TfrmLPacientes.DBLookupComboBox2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key = VK_ESCAPE then
    DBLookupComboBox2.KeyValue := -1
end;

procedure TfrmLPacientes.DBLookupComboBox3KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
if key = VK_ESCAPE then
    DBLookupComboBox3.KeyValue := -1
end;

procedure TfrmLPacientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dados.cdsAgente.Close;
  dados.cdsClass.Close;
  dados.cdsPosicao.Close;
  inherited;
end;

procedure TfrmLPacientes.FormShow(Sender: TObject);
begin
  inherited;
  dados.cdsAgente.Open;
  dados.cdsClass.Open;
  dados.cdsPosicao.Open;
end;

procedure TfrmLPacientes.grdDadosDblClick(Sender: TObject);
begin
  inherited;
  AbreAgente;
end;

procedure TfrmLPacientes.grdDadosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
 if key = 13 then
   AbreAgente;
end;

procedure TfrmLPacientes.MontaSql;
begin
sql := 'SELECT ' +
      '   P.*,' +
      ' A.NOME_DO_AGENTE AS AGENTE, (SELECT IDADE FROM CALCULA_IDADE(P.COD_PESSOA)) AS IDADE,' +
      '(SELECT IDADE_REAL FROM CALCULA_IDADE(P.COD_PESSOA)) AS IDADE_REAL ' +
      'FROM PESSOAS P, AGENTES A WHERE P.COD_AGENTE = A.COD_AGENTE';
if not Vazio(txtLocaliza.Text) then begin
  case txtCampo.ItemIndex of
    0: sql := sql + ' AND P.COD_PESSOA LIKE '+#39+txtLocaliza.Text+'%'+#39;
    1: sql := sql + ' AND P.NOME LIKE '+#39+txtLocaliza.Text+'%'+#39;
    2: sql := sql + ' AND P.NIS LIKE '+#39+txtLocaliza.Text+'%'+#39;
    3: sql := sql + ' AND P.CART_SUS LIKE '+#39+txtLocaliza.Text+'%'+#39;
  end;
end;
if not vazio(DBLookupComboBox1.Text) then begin
    sql := sql + ' AND P.COD_AGENTE = '+QuotedStr(dados.cdsAgenteCOD_AGENTE.AsString);
end;
if not vazio(DBLookupComboBox2.Text) then begin
    sql := sql + ' AND P.POSICAO = '+QuotedStr(dados.cdsPosicaoCOD_POSICAO.AsString);
end;
if not vazio(DBLookupComboBox3.Text) then begin
  if ((dados.cdsClassACIMA_DE.AsString = 'N') and (dados.cdsClassABAIXO_DE.AsString = 'N')) then begin
    sql := sql + ' AND CAST(((current_date - P.DAT_NASC) / 365.16) as FLOAT) BETWEEN (SELECT C.IDADE_MIN FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+') AND (SELECT C.IDADE_MAX FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+')';
  end else if (dados.cdsClassACIMA_DE.AsString = 'S') then begin
    sql := sql + ' AND CAST(((current_date - P.DAT_NASC) / 365.16) as FLOAT) >= (SELECT C.IDADE_MAX FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+')';
  end else if (dados.cdsClassABAIXO_DE.AsString = 'S') then begin
    sql := sql + ' AND CAST(((current_date - P.DAT_NASC) / 365.16) as FLOAT) < (SELECT C.IDADE_MAX FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+')';
  end;
end;
  case txtCampo.ItemIndex of
      0: sql := sql +  ' ORDER BY P.COD_PESSOA';
      1: sql := sql +  ' ORDER BY P.NOME';
  end;
end;

end.
