unit UPessoa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UPadrao, FMTBcd, DB, SqlExpr, DBClient, Provider, StdCtrls, Buttons,
  PngBitBtn, pngimage, ExtCtrls, ComCtrls, DBCtrls, rxToolEdit, RXDBCtrl, Mask,
  Grids, DBGrids;

type
  TfrmPessoa = class(TfrmPadrao)
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
    cdsTabGESTANTE: TStringField;
    cdsTabDUM: TDateField;
    cdsTabDPP: TDateField;
    cdsTabNIS: TStringField;
    cdsTabCART_SUS: TStringField;
    cdsTabPOSICAO: TIntegerField;
    sqlTabCOD_PESSOA: TIntegerField;
    sqlTabCOD_IND: TIntegerField;
    sqlTabDAT_CAD: TDateField;
    sqlTabDAT_NASC: TDateField;
    sqlTabCOD_AGENTE: TIntegerField;
    sqlTabNOME: TStringField;
    sqlTabENDERECO: TStringField;
    sqlTabBAIRRO: TStringField;
    sqlTabCIDADE: TStringField;
    sqlTabUF: TStringField;
    sqlTabGRAU_INSTRUCAO: TStringField;
    sqlTabGESTANTE: TStringField;
    sqlTabDUM: TDateField;
    sqlTabDPP: TDateField;
    sqlTabNIS: TStringField;
    sqlTabCART_SUS: TStringField;
    sqlTabPOSICAO: TIntegerField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    lblNome: TLabel;
    lblApelido: TLabel;
    lblDNascimento: TLabel;
    lblCPF: TLabel;
    lblRG: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBDateEdit1: TDBDateEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBDateEdit2: TDBDateEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    Label10: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    Label12: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label13: TLabel;
    Label14: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    grpGestante: TGroupBox;
    txtGestante: TDBCheckBox;
    Label15: TLabel;
    DBDateEdit3: TDBDateEdit;
    Label16: TLabel;
    DBDateEdit4: TDBDateEdit;
    sqlTabSEXO: TStringField;
    cdsTabSEXO: TStringField;
    txtIdade: TEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    dsDependente: TDataSource;
    dspDependente: TDataSetProvider;
    cdsDependente: TClientDataSet;
    sqlDependente: TSQLQuery;
    sqlDependenteCOD_DEPENDENTE: TIntegerField;
    sqlDependenteCOD_PESSOA: TIntegerField;
    cdsDependenteCOD_DEPENDENTE: TIntegerField;
    cdsDependenteCOD_PESSOA: TIntegerField;
    sqlDependenteCOD_DEP: TIntegerField;
    cdsDependenteCOD_DEP: TIntegerField;
    cdsDependenteCOD_DEPEN: TStringField;
    Label17: TLabel;
    DBGrid2: TDBGrid;
    DBNavigator2: TDBNavigator;
    DBGrid3: TDBGrid;
    DBNavigator3: TDBNavigator;
    DBGrid4: TDBGrid;
    DBNavigator4: TDBNavigator;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    dsMed: TDataSource;
    dspMed: TDataSetProvider;
    cdsMed: TClientDataSet;
    sqlMed: TSQLQuery;
    dsDef: TDataSource;
    dspDef: TDataSetProvider;
    cdsDef: TClientDataSet;
    sqlDef: TSQLQuery;
    dsAgravo: TDataSource;
    dspAgravo: TDataSetProvider;
    cdsAgravo: TClientDataSet;
    sqlAgravo: TSQLQuery;
    sqlMedCOD_SEQ: TIntegerField;
    sqlMedCOD_PESSOA: TIntegerField;
    sqlMedCOD_MEDICAMENTO: TIntegerField;
    cdsMedCOD_SEQ: TIntegerField;
    cdsMedCOD_PESSOA: TIntegerField;
    cdsMedCOD_MEDICAMENTO: TIntegerField;
    cdsMedCOD_REMEDIO: TStringField;
    sqlDefCOD_SEQ: TIntegerField;
    sqlDefCOD_PESSOA: TIntegerField;
    sqlDefCOD_DEFICIENCIA: TIntegerField;
    cdsDefCOD_SEQ: TIntegerField;
    cdsDefCOD_PESSOA: TIntegerField;
    cdsDefCOD_DEFICIENCIA: TIntegerField;
    sqlAgravoCOD_SEQ: TIntegerField;
    sqlAgravoCOD_PESSOA: TIntegerField;
    sqlAgravoCOD_AGRAVO: TIntegerField;
    cdsAgravoCOD_SEQ: TIntegerField;
    cdsAgravoCOD_PESSOA: TIntegerField;
    cdsAgravoCOD_AGRAVO: TIntegerField;
    cdsAgravoAGRAVO: TStringField;
    cdsDefDEFICIENCIA: TStringField;
    btImprimir: TPngBitBtn;
    DBCheckBox1: TDBCheckBox;
    sqlTabOBS: TBlobField;
    sqlTabSEM_COMPLICACAO: TStringField;
    sqlTabANGINA: TStringField;
    sqlTabIAM: TStringField;
    sqlTabAVC: TStringField;
    sqlTabPE_DIABETICO: TStringField;
    sqlTabAMBUTACAO: TStringField;
    sqlTabDOECA_RENAL: TStringField;
    sqlTabRETINOPATIA: TStringField;
    cdsTabOBS: TBlobField;
    cdsTabSEM_COMPLICACAO: TStringField;
    cdsTabANGINA: TStringField;
    cdsTabIAM: TStringField;
    cdsTabAVC: TStringField;
    cdsTabPE_DIABETICO: TStringField;
    cdsTabAMBUTACAO: TStringField;
    cdsTabDOECA_RENAL: TStringField;
    cdsTabRETINOPATIA: TStringField;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    DBCheckBox7: TDBCheckBox;
    DBCheckBox8: TDBCheckBox;
    sqlTabALCOLISMO: TStringField;
    sqlTabOBESIDADE: TStringField;
    sqlTabFUMANTE: TStringField;
    cdsTabALCOLISMO: TStringField;
    cdsTabOBESIDADE: TStringField;
    cdsTabFUMANTE: TStringField;
    DBCheckBox9: TDBCheckBox;
    DBCheckBox10: TDBCheckBox;
    DBCheckBox11: TDBCheckBox;
    sqlTabESCOLA: TStringField;
    cdsTabESCOLA: TStringField;
    Label21: TLabel;
    DBEdit10: TDBEdit;
    DBCheckBox12: TDBCheckBox;
    sqlTabUSA_MED_CONT: TStringField;
    cdsTabUSA_MED_CONT: TStringField;
    sqlTabDISLIPIDEMIA: TStringField;
    sqlTabACAMADO: TStringField;
    sqlTabDOMICILIADO: TStringField;
    sqlTabDESNUTRICAO: TStringField;
    sqlTabDROGRADICAO: TStringField;
    sqlTabDESEMPREGO: TStringField;
    sqlTabANALFABETISMO: TStringField;
    sqlTabMENOR_6MESES: TStringField;
    sqlTabMAIOR_70ANOS: TStringField;
    cdsTabDISLIPIDEMIA: TStringField;
    cdsTabACAMADO: TStringField;
    cdsTabDOMICILIADO: TStringField;
    cdsTabDESNUTRICAO: TStringField;
    cdsTabDROGRADICAO: TStringField;
    cdsTabDESEMPREGO: TStringField;
    cdsTabANALFABETISMO: TStringField;
    cdsTabMENOR_6MESES: TStringField;
    cdsTabMAIOR_70ANOS: TStringField;
    DBCheckBox13: TDBCheckBox;
    DBCheckBox14: TDBCheckBox;
    DBCheckBox15: TDBCheckBox;
    DBCheckBox16: TDBCheckBox;
    DBCheckBox17: TDBCheckBox;
    DBCheckBox18: TDBCheckBox;
    DBMemo1: TDBMemo;
    Label22: TLabel;
    DBCheckBox19: TDBCheckBox;
    sqlTabALIMENTACAO: TStringField;
    sqlTabSEDETARISMO: TStringField;
    cdsTabALIMENTACAO: TStringField;
    cdsTabSEDETARISMO: TStringField;
    DBCheckBox20: TDBCheckBox;
    DBCheckBox21: TDBCheckBox;
    Label23: TLabel;
    DBDateEdit5: TDBDateEdit;
    sqlTabDAT_CONSULTA: TDateField;
    cdsTabDAT_CONSULTA: TDateField;
    procedure btNovoClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure PegaIdade;
    procedure btGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsTabSEXOChange(Sender: TField);
    procedure cdsDependenteAfterInsert(DataSet: TDataSet);
    procedure cdsDependenteAfterPost(DataSet: TDataSet);
    procedure PegaDependentes;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cdsMedAfterInsert(DataSet: TDataSet);
    procedure cdsMedAfterPost(DataSet: TDataSet);
    procedure cdsDefAfterPost(DataSet: TDataSet);
    procedure cdsDefAfterInsert(DataSet: TDataSet);
    procedure cdsAgravoAfterInsert(DataSet: TDataSet);
    procedure cdsAgravoAfterPost(DataSet: TDataSet);
    procedure PageControl1Changing(Sender: TObject; var AllowChange: Boolean);
    procedure cdsTabReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPessoa: TfrmPessoa;

