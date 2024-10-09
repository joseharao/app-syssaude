inherited frmOrRVacina: TfrmOrRVacina
  Caption = 'Relat'#243'rio de Cadastro de Vacina'#231#227'o'
  ClientHeight = 319
  OnShow = FormShow
  ExplicitHeight = 358
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Height = 319
    ExplicitHeight = 319
    inherited Panel2: TPanel
      Height = 293
      ExplicitHeight = 293
      inherited Panel3: TPanel
        inherited Label1: TLabel
          Width = 315
          Caption = 'Formul'#225'rio usado para imprimir rela'#231#227'o de cran'#231'as para vacina'#231#227'o'
          ExplicitWidth = 315
        end
      end
      inherited btImprimir: TPngBitBtn
        Left = 6
        Top = 253
        OnClick = btImprimirClick
        ExplicitLeft = 6
        ExplicitTop = 253
      end
      inherited btCancelar: TPngBitBtn
        Left = 91
        Top = 253
        ExplicitLeft = 91
        ExplicitTop = 253
      end
      inherited GroupBox1: TGroupBox
        Height = 157
        ExplicitHeight = 157
        inherited txtOrdernado: TRadioGroup
          ItemIndex = 2
          Items.Strings = (
            'C'#243'digo'
            'Nome'
            'Vacina'
            'ACS')
        end
        object GroupBox7: TGroupBox
          Left = 159
          Top = 16
          Width = 366
          Height = 49
          Caption = 'Agente de Sa'#250'de'
          TabOrder = 1
          object DBLookupComboBox6: TDBLookupComboBox
            Left = 9
            Top = 18
            Width = 352
            Height = 21
            KeyField = 'COD_AGENTE'
            ListField = 'NOME_DO_AGENTE'
            ListSource = Dados.dsAgente
            TabOrder = 0
          end
        end
        object GroupBox2: TGroupBox
          Left = 159
          Top = 67
          Width = 366
          Height = 49
          Caption = 'Nome da Vacina'
          TabOrder = 2
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 6
            Top = 18
            Width = 352
            Height = 21
            KeyField = 'COD_VACINA'
            ListField = 'NOME_VACINA'
            ListSource = Dados.dsVacina
            TabOrder = 0
          end
        end
      end
    end
  end
end
