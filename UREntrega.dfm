inherited frmREntrega: TfrmREntrega
  Caption = 'frmREntrega'
  ClientWidth = 1319
  ExplicitLeft = -495
  ExplicitWidth = 1335
  PixelsPerInch = 96
  TextHeight = 13
  inherited RLReport1: TRLReport
    Top = 8
    Width = 1123
    Height = 794
    PageSetup.Orientation = poLandscape
    ExplicitTop = 8
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited RLBand1: TRLBand
      Width = 1047
      Height = 75
      Font.Height = -11
      Font.Style = [fsBold]
      ParentFont = False
      BeforePrint = RLBand1BeforePrint
      ExplicitWidth = 1047
      ExplicitHeight = 75
      inherited RLLabel1: TRLLabel
        Width = 270
        Caption = 'Listagem de Cadastros'
        ExplicitWidth = 270
      end
      inherited RLSystemInfo1: TRLSystemInfo
        Top = 40
        ExplicitTop = 40
      end
      inherited RLSystemInfo2: TRLSystemInfo
        Left = 800
        Top = 39
        ExplicitLeft = 800
        ExplicitTop = 39
      end
      object TipoRelatorio: TRLMemo
        Left = 0
        Top = 61
        Width = 1047
        Height = 14
        Align = faBottom
        Behavior = [beSiteExpander]
        Lines.Strings = (
          'Filtrado por: Todos')
      end
    end
    inherited RLBand2: TRLBand
      Top = 180
      Width = 1047
      ExplicitTop = 180
      ExplicitWidth = 1047
      inherited RLLabel2: TRLLabel
        Width = 1047
        ExplicitWidth = 1047
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 142
      Width = 1047
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      object RLDraw5: TRLDraw
        Left = 2
        Top = -3
        Width = 95
        Height = 25
      end
      object RLDraw6: TRLDraw
        Left = 96
        Top = -3
        Width = 305
        Height = 25
      end
      object RLDraw7: TRLDraw
        Left = 399
        Top = -3
        Width = 178
        Height = 25
      end
      object RLDraw8: TRLDraw
        Left = 888
        Top = -3
        Width = 158
        Height = 25
      end
      object RLDBText1: TRLDBText
        Left = 20
        Top = 2
        Width = 70
        Height = 15
        Alignment = taCenter
        DataField = 'COD_IND'
        DataSource = dsTab
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 104
        Top = 2
        Width = 289
        Height = 15
        AutoSize = False
        DataField = 'NOME'
        DataSource = dsTab
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 407
        Top = 2
        Width = 163
        Height = 15
        Alignment = taCenter
        AutoSize = False
        DataField = 'IDADE'
        DataSource = dsTab
        Text = ''
      end
      object RLDBMemo1: TRLDBMemo
        Left = 889
        Top = 2
        Width = 152
        Height = 15
        Behavior = [beSiteExpander]
        DataField = 'P_CONSULTA'
        DataSource = dsTab
      end
      object RLDraw11: TRLDraw
        Left = 576
        Top = -3
        Width = 178
        Height = 25
      end
      object RLDBText4: TRLDBText
        Left = 584
        Top = 2
        Width = 164
        Height = 15
        Alignment = taCenter
        AutoSize = False
        DataField = 'CART_SUS'
        DataSource = dsTab
        Text = ''
      end
      object RLDraw12: TRLDraw
        Left = 754
        Top = -3
        Width = 134
        Height = 25
      end
      object RLDBText5: TRLDBText
        Left = 762
        Top = 2
        Width = 120
        Height = 15
        Alignment = taCenter
        AutoSize = False
        DataField = 'DAT_NASC'
        DataSource = dsTab
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 164
      Width = 1047
      Height = 16
      BandType = btSummary
      object RLDBResult1: TRLDBResult
        Left = 2
        Top = 1
        Width = 155
        Height = 14
        DataField = 'COD_IND'
        DataSource = dsTab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        Info = riCount
        ParentFont = False
        Text = 'Registro(s) Listado(s): '
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 113
      Width = 1047
      Height = 29
      BandType = btColumnHeader
      object RLDraw4: TRLDraw
        Left = 888
        Top = 4
        Width = 158
        Height = 25
      end
      object RLDraw3: TRLDraw
        Left = 399
        Top = 4
        Width = 178
        Height = 25
      end
      object RLDraw2: TRLDraw
        Left = 96
        Top = 4
        Width = 305
        Height = 25
      end
      object RLDraw1: TRLDraw
        Left = 2
        Top = 4
        Width = 95
        Height = 25
      end
      object RLLabel4: TRLLabel
        Left = 104
        Top = 9
        Width = 35
        Height = 14
        Caption = 'Nome'
      end
      object RLLabel6: TRLLabel
        Left = 916
        Top = 9
        Width = 107
        Height = 16
        Caption = 'Pr'#243'xima Consulta'
      end
      object RLLabel5: TRLLabel
        Left = 407
        Top = 9
        Width = 163
        Height = 14
        Alignment = taCenter
        Caption = 'Idade'
      end
      object RLLabel3: TRLLabel
        Left = 20
        Top = 9
        Width = 54
        Height = 14
        Caption = 'Indicador'
      end
      object RLDraw9: TRLDraw
        Left = 576
        Top = 4
        Width = 178
        Height = 25
      end
      object RLLabel7: TRLLabel
        Left = 619
        Top = 9
        Width = 92
        Height = 16
        Alignment = taCenter
        Caption = 'Cart'#227'o do SUS'
      end
      object RLDraw10: TRLDraw
        Left = 753
        Top = 4
        Width = 135
        Height = 25
      end
      object RLLabel8: TRLLabel
        Left = 791
        Top = 9
        Width = 70
        Height = 16
        Alignment = taCenter
        Caption = 'Data Nasc.'
      end
    end
  end
  inherited cdsTab: TClientDataSet
    object cdsTabCOD_IND: TIntegerField
      FieldName = 'COD_IND'
    end
    object cdsTabNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsTabIDADE: TStringField
      FieldName = 'IDADE'
      Size = 300
    end
    object cdsTabOBS: TBlobField
      FieldName = 'OBS'
      Size = 1
    end
    object cdsTabCART_SUS: TStringField
      FieldName = 'CART_SUS'
      Size = 100
    end
    object cdsTabDAT_NASC: TDateField
      FieldName = 'DAT_NASC'
    end
    object cdsTabP_CONSULTA: TDateField
      FieldName = 'P_CONSULTA'
    end
  end
  inherited sqlTab: TSQLQuery
    MaxBlobSize = 1
    SQL.Strings = (
      'SELECT'
      '    P.COD_IND,'
      '    P.NOME,'
      
        '    (SELECT IDADE_REAL FROM CALCULA_IDADE(P.COD_PESSOA)) AS IDAD' +
        'E,'
      '    P.OBS,'
      '   P.CART_SUS, p.DAT_NASC,'
      '   dateadd (180 day to p.dat_consulta) as p_consulta'
      'FROM PESSOAS P')
  end
  inherited RLXLSFilter1: TRLXLSFilter
    Options = [foFindValueCells, foOneSheetOnly]
  end
end
