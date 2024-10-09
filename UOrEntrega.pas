unit UOrEntrega;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UOrPadrao, ExtCtrls, StdCtrls, Buttons, PngBitBtn, pngimage, DBCtrls,
  Grids, DBGrids;

type
  TfrmOrEntrega = class(TfrmOrPadrao)
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    DBLookupComboBox3: TDBLookupComboBox;
    GroupBox5: TGroupBox;
    DBLookupComboBox4: TDBLookupComboBox;
    GroupBox6: TGroupBox;
    DBLookupComboBox5: TDBLookupComboBox;
    txtSexo: TRadioGroup;
    chkGravida: TCheckBox;
    GroupBox7: TGroupBox;
    DBLookupComboBox6: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    txtMInicio: TEdit;
    Label2: TLabel;
    txtMFim: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    txtAIni: TEdit;
    Label6: TLabel;
    txtAFim: TEdit;
    Label7: TLabel;
    chkSComp: TCheckBox;
    chkangina: TCheckBox;
    chkIAM: TCheckBox;
    chkAVC: TCheckBox;
    chkPeDiabetico: TCheckBox;
    chkAmputacao: TCheckBox;
    chkDoenca: TCheckBox;
    chkRetnopatia: TCheckBox;
    chkObsidade: TCheckBox;
    chkFumante: TCheckBox;
    chkAlcoolismo: TCheckBox;
    chkMedicamento: TCheckBox;
    chkAnalfa: TCheckBox;
    chkDislipidemia: TCheckBox;
    chkAcamado: TCheckBox;
    chkDomiciliado: TCheckBox;
    chkDesnutricao: TCheckBox;
    chkDesemprego: TCheckBox;
    chkSedetar: TCheckBox;
    chkAlimentacao: TCheckBox;
    chkMasCondicoes: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOrEntrega: TfrmOrEntrega;

implementation

uses UDados, UFuncoes, UREntrega;

{$R *.dfm}

procedure TfrmOrEntrega.btImprimirClick(Sender: TObject);
var
  a : String;
  i : integer;
  t : string;
begin
  inherited;