implementation

uses UDados, UFuncoes, URelFicha;

{$R *.dfm}

procedure TfrmPessoa.btEditarClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TfrmPessoa.btGravarClick(Sender: TObject);
begin
if Vazio(DBLookupComboBox1.Text) then begin
   application.MessageBox('Informe o Agente de Saúde.', 'Atenção', MB_IconQuestion);
   DBLookupComboBox1.SetFocus;
   Exit;
end;
if Vazio(DBLookupComboBox2.Text) then begin
   application.MessageBox('Informe a Posição.', 'Atenção', MB_IconQuestion);
   DBLookupComboBox2.SetFocus;
   Exit;
end;
if not DataValida(DBDateEdit1.Text) then begin
   application.MessageBox('Informe a Data do Cadastro.', 'Atenção', MB_IconQuestion);
   DBDateEdit1.SetFocus;
   Exit;
end;
if not DataValida(DBDateEdit2.Text) then begin
   application.MessageBox('Informe a Data de Nascimento.', 'Atenção', MB_IconQuestion);
   DBDateEdit2.SetFocus;
   Exit;
end;
if Vazio(DBEdit2.Text) then begin
   application.MessageBox('Informe o Nome da Pessoa.', 'Atenção', MB_IconQuestion);
   DBEdit2.SetFocus;
   Exit;
