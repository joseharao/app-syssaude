inherited frmClassificacao: TfrmClassificacao
  Caption = 'Cadastro de Classifica'#231#227'o Pessoal'
  ExplicitWidth = 638
  ExplicitHeight = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited Panel3: TPanel
        inherited Label1: TLabel
          Width = 266
          Caption = 'Formul'#225'rio usado para cadastro de classfica'#231#227'o pessoal'
          ExplicitWidth = 266
        end
      end
      object GroupBox2: TGroupBox
        Left = 13
        Top = 92
        Width = 568
        Height = 157
        Caption = 'Dados do Agente de Sa'#250'de'
        TabOrder = 2
        object Label5: TLabel
          Left = 9
          Top = 17
          Width = 33
          Height = 13
          Caption = 'C'#243'digo'
          FocusControl = DBEdit1
        end
        object Label6: TLabel
          Left = 9
          Top = 60
          Width = 55
          Height = 13
          Caption = 'Descri'#231#227'o *'
          FocusControl = DBEdit2
        end
        object Label7: TLabel
          Left = 127
          Top = 17
          Width = 85
          Height = 13
          Caption = 'Data do Cadastro'
        end
        object Label8: TLabel
          Left = 8
          Top = 106
          Width = 63
          Height = 13
          Caption = 'Idade M'#237'nima'
          FocusControl = DBEdit3
        end
        object lblMaxima: TLabel
          Left = 148
          Top = 106
          Width = 67
          Height = 13
          Caption = 'Idade M'#225'xima'
          FocusControl = txtMaxima
        end
        object DBEdit1: TDBEdit
          Left = 9
          Top = 33
          Width = 113
          Height = 21
          Color = 16744448
          DataField = 'COD_CLASS'
          DataSource = dsTab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 9
          Top = 76
          Width = 551
          Height = 21
          CharCase = ecUpperCase
          DataField = 'DESCRICAO'
          DataSource = dsTab
          TabOrder = 1
        end
        object DBDateEdit1: TDBDateEdit
          Left = 127
          Top = 33
          Width = 121
          Height = 21
          Margins.Left = 1
          Margins.Top = 1
          DataField = 'DAT_CAD'
          DataSource = dsTab
          ReadOnly = True
          Color = 16744448
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          NumGlyphs = 2
          ParentFont = False
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 8
          Top = 122
          Width = 134
          Height = 21
          DataField = 'IDADE_MIN'
          DataSource = dsTab
          TabOrder = 3
        end
        object txtMaxima: TDBEdit
          Left = 148
          Top = 122
          Width = 134
          Height = 21
          DataField = 'IDADE_MAX'
          DataSource = dsTab
          TabOrder = 4
        end
        object DBCheckBox1: TDBCheckBox
          Left = 288
          Top = 125
          Width = 97
          Height = 17
          Caption = 'Ac'#237'ma de ?'
          DataField = 'ACIMA_DE'
          DataSource = dsTab
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 374
          Top = 125
          Width = 97
          Height = 17
          Caption = 'Abaixo de ?'
          DataField = 'ABAIXO_DE'
          DataSource = dsTab
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  inherited cdsTab: TClientDataSet
    object cdsTabCOD_CLASS: TIntegerField
      FieldName = 'COD_CLASS'
      Required = True
    end
    object cdsTabDAT_CAD: TDateField
      FieldName = 'DAT_CAD'
    end
    object cdsTabDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsTabACIMA_DE: TStringField
      FieldName = 'ACIMA_DE'
      Size = 1
    end
    object cdsTabIDADE_MIN: TIntegerField
      FieldName = 'IDADE_MIN'
    end
    object cdsTabIDADE_MAX: TIntegerField
      FieldName = 'IDADE_MAX'
    end
    object cdsTabABAIXO_DE: TStringField
      FieldName = 'ABAIXO_DE'
      Size = 1
    end
  end
  inherited sqlTab: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_CLASS'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM CLASSIFICACAO WHERE COD_CLASS = :COD_CLASS')
  end
end
