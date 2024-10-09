inherited frmLAgentes: TfrmLAgentes
  Caption = 'Listagem de Cadastro de Agentes de Sa'#250'des'
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
          Text = 'Nome do Agente'
          Items.Strings = (
            'C'#243'digo'
            'Nome do Agente')
        end
      end
      inherited GroupBox2: TGroupBox
        inherited grdDados: TDBGrid
          OnDblClick = grdDadosDblClick
          OnKeyDown = grdDadosKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_AGENTE'
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
              FieldName = 'NOME_DO_AGENTE'
              Title.Caption = 'Nome do Agente'
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
    SQL.Strings = (
      'SELECT * FROM AGENTES')
  end
end