if application.MessageBox('Deseja Imprimir Listagem Agora?', 'Confirmação', MB_YesNo + MB_IconQuestion) = id_Yes then begin
    sql := 'SELECT ' +
           ' P.COD_IND, ' +
           ' P.NOME, '+
           ' (SELECT IDADE_REAL FROM CALCULA_IDADE(P.COD_PESSOA)) AS IDADE, ' +
           '    dateadd (180 day to p.dat_consulta) as p_consulta,'+
           ' P.OBS, P.CART_SUS, P.DAT_NASC ' +
           ' FROM PESSOAS P';

 if pos('WHERE', sql) > 0 then begin
   case txtSexo.ItemIndex of
      0: sql := sql + ' AND P.SEXO IN (''Masculino'')';
      1: sql := sql + ' AND P.SEXO IN (''Feminino'')';
      2: sql := sql + ' AND P.SEXO IN (''Feminino'', ''Masculino'')';
   end;
   t := 'Filtrado Por: ';
 end else begin
   case txtSexo.ItemIndex of
      0: sql := sql + ' WHERE P.SEXO IN (''Masculino'')';
      1: sql := sql + ' WHERE P.SEXO IN (''Feminino'')';
      2: sql := sql + ' WHERE P.SEXO IN (''Feminino'', ''Masculino'')';
   end;
      t := 'Filtrado Por: ';
 end;

 if chkGravida.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.GESTANTE = ''S'' AND P.DPP >= CURRENT_DATE';
    end else begin
       sql := sql + ' WHERE P.GESTANTE = ''S'' AND P.DPP >= CURRENT_DATE';
    end;
    t := t + ' Gestação: Sim';
 end;
 if chkSComp.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.SEM_COMPLICACAO = ''S''';
    end else begin
       sql := sql + ' WHERE P.SEM_COMPLICACAO = ''S''';
    end;
    t := t + ' S. Complic: Sim';
 end;
 if chkangina.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.ANGINA = ''S''';
    end else begin
       sql := sql + ' WHERE P.ANGINA = ''S''';
    end;
    t := t + ' Angina: Sim';
 end;
 if chkIAM.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.IAM = ''S''';
    end else begin
       sql := sql + ' WHERE P.IAM = ''S''';
    end;
    t := t + ' IAM: Sim';
 end;
 if chkAVC.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.AVC = ''S''';
    end else begin
       sql := sql + ' WHERE P.AVC = ''S''';
    end;
    t := t + ' AVC: Sim';
 end;
 if chkPeDiabetico.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.PE_DIABETICO = ''S''';
    end else begin
       sql := sql + ' WHERE P.PE_DIABETICO = ''S''';
    end;
    t := t + ' P. DIABÉTICO: Sim';
 end;
 if chkAmputacao.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.AMBUTACAO = ''S''';
    end else begin
       sql := sql + ' WHERE P.AMBUTACAO = ''S''';
    end;
    t := t + ' AMPUTAÇÃO: Sim';
 end;
 if chkDoenca.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.DOECA_RENAL = ''S''';
    end else begin
       sql := sql + ' WHERE P.DOECA_RENAL = ''S''';
    end;
    t := t + ' DOENÇA RENAL: Sim';
 end;
 if chkRetnopatia.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.RETINOPATIA = ''S''';
    end else begin
       sql := sql + ' WHERE P.RETINOPATIA = ''S''';
    end;
    t := t + ' REINOPÁTIA: Sim';
 end;
 if chkObsidade.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.OBESIDADE = ''S''';
    end else begin
       sql := sql + ' WHERE P.OBESIDADE = ''S''';
    end;
    t := t + ' OBESIDADE: Sim';
 end;
 if chkFumante.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.FUMANTE = ''S''';
    end else begin
       sql := sql + ' WHERE P.FUMANTE = ''S''';
    end;
        t := t + ' FUMANTE: Sim';
 end;
 if chkAlcoolismo.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.ALCOLISMO = ''S''';
    end else begin
       sql := sql + ' WHERE P.ALCOLISMO = ''S''';
    end;
        t := t + ' ALCOLISMO: Sim';
 end;
 if chkMedicamento.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.USA_MED_CONT = ''S''';
    end else begin
       sql := sql + ' WHERE P.USA_MED_CONT = ''S''';
    end;
    t := t + ' MED. CONTROLADO: Sim';
 end;
 if chkAnalfa.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.ANALFABETISMO = ''S''';
    end else begin
       sql := sql + ' WHERE P.ANALFABETISMO = ''S''';
    end;
    t := t + ' Analfabeto: Sim';
 end;
 if chkAcamado.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.ACAMADO = ''S''';
    end else begin
       sql := sql + ' WHERE P.ACAMADO = ''S''';
    end;
    t := t + ' Acamado: Sim';
 end;
 if chkDislipidemia.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.DISLIPIDEMIA = ''S''';
    end else begin
       sql := sql + ' WHERE P.DISLIPIDEMIA = ''S''';
    end;
    t := t + ' DISLIPIDEMIA: Sim';
 end;
 if chkDomiciliado.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.DOMICILIADO = ''S''';
    end else begin
       sql := sql + ' WHERE P.DOMICILIADO = ''S''';
    end;
    t := t + ' DOMICILIADO: Sim';
 end;
 if chkDesnutricao.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.DESNUTRICAO = ''S''';
    end else begin
       sql := sql + ' WHERE P.DESNUTRICAO = ''S''';
    end;
    t := t + ' DESNUTRICAO: Sim';
 end;
 if chkDesemprego.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.DESEMPREGO = ''S''';
    end else begin
       sql := sql + ' WHERE P.DESEMPREGO = ''S''';
    end;
    t := t + ' DESEMPREGADO: Sim';
 end;
 if chkMasCondicoes.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.MENOR_6MESES = ''S''';
    end else begin
       sql := sql + ' WHERE P.MENOR_6MESES = ''S''';
    end;
    t := t + ' MENOR 6 MESES: Sim';
 end;
 if chkAlimentacao.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.ALIMENTACAO = ''S''';
    end else begin
       sql := sql + ' WHERE P.ALIMENTACAO = ''S''';
    end;
    t := t + ' ALIMENTAÇÃO: Sim';
 end;
 if chkDesemprego.Checked then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.SEDETARISMO = ''S''';
    end else begin
       sql := sql + ' WHERE P.SEDETARISMO = ''S''';
    end;
        t := t + ' SEDETARISMO: Sim';
 end;

 if not vazio(DBLookupComboBox1.Text) then begin
  if ((dados.cdsClassACIMA_DE.AsString = 'N') and (dados.cdsClassABAIXO_DE.AsString = 'N')) then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND CAST(((current_date - P.DAT_NASC) / 365.16) as FLOAT) BETWEEN (SELECT C.IDADE_MIN FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+') AND (SELECT C.IDADE_MAX FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+')';
    end else begin
       sql := sql + ' WHERE CAST(((current_date - P.DAT_NASC) / 365.16) as FLOAT) BETWEEN (SELECT C.IDADE_MIN FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+') AND (SELECT C.IDADE_MAX FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+')';
    end;
  end else if dados.cdsClassACIMA_DE.AsString = 'S' then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND CAST(((current_date - P.DAT_NASC) / 365.16) as FLOAT) >= (SELECT C.IDADE_MAX FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+')';
    end else begin
       sql := sql + ' WHERE CAST(((current_date - P.DAT_NASC) / 365.16) as FLOAT) >= (SELECT C.IDADE_MAX FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+')';
    end;
  end else if dados.cdsClassABAIXO_DE.AsString = 'S' then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND CAST(((current_date - P.DAT_NASC) / 365.16) as FLOAT) < (SELECT C.IDADE_MAX FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+')';
    end else begin
       sql := sql + ' WHERE CAST(((current_date - P.DAT_NASC) / 365.16) as FLOAT) < (SELECT C.IDADE_MAX FROM CLASSIFICACAO C WHERE C.COD_CLASS = '+QuotedStr(dados.cdsClassCOD_CLASS.AsString)+')';
    end;
  end;
 end;
 if not Vazio(txtMInicio.Text) and not vazio(txtMFim.Text) then begin
    if pos('WHERE', sql) > 0 then begin
        sql := sql + ' AND ((EXTRACT(month FROM CURRENT_DATE) - EXTRACT(month FROM P.DAT_NASC)+12)) BETWEEN ' + QuotedStr(txtMInicio.Text) + ' AND ' + QuotedStr(txtMFim.Text) +  ' AND ((EXTRACT(month FROM CURRENT_DATE) - EXTRACT(month FROM P.DAT_NASC)+12) < 12) AND CAST(((current_date - P.DAT_NASC) / 365.16) as FLOAT) < 1';
    end else begin
        sql := sql + ' WHERE ((EXTRACT(month FROM CURRENT_DATE) - EXTRACT(month FROM P.DAT_NASC)+12)) BETWEEN ' + QuotedStr(txtMInicio.Text) + ' AND ' + QuotedStr(txtMFim.Text) + '  AND ((EXTRACT(month FROM CURRENT_DATE) - EXTRACT(month FROM P.DAT_NASC)+12) < 12) AND CAST(((current_date - P.DAT_NASC) / 365.16) as FLOAT) < 1';
    end;
 end;
 if not Vazio(txtAIni.Text) and not vazio(txtAFim.Text) then begin
   if pos('WHERE', sql) > 0 then begin
      sql := sql + 'AND ((EXTRACT(year FROM CURRENT_DATE) - EXTRACT(year FROM P.DAT_NASC))-1 ) BETWEEN ' + QuotedStr(txtAIni.Text) + ' AND ' + QuotedStr(txtAFim.Text);
   end else begin
      sql := sql + 'WHERE ((EXTRACT(year FROM CURRENT_DATE) - EXTRACT(year FROM P.DAT_NASC))-1 ) BETWEEN ' + QuotedStr(txtAIni.Text) + ' AND ' + QuotedStr(txtAFim.Text);
   end;
 end;
 if not vazio(DBLookupComboBox2.Text) then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.POSICAO IN ('+QuotedStr(dados.cdsPosicaoCOD_POSICAO.AsString)+')';
    end else begin
       sql := sql + ' WHERE P.POSICAO IN ('+QuotedStr(dados.cdsPosicaoCOD_POSICAO.AsString)+')';
    end;
    t := t + ' Posição: ' + DBLookupComboBox2.Text;
 end;
 if not vazio(DBLookupComboBox3.Text) then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.COD_PESSOA IN (SELECT COD_PESSOA FROM DEFXPESSOA WHERE COD_DEFICIENCIA IN ('+QuotedStr(dados.cdsDefCOD_DEFICIENCIA.AsString)+'))';
    end else begin
       sql := sql + ' WHERE P.COD_PESSOA IN (SELECT COD_PESSOA FROM DEFXPESSOA WHERE COD_DEFICIENCIA IN ('+QuotedStr(dados.cdsDefCOD_DEFICIENCIA.AsString)+'))';
    end;
    t := t + ' Deficiência: Sim';
 end;

  if not vazio(DBLookupComboBox4.Text) then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.COD_PESSOA IN (SELECT COD_PESSOA FROM MEDXPESSOA WHERE COD_MEDICAMENTO IN ('+QuotedStr(dados.cdsMedCOD_MEDICAMENTO.AsString)+'))';
    end else begin
       sql := sql + ' WHERE P.COD_PESSOA IN (SELECT COD_PESSOA FROM MEDXPESSOA WHERE COD_MEDICAMENTO IN ('+QuotedStr(dados.cdsMedCOD_MEDICAMENTO.AsString)+'))';
    end;
    t := t + ' Medicamento: ' + DBLookupComboBox4.Text;
  end;

  if not vazio(DBLookupComboBox5.Text) then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.COD_PESSOA IN (SELECT COD_PESSOA FROM AGRAVOXPESSOA WHERE COD_AGRAVO IN ('+QuotedStr(dados.cdsAgravoCOD_AGRAVO.AsString)+'))';
    end else begin
       sql := sql + ' WHERE P.COD_PESSOA IN (SELECT COD_PESSOA FROM AGRAVOXPESSOA WHERE COD_AGRAVO IN ('+QuotedStr(dados.cdsAgravoCOD_AGRAVO.AsString)+'))';
    end;
    t := t + ' Agravo: ' + DBLookupComboBox5.Text;
  end;

 if not vazio(DBLookupComboBox6.Text) then begin
    if pos('WHERE', sql) > 0 then begin
       sql := sql + ' AND P.COD_AGENTE IN ('+QuotedStr(dados.cdsAgenteCOD_AGENTE.AsString)+')';
    end else begin
       sql := sql + ' WHERE P.COD_AGENTE IN ('+QuotedStr(dados.cdsAgenteCOD_AGENTE.AsString)+')';
    end;
    t := t + ' Agente: ' + DBLookupComboBox6.Text;
 end;

   case txtOrdernado.ItemIndex of
      0: sql := sql + ' ORDER BY P.COD_IND';
      1: sql := sql + ' ORDER BY P.NOME';
   end;
   application.CreateForm(TfrmREntrega, frmREntrega);
   with frmREntrega do begin
      cdsTab.Close;
      sqlTab.Close;
      sqlTab.SQL.Clear;
      sqlTab.SQL.Add(sql);
      cdsTab.Open;
      if cdsTab.Eof then begin
         application.MessageBox('Não Há Dados a Serem Impresso.', 'Atenção', MB_ICONEXCLAMATION);
         cdsTab.Close;
         Close;
      end else begin
         tipo := t;
         RLReport1.PreviewModal;
         Close;
      end;
   end;
end;
end;

procedure TfrmOrEntrega.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dados.cdsAgravo.Close;
dados.cdsAgente.Close;
dados.cdsClass.Close;
dados.cdsPosicao.Close;
dados.cdsMed.Close;
dados.cdsDef.Close;
  inherited;
end;

procedure TfrmOrEntrega.FormShow(Sender: TObject);
begin
  inherited;
dados.cdsAgravo.Open;
dados.cdsAgente.Open;
dados.cdsClass.Open;
dados.cdsPosicao.Open;
dados.cdsMed.Open;
dados.cdsDef.Open;
DBLookupComboBox2.KeyValue := 0;
end;

end.
