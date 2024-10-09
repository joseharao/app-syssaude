inherited frmLDeficiencia: TfrmLDeficiencia
  Caption = 'Listagem de Cadastro de Defici'#234'ncia'
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
        inherited btEditar: TPngBitBtn
          OnClick = btEditarClick
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
          Text = 'Descri'#231#227'o'
          Items.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o')
        end
      end
      inherited GroupBox2: TGroupBox
        inherited grdDados: TDBGrid
          OnDblClick = grdDadosDblClick
          OnKeyDown = grdDadosKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_DEFICIENCIA'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DAT_CAD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Nome da Defici'#234'ncia'
              Width = 578
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POSICAO'
              Visible = False
            end>
        end
      end
    end
  end
  inherited cdsTab: TClientDataSet
    object cdsTabCOD_DEFICIENCIA: TIntegerField
      FieldName = 'COD_DEFICIENCIA'
      Required = True
    end
    object cdsTabDAT_CAD: TDateField
      FieldName = 'DAT_CAD'
    end
    object cdsTabDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  inherited sqlTab: TSQLQuery
    SQL.Strings = (
      'SELECT * FROM DEFICIENCIA')
  end
end
