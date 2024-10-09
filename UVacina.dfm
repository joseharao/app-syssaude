inherited frmVacina: TfrmVacina
  Caption = 'Cadastro de Vacinas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      object GroupBox2: TGroupBox
        Left = 13
        Top = 92
        Width = 568
        Height = 237
        Caption = 'Dados da Vacina'
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
          Width = 85
          Height = 13
          Caption = 'Nome da Vacina *'
          FocusControl = DBEdit2
        end
        object Label7: TLabel
          Left = 128
          Top = 17
          Width = 98
          Height = 13
          Caption = 'Com Quantos Meses'
          FocusControl = DBEdit3
        end
        object Label8: TLabel
          Left = 9
          Top = 103
          Width = 28
          Height = 13
          Caption = 'Idade'
          FocusControl = DBEdit4
        end
        object Label9: TLabel
          Left = 9
          Top = 144
          Width = 133
          Height = 13
          Caption = 'Detalhes Vacina (Descri'#231#227'o)'
          FocusControl = DBEdit5
        end
        object Label10: TLabel
          Left = 9
          Top = 188
          Width = 24
          Height = 13
          Caption = 'Dose'
          FocusControl = DBEdit6
        end
        object DBEdit1: TDBEdit
          Left = 9
          Top = 33
          Width = 113
          Height = 21
          Color = 16744448
          DataField = 'COD_VACINA'
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
          DataField = 'NOME_VACINA'
          DataSource = dsTab
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 128
          Top = 33
          Width = 134
          Height = 21
          DataField = 'MES_PARA_APLICACAO'
          DataSource = dsTab
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 9
          Top = 119
          Width = 551
          Height = 21
          DataField = 'IDADE'
          DataSource = dsTab
          TabOrder = 3
        end
        object DBEdit5: TDBEdit
          Left = 9
          Top = 160
          Width = 551
          Height = 21
          DataField = 'DETALHES_VACINA'
          DataSource = dsTab
          TabOrder = 4
        end
        object DBEdit6: TDBEdit
          Left = 9
          Top = 204
          Width = 551
          Height = 21
          DataField = 'DOSE'
          DataSource = dsTab
          TabOrder = 5
        end
      end
    end
  end
  inherited cdsTab: TClientDataSet
    object cdsTabCOD_VACINA: TIntegerField
      FieldName = 'COD_VACINA'
      Required = True
    end
    object cdsTabNOME_VACINA: TStringField
      FieldName = 'NOME_VACINA'
      Size = 100
    end
    object cdsTabMES_PARA_APLICACAO: TIntegerField
      FieldName = 'MES_PARA_APLICACAO'
    end
    object cdsTabIDADE: TStringField
      FieldName = 'IDADE'
      Size = 100
    end
    object cdsTabDETALHES_VACINA: TStringField
      FieldName = 'DETALHES_VACINA'
      Size = 10000
    end
    object cdsTabDOSE: TStringField
      FieldName = 'DOSE'
      Size = 1000
    end
  end
  inherited sqlTab: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_VACINA'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM VACINA WHERE COD_VACINA = :COD_VACINA')
  end
end
