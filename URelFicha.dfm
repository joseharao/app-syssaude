inherited frmRelFicha: TfrmRelFicha
  Left = 98
  Caption = 'frmRelFicha'
  ClientHeight = 745
  ClientWidth = 765
  Position = poDesigned
  ExplicitTop = -200
  ExplicitWidth = 781
  ExplicitHeight = 784
  PixelsPerInch = 96
  TextHeight = 13
  inherited RLReport1: TRLReport
    Left = -16
    Top = -457
    ExplicitLeft = -16
    ExplicitTop = -457
    inherited RLBand1: TRLBand
      inherited RLLabel1: TRLLabel
        Width = 185
        Caption = 'Ficha Cadastral'
        ExplicitWidth = 185
      end
    end
    inherited RLBand2: TRLBand
      Top = 889
      ExplicitTop = 889
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 104
      Width = 718
      Height = 188
      BeforePrint = RLBand3BeforePrint
      object RLLabel5: TRLLabel
        Left = 0
        Top = 16
        Width = 716
        Height = 16
        Caption = 
          '================================================================' +
          '========================='
      end
      object RLLabel4: TRLLabel
        Left = 0
        Top = 174
        Width = 716
        Height = 16
        Caption = 
          '================================================================' +
          '========================='
      end
      object RLLabel3: TRLLabel
        Left = 270
        Top = 1
        Width = 140
        Height = 19
        Caption = 'Dados Cadastrais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBText1: TRLDBText
        Left = 3
        Top = 29
        Width = 143
        Height = 16
        DataField = 'COD_IND'
        DataSource = dsTab
        Text = 'C'#243'd. Pessoa: '
      end
      object RLDBText2: TRLDBText
        Left = 186
        Top = 29
        Width = 172
        Height = 16
        DataField = 'DAT_CAD'
        DataSource = dsTab
        Text = 'Data do Cadastro: '
      end
      object RLDBText3: TRLDBText
        Left = 400
        Top = 29
        Width = 241
        Height = 16
        DataField = 'DAT_NASC'
        DataSource = dsTab
        Text = 'Data de Nascimento: '
      end
      object RLDBText4: TRLDBText
        Left = 3
        Top = 58
        Width = 436
        Height = 16
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsTab
        Text = 'Nome do Paciente: '
      end
      object RLDBText5: TRLDBText
        Left = 444
        Top = 58
        Width = 271
        Height = 16
        AutoSize = False
        DataField = 'IDADE'
        DataSource = dsTab
        Text = 'Idade: '
      end
      object RLDBText6: TRLDBText
        Left = 3
        Top = 84
        Width = 407
        Height = 16
        AutoSize = False
        DataField = 'ENDERECO'
        DataSource = dsTab
        Text = 'Endere'#231'o: '
      end
      object RLDBText7: TRLDBText
        Left = 413
        Top = 84
        Width = 302
        Height = 16
        AutoSize = False
        DataField = 'BAIRRO'
        DataSource = dsTab
        Text = 'Bairro: '
      end
      object RLDBText8: TRLDBText
        Left = 3
        Top = 110
        Width = 238
        Height = 16
        AutoSize = False
        DataField = 'CIDADE'
        DataSource = dsTab
        Text = 'Cidade: '
      end
      object RLDBText9: TRLDBText
        Left = 244
        Top = 110
        Width = 61
        Height = 16
        AutoSize = False
        DataField = 'UF'
        DataSource = dsTab
        Text = 'UF: '
      end
      object RLDBText10: TRLDBText
        Left = 309
        Top = 110
        Width = 244
        Height = 16
        AutoSize = False
        DataField = 'GRAU_INSTRUCAO'
        DataSource = dsTab
        Text = 'Instru'#231#227'o: '
      end
      object RLDBText11: TRLDBText
        Left = 558
        Top = 110
        Width = 157
        Height = 16
        AutoSize = False
        DataField = 'SEXO'
        DataSource = dsTab
        Text = 'Sexo: '
      end
      object RLDBText12: TRLDBText
        Left = 3
        Top = 136
        Width = 150
        Height = 16
        DataField = 'DUM'
        DataSource = dsTab
        Text = 'DUM: '
      end
      object RLDBText13: TRLDBText
        Left = 159
        Top = 136
        Width = 106
        Height = 16
        DataField = 'DPP'
        DataSource = dsTab
        Text = 'DPP: '
      end
      object RLDBText14: TRLDBText
        Left = 287
        Top = 136
        Width = 170
        Height = 16
        DataField = 'CART_SUS'
        DataSource = dsTab
        Text = 'Cart. SUS: '
      end
      object RLDBText15: TRLDBText
        Left = 471
        Top = 136
        Width = 218
        Height = 16
        AutoSize = False
        DataField = 'NIS'
        DataSource = dsTab
        Text = 'Nr. NIS: '
      end
      object RLDBText16: TRLDBText
        Left = 3
        Top = 160
        Width = 166
        Height = 16
        AutoSize = False
        DataField = 'DPOSICAO'
        DataSource = dsTab
        Text = 'Posi'#231#227'o: '
      end
      object RLDBText17: TRLDBText
        Left = 179
        Top = 160
        Width = 526
        Height = 16
        AutoSize = False
        DataField = 'AGENTE'
        DataSource = dsTab
        Text = 'Agente de Sa'#250'de: '
      end
    end
    object SubDependentes: TRLSubDetail
      Left = 38
      Top = 292
      Width = 718
      Height = 50
      DataSource = dsDependente
      object RLBand4: TRLBand
        Left = 0
        Top = 26
        Width = 718
        Height = 23
        object RLDBText19: TRLDBText
          Left = 3
          Top = 4
          Width = 702
          Height = 16
          AutoSize = False
          DataField = 'NOME'
          DataSource = dsDependente
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 26
        BandType = btColumnHeader
        object RLLabel6: TRLLabel
          Left = 270
          Top = -1
          Width = 106
          Height = 19
          Caption = 'Dependentes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 0
          Top = 14
          Width = 716
          Height = 16
          Caption = 
            '================================================================' +
            '========================='
        end
      end
    end
    object SubMedicamentos: TRLSubDetail
      Left = 38
      Top = 342
      Width = 718
      Height = 50
      DataSource = dsMed
      object RLBand6: TRLBand
        Left = 0
        Top = 26
        Width = 718
        Height = 23
        object RLDBText18: TRLDBText
          Left = 3
          Top = 4
          Width = 702
          Height = 16
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = dsMed
        end
      end
      object RLBand7: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 26
        BandType = btColumnHeader
        object RLLabel8: TRLLabel
          Left = 270
          Top = -1
          Width = 115
          Height = 19
          Caption = 'Medicamentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 0
          Top = 14
          Width = 716
          Height = 16
          Caption = 
            '================================================================' +
            '========================='
        end
      end
    end
    object SubDeficiencia: TRLSubDetail
      Left = 38
      Top = 392
      Width = 718
      Height = 50
      DataSource = dsDef
      object RLBand8: TRLBand
        Left = 0
        Top = 26
        Width = 718
        Height = 23
        object RLDBText20: TRLDBText
          Left = 3
          Top = 4
          Width = 702
          Height = 16
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = dsDef
        end
      end
      object RLBand9: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 26
        BandType = btColumnHeader
        object RLLabel10: TRLLabel
          Left = 270
          Top = -1
          Width = 97
          Height = 19
          Caption = 'Defici'#234'ncias'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel11: TRLLabel
          Left = 0
          Top = 14
          Width = 716
          Height = 16
          Caption = 
            '================================================================' +
            '========================='
        end
      end
    end
    object SubAgravo: TRLSubDetail
      Left = 38
      Top = 442
      Width = 718
      Height = 50
      DataSource = dsAgravo
      object RLBand10: TRLBand
        Left = 0
        Top = 26
        Width = 718
        Height = 23
        object RLDBText21: TRLDBText
          Left = 3
          Top = 4
          Width = 702
          Height = 16
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = dsAgravo
        end
      end
      object RLBand11: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 26
        BandType = btColumnHeader
        object RLLabel12: TRLLabel
          Left = 270
          Top = -1
          Width = 68
          Height = 19
          Caption = 'Agravos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel13: TRLLabel
          Left = 0
          Top = 14
          Width = 716
          Height = 16
          Caption = 
            '================================================================' +
            '========================='
        end
      end
    end
    object RLBand12: TRLBand
      Left = 38
      Top = 492
      Width = 718
      Height = 397
      BandType = btSummary
      BeforePrint = RLBand12BeforePrint
      object RLLabel14: TRLLabel
        Left = 0
        Top = -3
        Width = 716
        Height = 16
        Caption = 
          '================================================================' +
          '========================='
      end
      object RLLabel15: TRLLabel
        Left = 272
        Top = 9
        Width = 105
        Height = 19
        Caption = 'Observa'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object txtOBS: TRLMemo
        Left = 3
        Top = 33
        Width = 709
        Height = 16
        Behavior = [beSiteExpander]
      end
      object RLLabel16: TRLLabel
        Left = 18
        Top = 176
        Width = 683
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '_________________________________'
      end
      object RLLabel17: TRLLabel
        Left = 18
        Top = 204
        Width = 683
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '_________________________________'
      end
      object RLLabel18: TRLLabel
        Left = 17
        Top = 259
        Width = 683
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '_________________________________'
      end
      object RLLabel19: TRLLabel
        Left = 17
        Top = 232
        Width = 683
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '_________________________________'
      end
      object RLLabel20: TRLLabel
        Left = 18
        Top = 288
        Width = 683
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '_________________________________'
      end
      object RLLabel21: TRLLabel
        Left = 18
        Top = 317
        Width = 683
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '_________________________________'
      end
      object RLLabel22: TRLLabel
        Left = 17
        Top = 345
        Width = 683
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '_________________________________'
      end
      object RLLabel23: TRLLabel
        Left = 17
        Top = 373
        Width = 683
        Height = 16
        Caption = 
          '________________________________________________________________' +
          '_________________________________'
      end
    end
  end
  inherited cdsTab: TClientDataSet
    object cdsTabCOD_PESSOA: TIntegerField
      FieldName = 'COD_PESSOA'
      Required = True
    end
    object cdsTabCOD_IND: TIntegerField
      FieldName = 'COD_IND'
    end
    object cdsTabDAT_CAD: TDateField
      FieldName = 'DAT_CAD'
    end
    object cdsTabDAT_NASC: TDateField
      FieldName = 'DAT_NASC'
    end
    object cdsTabCOD_AGENTE: TIntegerField
      FieldName = 'COD_AGENTE'
    end
    object cdsTabNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsTabENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsTabBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsTabCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object cdsTabUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsTabGRAU_INSTRUCAO: TStringField
      FieldName = 'GRAU_INSTRUCAO'
      Size = 100
    end
    object cdsTabSEXO: TStringField
      FieldName = 'SEXO'
      Size = 50
    end
    object cdsTabGESTANTE: TStringField
      FieldName = 'GESTANTE'
      Size = 1
    end
    object cdsTabDUM: TDateField
      FieldName = 'DUM'
    end
    object cdsTabDPP: TDateField
      FieldName = 'DPP'
    end
    object cdsTabNIS: TStringField
      FieldName = 'NIS'
      Size = 100
    end
    object cdsTabCART_SUS: TStringField
      FieldName = 'CART_SUS'
      Size = 100
    end
    object cdsTabOBS: TBlobField
      FieldName = 'OBS'
      Size = 1
    end
    object cdsTabPOSICAO: TIntegerField
      FieldName = 'POSICAO'
    end
    object cdsTabAGENTE: TStringField
      FieldName = 'AGENTE'
      Size = 100
    end
    object cdsTabDPOSICAO: TStringField
      FieldName = 'DPOSICAO'
      Size = 100
    end
    object cdsTabIDADE: TStringField
      FieldName = 'IDADE'
      Size = 300
    end
  end
  inherited sqlTab: TSQLQuery
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_PESSOA'
        ParamType = ptInput
        Value = '1'
      end>
    SQL.Strings = (
      'SELECT'
      '   P.*, A.NOME_DO_AGENTE AS AGENTE, PS.DESCRICAO AS DPOSICAO,'
      '   (SELECT IDADE_REAL FROM CALCULA_IDADE(P.COD_PESSOA)) AS IDADE'
      'FROM PESSOAS P, AGENTES A, POSICAO PS'
      'WHERE P.COD_AGENTE = A.COD_AGENTE AND P.POSICAO = PS.COD_POSICAO'
      'AND P.COD_PESSOA = :COD_PESSOA')
  end
  object dsMed: TDataSource
    DataSet = cdsMed
    Left = 128
    Top = 353
  end
  object dspMed: TDataSetProvider
    DataSet = sqlMed
    Left = 167
    Top = 353
  end
  object cdsMed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMed'
    Left = 211
    Top = 353
    object cdsMedCOD_SEQ: TIntegerField
      FieldName = 'COD_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsMedCOD_PESSOA: TIntegerField
      FieldName = 'COD_PESSOA'
    end
    object cdsMedCOD_MEDICAMENTO: TIntegerField
      FieldName = 'COD_MEDICAMENTO'
    end
    object cdsMedCOD_REMEDIO: TStringField
      FieldKind = fkLookup
      FieldName = 'COD_REMEDIO'
      LookupDataSet = Dados.cdsMed
      LookupKeyFields = 'COD_MEDICAMENTO'
      LookupResultField = 'NOME'
      KeyFields = 'COD_MEDICAMENTO'
      Size = 500
      Lookup = True
    end
    object cdsMedDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object sqlMed: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_PESSOA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      ' SELECT'
      '  M.*, MM.DESCRICAO'
      'FROM  MEDXPESSOA M, MEDICAMENTOS MM'
      
        'WHERE M.COD_PESSOA = :COD_PESSOA AND M.COD_MEDICAMENTO = MM.COD_' +
        'MEDICAMENTO')
    SQLConnection = Dados.DB
    Left = 253
    Top = 353
    object sqlMedCOD_SEQ: TIntegerField
      FieldName = 'COD_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlMedCOD_PESSOA: TIntegerField
      FieldName = 'COD_PESSOA'
    end
    object sqlMedCOD_MEDICAMENTO: TIntegerField
      FieldName = 'COD_MEDICAMENTO'
    end
    object sqlMedDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object sqlDef: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_PESSOA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT '
      'DP.*, DF.DESCRICAO'
      
        'FROM DEFXPESSOA DP, DEFICIENCIA DF WHERE COD_PESSOA = :COD_PESSO' +
        'A'
      'AND DP.COD_DEFICIENCIA = DF.COD_DEFICIENCIA')
    SQLConnection = Dados.DB
    Left = 245
    Top = 425
    object sqlDefCOD_SEQ: TIntegerField
      FieldName = 'COD_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlDefCOD_PESSOA: TIntegerField
      FieldName = 'COD_PESSOA'
    end
    object sqlDefCOD_DEFICIENCIA: TIntegerField
      FieldName = 'COD_DEFICIENCIA'
    end
    object sqlDefDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object cdsDef: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDef'
    Left = 219
    Top = 417
    object cdsDefCOD_SEQ: TIntegerField
      FieldName = 'COD_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDefCOD_PESSOA: TIntegerField
      FieldName = 'COD_PESSOA'
    end
    object cdsDefCOD_DEFICIENCIA: TIntegerField
      FieldName = 'COD_DEFICIENCIA'
    end
    object cdsDefDEFICIENCIA: TStringField
      FieldKind = fkLookup
      FieldName = 'DEFICIENCIA'
      LookupDataSet = Dados.cdsDef
      LookupKeyFields = 'COD_DEFICIENCIA'
      LookupResultField = 'NOME'
      KeyFields = 'COD_DEFICIENCIA'
      Size = 500
      Lookup = True
    end
    object cdsDefDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object dspDef: TDataSetProvider
    DataSet = sqlDef
    Left = 159
    Top = 425
  end
  object dsDef: TDataSource
    DataSet = cdsDef
    Left = 120
    Top = 425
  end
  object dsDependente: TDataSource
    DataSet = cdsDependente
    Left = 424
    Top = 361
  end
  object dspDependente: TDataSetProvider
    DataSet = sqlDependente
    Left = 463
    Top = 361
  end
  object cdsDependente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDependente'
    Left = 507
    Top = 361
    object cdsDependenteCOD_DEPENDENTE: TIntegerField
      FieldName = 'COD_DEPENDENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsDependenteCOD_PESSOA: TIntegerField
      FieldName = 'COD_PESSOA'
    end
    object cdsDependenteCOD_DEP: TIntegerField
      FieldName = 'COD_DEP'
    end
    object cdsDependenteCOD_DEPEN: TStringField
      FieldKind = fkLookup
      FieldName = 'COD_DEPEN'
      LookupDataSet = Dados.cdsPessoa
      LookupKeyFields = 'COD_PESSOA'
      LookupResultField = 'NOME'
      KeyFields = 'COD_DEP'
      Size = 500
      Lookup = True
    end
    object cdsDependenteNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
  object sqlDependente: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_PESSOA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      '  D.*, P.NOME'
      'FROM  DEPENDENTES D, PESSOAS P WHERE P.COD_PESSOA = D.COD_DEP'
      'AND P.COD_PESSOA = :COD_PESSOA')
    SQLConnection = Dados.DB
    Left = 549
    Top = 361
    object sqlDependenteCOD_DEPENDENTE: TIntegerField
      FieldName = 'COD_DEPENDENTE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlDependenteCOD_PESSOA: TIntegerField
      FieldName = 'COD_PESSOA'
    end
    object sqlDependenteCOD_DEP: TIntegerField
      FieldName = 'COD_DEP'
    end
    object sqlDependenteNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
  object sqlAgravo: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_PESSOA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT AP.*, AG.DESCRICAO'
      'FROM AGRAVOXPESSOA AP, AGRAVO AG WHERE COD_PESSOA = :COD_PESSOA'
      'AND AP.COD_AGRAVO = AG.COD_AGRAVO')
    SQLConnection = Dados.DB
    Left = 533
    Top = 457
    object sqlAgravoCOD_SEQ: TIntegerField
      FieldName = 'COD_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object sqlAgravoCOD_PESSOA: TIntegerField
      FieldName = 'COD_PESSOA'
    end
    object sqlAgravoCOD_AGRAVO: TIntegerField
      FieldName = 'COD_AGRAVO'
    end
    object sqlAgravoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object cdsAgravo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgravo'
    Left = 491
    Top = 457
    object cdsAgravoCOD_SEQ: TIntegerField
      FieldName = 'COD_SEQ'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsAgravoCOD_PESSOA: TIntegerField
      FieldName = 'COD_PESSOA'
    end
    object cdsAgravoCOD_AGRAVO: TIntegerField
      FieldName = 'COD_AGRAVO'
    end
    object cdsAgravoAGRAVO: TStringField
      FieldKind = fkLookup
      FieldName = 'AGRAVO'
      LookupDataSet = Dados.cdsAgravo
      LookupKeyFields = 'COD_AGRAVO'
      LookupResultField = 'NOME'
      KeyFields = 'COD_AGRAVO'
      Size = 500
      Lookup = True
    end
    object cdsAgravoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object dspAgravo: TDataSetProvider
    DataSet = sqlAgravo
    Left = 447
    Top = 457
  end
  object dsAgravo: TDataSource
    DataSet = cdsAgravo
    Left = 408
    Top = 457
  end
end
