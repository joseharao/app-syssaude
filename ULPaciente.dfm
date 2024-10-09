inherited frmLPacientes: TfrmLPacientes
  Caption = 'Listagem de Cadastro de Pessoas'
  ExplicitWidth = 755
  ExplicitHeight = 527
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited Panel2: TPanel
      inherited GroupBox1: TGroupBox
        Height = 106
        ExplicitHeight = 106
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
        object Label3: TLabel [2]
          Left = 8
          Top = 63
          Width = 196
          Height = 13
          Caption = 'Agente de Sa'#250'de (Pres ESC Para Limpar)'
        end
        object Label4: TLabel [3]
          Left = 210
          Top = 63
          Width = 149
          Height = 13
          Caption = 'Posi'#231#227'o (Pres ESC Para Limpar)'
        end
        object Label5: TLabel [4]
          Left = 409
          Top = 63
          Width = 174
          Height = 13
          Caption = 'Classifica'#231#227'o (Pres ESC Para Limpar)'
        end
        inherited btEditar: TPngBitBtn
          Left = 608
          OnClick = btEditarClick
          ExplicitLeft = 608
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
          Text = 'Nome da Pessoa'
          Items.Strings = (
            'C'#243'digo'
            'Nome da Pessoa'
            'NIS'
            'Cart. SUS')
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 8
          Top = 77
          Width = 193
          Height = 21
          KeyField = 'COD_AGENTE'
          ListField = 'NOME_DO_AGENTE'
          ListSource = Dados.dsAgente
          TabOrder = 4
          OnKeyDown = DBLookupComboBox1KeyDown
        end
        object DBLookupComboBox2: TDBLookupComboBox
          Left = 210
          Top = 77
          Width = 193
          Height = 21
          KeyField = 'COD_POSICAO'
          ListField = 'DESCRICAO'
          ListSource = Dados.dsPosicao
          TabOrder = 5
          OnKeyDown = DBLookupComboBox2KeyDown
        end
        object DBLookupComboBox3: TDBLookupComboBox
          Left = 409
          Top = 77
          Width = 193
          Height = 21
          KeyField = 'COD_CLASS'
          ListField = 'DESCRICAO'
          ListSource = Dados.dsClass
          TabOrder = 6
          OnKeyDown = DBLookupComboBox3KeyDown
        end
      end
      inherited GroupBox2: TGroupBox
        Top = 125
        Height = 297
        ExplicitTop = 125
        ExplicitHeight = 297
        inherited grdDados: TDBGrid
          Height = 273
          OnDblClick = grdDadosDblClick
          OnKeyDown = grdDadosKeyDown
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_PESSOA'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome do Agente'
              Width = 288
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGENTE'
              Title.Caption = 'Nome do ACS'
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDADE_REAL'
              Title.Caption = 'Idade'
              Width = 133
              Visible = True
            end>
        end
      end
    end
  end
  inherited cdsTab: TClientDataSet
    PacketRecords = 50
    object cdsTabCOD_PESSOA: TIntegerField
      FieldName = 'COD_PESSOA'
      Required = True
    end
    object cdsTabCOD_IND: TIntegerField
      FieldName = 'COD_IND'
    end
    object cdsTabDAT_CAD: TDateField
      FieldName = 'DAT_CAD'
    end
    object cdsTabCOD_AGENTE: TIntegerField
      FieldName = 'COD_AGENTE'
    end
    object cdsTabNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsTabENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object cdsTabBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 80
    end
    object cdsTabCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 60
    end
    object cdsTabUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsTabGRAU_INSTRUCAO: TStringField
      FieldName = 'GRAU_INSTRUCAO'
      Size = 100
    end
    object cdsTabSEXO: TStringField
      FieldName = 'SEXO'
      Size = 1
    end
    object cdsTabGESTANTE: TStringField
      FieldName = 'GESTANTE'
      Size = 1
    end
    object cdsTabDUM: TDateField
      FieldName = 'DUM'
    end
    object cdsTabDPP: TDateField
      FieldName = 'DPP'
    end
    object cdsTabNIS: TStringField
      FieldName = 'NIS'
      Size = 100
    end
    object cdsTabCART_SUS: TStringField
      FieldName = 'CART_SUS'
      Size = 100
    end
    object cdsTabPOSICAO: TIntegerField
      FieldName = 'POSICAO'
    end
    object cdsTabAGENTE: TStringField
      FieldName = 'AGENTE'
      Size = 100
    end
    object cdsTabDAT_NASC: TDateField
      FieldName = 'DAT_NASC'
    end
    object cdsTabIDADE_REAL: TStringField
      FieldName = 'IDADE_REAL'
      Size = 300
    end
    object cdsTabIDADE: TSingleField
      FieldName = 'IDADE'
    end
  end
  inherited sqlTab: TSQLQuery
    MaxBlobSize = 1
    SQL.Strings = (
      'SELECT'
      '   P.*,'
      
        '   A.NOME_DO_AGENTE AS AGENTE, (SELECT IDADE FROM CALCULA_IDADE(' +
        'P.COD_PESSOA)) AS IDADE,'
      
        '    (SELECT IDADE_REAL FROM CALCULA_IDADE(P.COD_PESSOA)) AS IDAD' +
        'E_REAL'
      'FROM PESSOAS P, AGENTES A WHERE P.COD_AGENTE = A.COD_AGENTE')
  end
end