end;
  inherited;
  PegaIdade;
end;

procedure TfrmPessoa.btImprimirClick(Sender: TObject);
begin
  inherited;
 if application.MessageBox('Deseja Realmente Imprmir a Ficha Cadastral?', 'Confirmação', mb_yesNo + mb_iconQuestion) = idYes then begin
    Application.CreateForm(tfrmRelFicha, frmRelFicha);
       frmRelFicha.cdsTab.Close;
       frmRelFicha.sqlTab.Close;
       frmRelFicha.sqlTab.ParamByName('COD_PESSOA').AsInteger := cdsTabCOD_PESSOA.AsInteger;
       frmRelFicha.cdsTab.Open;
    if frmRelFicha.cdsTab.Eof then begin
       Application.MessageBox('Não Há Dados a Serem Impressos.', 'Atenção', MB_ICONEXCLAMATION);
       frmRelFicha.cdsTab.Close;
       frmRelFicha.FreeOnRelease;
    end else begin
       frmRelFicha.RLReport1.PreviewModal;
       frmRelFicha.cdsTab.Close;
       frmRelFicha.FreeOnRelease;
    end;
 end;
end;

procedure TfrmPessoa.btNovoClick(Sender: TObject);
begin
  inherited;
  cdsTabCOD_PESSOA.AsInteger := PegaSequencia('GEN_PESSOAS_ID');
  cdsTabDAT_CAD.AsDateTime := Date;
  //cdsTabCOD_IND.AsInteger := cdsTab.RecordCount + 1;
  cdsTabGESTANTE.AsString := 'N';
  cdsTabBAIRRO.AsString := 'DISTRITO DE CANIDEZINHO';
  cdsTabCIDADE.AsString := 'V. ALEGRE';
  cdsTabUF.AsString := 'CE';
  DBEdit2.SetFocus;
  PegaIdade;
end;

procedure TfrmPessoa.cdsAgravoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsAgravoCOD_SEQ.AsInteger := PegaSequencia('GEN_AGRAVOXPESSOA_ID');
  cdsAgravoCOD_PESSOA.AsInteger := cdsTabCOD_PESSOA.AsInteger;
end;

procedure TfrmPessoa.cdsAgravoAfterPost(DataSet: TDataSet);
begin
  inherited;
  TClientDataSet(cdsAgravo).ApplyUpdates(-1);
