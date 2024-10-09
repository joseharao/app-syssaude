inherited frmUsuarios: TfrmUsuarios
  Caption = 'Cadastro de Usu'#225'rios'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited Panel3: TPanel
        inherited Label1: TLabel
          Width = 195
          Caption = 'Formul'#225'rio usado para cadastro usu'#225'rios'
          ExplicitWidth = 195
        end
      end
      object GroupBox2: TGroupBox
        Left = 13
        Top = 92
        Width = 568
        Height = 181
        Caption = 'Dados do Usu'#225'rio'
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
          Width = 90
          Height = 13
          Caption = 'Nome do Usu'#225'rio *'
          FocusControl = DBEdit2
        end
        object Label7: TLabel
          Left = 9
          Top = 101
          Width = 91
          Height = 13
          Caption = 'Senha de Acesso *'
          FocusControl = DBEdit3
        end
        object DBEdit1: TDBEdit
          Left = 9
          Top = 33
          Width = 113
          Height = 21
          Color = 16744448
          DataField = 'COD_USUARIO'
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
          DataField = 'NOME'
          DataSource = dsTab
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 9
          Top = 117
          Width = 232
          Height = 21
          CharCase = ecUpperCase
          DataField = 'SENHA'
          DataSource = dsTab
          PasswordChar = '*'
          TabOrder = 2
        end
      end
    end
  end
  inherited dspTab: TDataSetProvider
    Left = 455
    Top = 24
  end
  inherited dsTab: TDataSource
    Left = 416
    Top = 24
  end
  inherited cdsTab: TClientDataSet
    Left = 499
    Top = 24
    object cdsTabCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object cdsTabNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsTabSENHA: TStringField
      FieldName = 'SENHA'
      Size = 400
    end
  end
  inherited sqlTab: TSQLQuery
    Params = <
      item
        DataType = ftUnknown
        Name = 'COD_USUARIO'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM USUARIOS WHERE COD_USUARIO = :COD_USUARIO')
    Left = 541
    Top = 24
  end
end
