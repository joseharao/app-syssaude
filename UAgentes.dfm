inherited frmAgentes: TfrmAgentes
  Caption = 'Cadastro de Agentes de Sa'#250'des'
  ExplicitWidth = 638
  ExplicitHeight = 544
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited Panel3: TPanel
        inherited Label1: TLabel
          Width = 263
          Caption = 'Formul'#225'rio usado para cadastro de Agentes de Sa'#250'des'
          ExplicitWidth = 263
        end
      end
      object GroupBox2: TGroupBox
        Left = 13
        Top = 92
        Width = 568
        Height = 181
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
          Width = 89
          Height = 13
          Caption = 'Nome do Agente *'
          FocusControl = DBEdit2
        end
        object Label7: TLabel
          Left = 127
          Top = 17
          Width = 85
          Height = 13
          Caption = 'Data do Cadastro'
        end
        object DBEdit1: TDBEdit
          Left = 9
          Top = 33
          Width = 113
          Height = 21
          Color = 16744448
          DataField = 'COD_AGENTE'
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
          DataField = 'NOME_DO_AGENTE'
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
      end
    end
  end
  inherited cdsTab: TClientDataSet
    object cdsTabCOD_AGENTE: TIntegerField
      FieldName = 'COD_AGENTE'
      Required = True
    end
    object cdsTabDAT_CAD: TDateField
      FieldName = 'DAT_CAD'
    end
    object cdsTabNOME_DO_AGENTE: TStringField
      FieldName = 'NOME_DO_AGENTE'
      Size = 100
    end
    object cdsTabPOSICAO: TStringField
      FieldName = 'POSICAO'
      Size = 1
    end
  end
  inherited sqlTab: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_AGENTE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM AGENTES WHERE COD_AGENTE = :COD_AGENTE')
  end
end
