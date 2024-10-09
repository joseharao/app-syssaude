inherited frmLVacinas: TfrmLVacinas
  Caption = 'Listagem de Cadastros de Vacinas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited GroupBox1: TGroupBox
        object Label2: TLabel [0]
          Left = 384
          Top = 17
          Width = 33
          Height = 13
          Caption = 'Campo'
        end
        object Label1: TLabel [1]
          Left = 8
          Top = 17
          Width = 86
          Height = 13
          Caption = 'Dados Para Busca'
        end
        inherited btEditar: TPngBitBtn
          OnClick = btEditarClick
        end
        object txtCampo: TComboBox
          Left = 381
          Top = 32
          Width = 132
          Height = 21
          Style = csDropDownList
          ItemIndex = 1
          TabOrder = 2
          Text = 'Descri'#231#227'o'
          Items.Strings = (
            'C'#243'digo'
            'Descri'#231#227'o')
        end
        object txtLocaliza: TEdit
          Left = 8
          Top = 32
          Width = 369
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
        end
      end
      inherited GroupBox2: TGroupBox
        inherited grdDados: TDBGrid
          OnDblClick = grdDadosDblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_VACINA'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_VACINA'
              Title.Caption = 'Nome da Vacina'
              Width = 560
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MES_PARA_APLICACAO'
              Visible = False
            end>
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
  end
  inherited sqlTab: TSQLQuery
    SQL.Strings = (
      'SELECT * FROM VACINA')
  end
end
