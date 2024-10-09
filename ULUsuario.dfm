inherited frmLUsuario: TfrmLUsuario
  Caption = 'Listagem de Usu'#225'rios do Sistema'
  ExplicitWidth = 755
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited GroupBox1: TGroupBox
        object Label1: TLabel [0]
          Left = 8
          Top = 17
          Width = 86
          Height = 13
          Caption = 'Dados Para Busca'
        end
        object Label2: TLabel [1]
          Left = 384
          Top = 17
          Width = 33
          Height = 13
          Caption = 'Campo'
        end
        inherited btConsultar: TPngBitBtn
          Top = 24
          ExplicitTop = 24
        end
        inherited btEditar: TPngBitBtn
          Top = 24
          OnClick = btEditarClick
          ExplicitTop = 24
        end
        object txtLocaliza: TEdit
          Left = 8
          Top = 32
          Width = 369
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
        end
        object txtCampo: TComboBox
          Left = 381
          Top = 32
          Width = 132
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 3
          Text = 'Nome do Usu'#225'rio'
          Items.Strings = (
            'C'#243'digo'
            'Nome do Usu'#225'rio')
        end
      end
      inherited GroupBox2: TGroupBox
        inherited grdDados: TDBGrid
          OnDblClick = grdDadosDblClick
          OnKeyPress = grdDadosKeyPress
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_USUARIO'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome do Usu'#225'rio'
              Width = 508
              Visible = True
            end>
        end
      end
    end
  end
  inherited cdsTab: TClientDataSet
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
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
  end
end
