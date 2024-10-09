inherited frmParam: TfrmParam
  Caption = 'Parametros do Sistema'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited Panel3: TPanel
        inherited Label1: TLabel
          Width = 279
          Caption = 'Formul'#225'rio usado para cadastro de parametros do sistema'
          ExplicitWidth = 279
        end
      end
      object GroupBox2: TGroupBox
        Left = 13
        Top = 92
        Width = 568
        Height = 181
        Caption = 'Dados do Parametro'
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
          Width = 72
          Height = 13
          Caption = 'Nome do PSF *'
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
          Left = 9
          Top = 104
          Width = 61
          Height = 13
          Caption = 'Respons'#225'vel'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 9
          Top = 33
          Width = 113
          Height = 21
          Color = 16744448
          DataField = 'COD_PARAM'
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
          Left = 9
          Top = 120
          Width = 551
          Height = 21
          CharCase = ecUpperCase
          DataField = 'RESPONSAVEL'
          DataSource = dsTab
          TabOrder = 3
        end
      end
    end
  end
  inherited cdsTab: TClientDataSet
    object cdsTabCOD_PARAM: TIntegerField
      FieldName = 'COD_PARAM'
      Required = True
    end
    object cdsTabDAT_CAD: TDateField
      FieldName = 'DAT_CAD'
    end
    object cdsTabDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsTabRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 100
    end
  end
  inherited sqlTab: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'COD_PARAM'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT FIRST 1 * FROM PARAM'
      'WHERE COD_PARAM >= :COD_PARAM')
  end
end