end;

procedure TfrmPessoa.cdsDefAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsDefCOD_SEQ.AsInteger := PegaSequencia('GEN_DEFXPESSOA_ID');
  cdsDefCOD_PESSOA.AsInteger := cdsTabCOD_PESSOA.AsInteger;
end;

procedure TfrmPessoa.cdsDefAfterPost(DataSet: TDataSet);
begin
  inherited;
  TClientDataSet(cdsDef).ApplyUpdates(-1);
end;

procedure TfrmPessoa.cdsDependenteAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsDependenteCOD_DEPENDENTE.AsInteger := PegaSequencia('GEN_DEPENDENTES_ID');
  cdsDependenteCOD_PESSOA.AsInteger := cdsTabCOD_PESSOA.AsInteger;
end;

procedure TfrmPessoa.cdsDependenteAfterPost(DataSet: TDataSet);
begin
  inherited;
  TClientDataSet(cdsDependente).ApplyUpdates(-1);
end;

procedure TfrmPessoa.cdsMedAfterInsert(DataSet: TDataSet);
begin
  inherited;
  cdsMedCOD_SEQ.AsInteger := PegaSequencia('GEN_MEDXPESSOA_ID');
  cdsMedCOD_PESSOA.AsInteger := cdsTabCOD_PESSOA.AsInteger;
end;

procedure TfrmPessoa.cdsMedAfterPost(DataSet: TDataSet);
begin
  inherited;
  TClientDataSet(cdsMed).ApplyUpdates(-1);
end;

procedure TfrmPessoa.cdsTabReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  application.MessageBox(Pchar('Erro no dados: ' + e.Message), 'Erro na Gravação', MB_ICONERROR);
end;

procedure TfrmPessoa.cdsTabSEXOChange(Sender: TField);
begin
  inherited;
  if cdsTabSEXO.AsString = 'Masculino' then begin
     txtGestante.Enabled := false;
     grpGestante.Enabled := false;
  end else begin
     txtGestante.Enabled := true;
     grpGestante.Enabled := true;
  end;
end;

procedure TfrmPessoa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dados.cdsPessoa.Close;
  dados.cdsAgravo.Close;
  dados.cdsMed.Close;
  dados.cdsDef.Close;
  inherited;
end;

procedure TfrmPessoa.FormShow(Sender: TObject);
begin
  inherited;
  PageControl1.ActivePageIndex := 0;
  PegaIdade;
  if cdsTabSEXO.AsString = 'Masculino' then begin
     txtGestante.Enabled := false;
     grpGestante.Enabled := false;
  end else begin
     txtGestante.Enabled := true;
     grpGestante.Enabled := true;
  end;
  dados.cdsPessoa.Open;
  dados.cdsAgravo.Open;
  dados.cdsMed.Open;
  dados.cdsDef.Open;
  PegaDependentes;
end;

procedure TfrmPessoa.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if dsTab.State in [dsEdit, dsInsert] then begin
     AllowChange := false;
  end else begin
     AllowChange := true;
  end;
end;

procedure TfrmPessoa.PegaDependentes;
begin
  cdsDependente.Close;
  sqlDependente.Close;
  sqlDependente.ParamByName('COD_PESSOA').AsInteger := cdsTabCOD_PESSOA.AsInteger;
  cdsDependente.Open;

  cdsMed.Close;
  sqlMed.Close;
  sqlMed.ParamByName('COD_PESSOA').AsInteger := cdsTabCOD_PESSOA.AsInteger;
  cdsMed.Open;

  cdsAgravo.Close;
  sqlAgravo.Close;
  sqlAgravo.ParamByName('COD_PESSOA').AsInteger := cdsTabCOD_PESSOA.AsInteger;
  cdsAgravo.Open;

  cdsDef.Close;
  sqlDef.Close;
  sqlDef.ParamByName('COD_PESSOA').AsInteger := cdsTabCOD_PESSOA.AsInteger;
  cdsDef.Open;
end;

procedure TfrmPessoa.PegaIdade;
begin
  AbreTabela('SELECT IDADE_REAL FROM CALCULA_IDADE('+QuotedStr(cdsTabCOD_PESSOA.AsString)+')', dados.sqlBusca);
  txtIdade.Text := dados.sqlBusca.FieldByName('IDADE_REAL').AsString;
  Dados.sqlBusca.Close;
end;

end.
