inherited frmRVacinacao: TfrmRVacinacao
  Caption = 'frmRVacinacao'
  ClientWidth = 1110
  ExplicitWidth = 1126
  PixelsPerInch = 96
  TextHeight = 13
  inherited RLReport1: TRLReport
    Width = 1123
    Height = 794
    Margins.LeftMargin = 5.000000000000000000
    Margins.TopMargin = 5.000000000000000000
    Margins.RightMargin = 5.000000000000000000
    Margins.BottomMargin = 5.000000000000000000
    PageSetup.Orientation = poLandscape
    ExplicitWidth = 1123
    ExplicitHeight = 794
    inherited RLBand1: TRLBand
      Left = 19
      Top = 19
      Width = 1085
      ExplicitLeft = 19
      ExplicitTop = 19
      ExplicitWidth = 1085
      inherited RLLabel1: TRLLabel
        Left = 0
        Top = 0
        Width = 1085
        Align = faTop
        Alignment = taCenter
        Caption = 'Relat'#243'rio Vacina'#231#227'o de Crian'#231'as'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 1085
      end
      inherited RLSystemInfo2: TRLSystemInfo
        Left = 838
        ExplicitLeft = 838
      end
    end
    inherited RLBand2: TRLBand
      Left = 19
      Top = 243
      Width = 1085
      ExplicitLeft = 19
      ExplicitTop = 243
      ExplicitWidth = 1085
      inherited RLLabel2: TRLLabel
        Width = 1085
        ExplicitWidth = 1085
      end
    end
    object RLGrupoVacina: TRLGroup
      Left = 19
      Top = 85
      Width = 1085
      Height = 142
      DataFields = 'COD_VACINA'
      object RLBand5: TRLBand
        Left = 0
        Top = 0
        Width = 1085
        Height = 100
        BandType = btColumnHeader
        object RLDraw4: TRLDraw
          Left = 867
          Top = 75
          Width = 118
          Height = 25
        end
        object RLDraw3: TRLDraw
          Left = 399
          Top = 75
          Width = 178
          Height = 25
        end
        object RLDraw2: TRLDraw
          Left = 3
          Top = 75
          Width = 398
          Height = 25
        end
        object RLLabel4: TRLLabel
          Left = 6
          Top = 80
          Width = 35
          Height = 14
          Caption = 'Nome'
        end
        object RLLabel6: TRLLabel
          Left = 889
          Top = 80
          Width = 84
          Height = 16
          Caption = 'Agendamento'
        end
        object RLLabel5: TRLLabel
          Left = 472
          Top = 80
          Width = 32
          Height = 16
          Alignment = taCenter
          Caption = 'ACS'
        end
        object RLDraw9: TRLDraw
          Left = 576
          Top = 75
          Width = 178
          Height = 25
        end
        object RLLabel7: TRLLabel
          Left = 619
          Top = 80
          Width = 92
          Height = 16
          Alignment = taCenter
          Caption = 'Cart'#227'o do SUS'
        end
        object RLDraw10: TRLDraw
          Left = 753
          Top = 75
          Width = 115
          Height = 25
        end
        object RLLabel8: TRLLabel
          Left = 791
          Top = 80
          Width = 70
          Height = 16
          Alignment = taCenter
          Caption = 'Data Nasc.'
        end
        object RLDBText1: TRLDBText
          Left = 0
          Top = 0
          Width = 1085
          Height = 15
          Align = faTop
          AutoSize = False
          DataField = 'NOME_VACINA'
          DataSource = dsTab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = 'Vacina: '
        end
        object RLDraw1: TRLDraw
          Left = 984
          Top = 75
          Width = 99
          Height = 25
        end
        object RLLabel3: TRLLabel
          Left = 991
          Top = 80
          Width = 88
          Height = 16
          Caption = 'Dose Aplicada'
        end
        object RLDBText6: TRLDBText
          Left = 0
          Top = 15
          Width = 1085
          Height = 15
          Align = faTop
          AutoSize = False
          DataField = 'DESCRICAO'
          DataSource = dsTab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Text = 'Detalhes da Vacina: '
        end
        object RLDBText7: TRLDBText
          Left = 3
          Top = 37
          Width = 392
          Height = 15
          AutoSize = False
          DataField = 'IDADE_VACINA'
          DataSource = dsTab
          Text = ''
        end
        object RLDBText8: TRLDBText
          Left = 401
          Top = 37
          Width = 684
          Height = 15
          AutoSize = False
          DataField = 'DOSE'
          DataSource = dsTab
          Text = ''
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 100
        Width = 1085
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        object RLDraw6: TRLDraw
          Left = 3
          Top = -3
          Width = 398
          Height = 25
        end
        object RLDraw7: TRLDraw
          Left = 399
          Top = -3
          Width = 178
          Height = 25
        end
        object RLDraw8: TRLDraw
          Left = 867
          Top = -3
          Width = 118
          Height = 25
        end
        object RLDBText2: TRLDBText
          Left = 6
          Top = 2
          Width = 392
          Height = 15
          AutoSize = False
          DataField = 'NOME_CRIANCA'
          DataSource = dsTab
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 407
          Top = 2
          Width = 164
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'NOME_AGENTE'
          DataSource = dsTab
          Text = ''
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
          Width = 114
          Height = 25
        end
        object RLDBText5: TRLDBText
          Left = 762
          Top = 2
          Width = 99
          Height = 15
          Alignment = taCenter
          AutoSize = False
          DataField = 'DAT_NASC'
          DataSource = dsTab
          Text = ''
        end
        object RLDraw5: TRLDraw
          Left = 984
          Top = -3
          Width = 99
          Height = 25
        end
        object RLLabel9: TRLLabel
          Left = 873
          Top = 4
          Width = 107
          Height = 15
          Caption = '____/____/______'
        end
        object RLLabel10: TRLLabel
          Left = 986
          Top = 4
          Width = 95
          Height = 15
          Caption = '____/____/______'
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 124
        Width = 1085
        Height = 16
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 2
          Top = 1
          Width = 204
          Height = 14
          DataField = 'NOME_CRIANCA'
          DataSource = dsTab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Info = riCount
          ParentFont = False
          Text = 'Registro(s) do Grupo Listado(s): '
        end
      end
    end
    object RLBand6: TRLBand
      Left = 19
      Top = 227
      Width = 1085
      Height = 16
      BandType = btSummary
      object RLDBResult2: TRLDBResult
        Left = 2
        Top = 1
        Width = 155
        Height = 14
        DataField = 'NOME_CRIANCA'
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
  end
  inherited cdsTab: TClientDataSet
    object cdsTabCOD_VACINA: TIntegerField
      FieldName = 'COD_VACINA'
    end
    object cdsTabNOME_VACINA: TStringField
      FieldName = 'NOME_VACINA'
      Size = 100
    end
    object cdsTabIDADE: TLargeintField
      FieldName = 'IDADE'
    end
    object cdsTabNOME_CRIANCA: TStringField
      FieldName = 'NOME_CRIANCA'
      Size = 100
    end
    object cdsTabCOD_AGENTE: TIntegerField
      FieldName = 'COD_AGENTE'
    end
    object cdsTabNOME_AGENTE: TStringField
      FieldName = 'NOME_AGENTE'
      Size = 100
    end
    object cdsTabDAT_NASC: TDateField
      FieldName = 'DAT_NASC'
    end
    object cdsTabCART_SUS: TStringField
      FieldName = 'CART_SUS'
      Size = 100
    end
    object cdsTabOBS: TBlobField
      FieldName = 'OBS'
      Size = 1
    end
    object cdsTabDOSE: TStringField
      FieldName = 'DOSE'
      Size = 1000
    end
    object cdsTabDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 10000
    end
    object cdsTabIDADE_VACINA: TStringField
      FieldName = 'IDADE_VACINA'
      Size = 100
    end
  end
  inherited sqlTab: TSQLQuery
    MaxBlobSize = 1
    SQL.Strings = (
      'SELECT * FROM LISTA_CRIANCAS_VACINACAO')
  end
end
