inherited frmOrEntrega: TfrmOrEntrega
  Caption = 'Relat'#243'rio de Entrega Mensal'
  ClientHeight = 431
  ClientWidth = 715
  OnShow = FormShow
  ExplicitWidth = 731
  ExplicitHeight = 470
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 715
    Height = 431
    ExplicitWidth = 715
    ExplicitHeight = 431
    inherited Panel2: TPanel
      Width = 687
      Height = 405
      ExplicitWidth = 687
      ExplicitHeight = 405
      inherited Panel3: TPanel
        Width = 685
        ExplicitWidth = 685
        inherited Label1: TLabel
          Width = 281
          Caption = 'Formul'#225'rio usado para imprimir relat'#243'rio de entrega mensal'
          ExplicitWidth = 281
        end
      end
      inherited btImprimir: TPngBitBtn
        Top = 322
        OnClick = btImprimirClick
        ExplicitTop = 322
      end
      inherited btCancelar: TPngBitBtn
        Top = 322
        ExplicitTop = 322
      end
      inherited GroupBox1: TGroupBox
        Left = 16
        Width = 657
        Height = 229
        ExplicitLeft = 16
        ExplicitWidth = 657
        ExplicitHeight = 229
        object Label2: TLabel [0]
          Left = 480
          Top = 17
          Width = 47
          Height = 13
          Caption = 'M'#234's Inicio'
        end
        object Label3: TLabel [1]
          Left = 576
          Top = 17
          Width = 44
          Height = 13
          Caption = 'M'#234's Final'
        end
        object Label4: TLabel [2]
          Left = 552
          Top = 35
          Width = 17
          Height = 13
          Caption = 'At'#233
        end
        object Label5: TLabel [3]
          Left = 480
          Top = 57
          Width = 47
          Height = 13
          Caption = 'Ano Inicio'
        end
        object Label6: TLabel [4]
          Left = 552
          Top = 75
          Width = 17
          Height = 13
          Caption = 'At'#233
        end
        object Label7: TLabel [5]
          Left = 576
          Top = 57
          Width = 44
          Height = 13
          Caption = 'Ano Final'
        end
        inherited txtOrdernado: TRadioGroup
          Top = 24
          Width = 103
          Height = 81
          ItemIndex = 1
          Items.Strings = (
            'Indicador'
            'Nome')
          ExplicitTop = 24
          ExplicitWidth = 103
          ExplicitHeight = 81
        end
        object GroupBox2: TGroupBox
          Left = 114
          Top = 61
          Width = 223
          Height = 47
          Caption = 'Classifica'#231#227'o'
          TabOrder = 1
          object DBLookupComboBox1: TDBLookupComboBox
            Left = 9
            Top = 18
            Width = 208
            Height = 21
            KeyField = 'COD_CLASS'
            ListField = 'DESCRICAO'
            ListSource = Dados.dsClass
            TabOrder = 0
          end
        end
        object GroupBox3: TGroupBox
          Left = 114
          Top = 12
          Width = 223
          Height = 49
          Caption = 'Posi'#231#227'o'
          TabOrder = 2
          object DBLookupComboBox2: TDBLookupComboBox
            Left = 9
            Top = 18
            Width = 208
            Height = 21
            KeyField = 'COD_POSICAO'
            ListField = 'DESCRICAO'
            ListSource = Dados.dsPosicao
            TabOrder = 0
          end
        end
        object GroupBox4: TGroupBox
          Left = 10
          Top = 114
          Width = 247
          Height = 49
          Caption = 'Defici'#234'ncia'
          TabOrder = 3
          object DBLookupComboBox3: TDBLookupComboBox
            Left = 9
            Top = 18
            Width = 224
            Height = 21
            KeyField = 'COD_DEFICIENCIA'
            ListField = 'NOME'
            ListSource = Dados.dsDef
            TabOrder = 0
          end
        end
        object GroupBox5: TGroupBox
          Left = 260
          Top = 114
          Width = 211
          Height = 49
          Caption = 'Medicamentos'
          TabOrder = 4
          object DBLookupComboBox4: TDBLookupComboBox
            Left = 9
            Top = 18
            Width = 196
            Height = 21
            KeyField = 'COD_MEDICAMENTO'
            ListField = 'NOME'
            ListSource = Dados.dsMed
            TabOrder = 0
          end
        end
        object GroupBox6: TGroupBox
          Left = 8
          Top = 169
          Width = 249
          Height = 50
          Caption = 'Agravo'
          TabOrder = 5
          object DBLookupComboBox5: TDBLookupComboBox
            Left = 9
            Top = 19
            Width = 224
            Height = 21
            KeyField = 'COD_AGRAVO'
            ListField = 'NOME'
            ListSource = Dados.dsAgravo
            TabOrder = 0
          end
        end
        object txtSexo: TRadioGroup
          Left = 343
          Top = 12
          Width = 128
          Height = 96
          Caption = 'Sexo'
          ItemIndex = 2
          Items.Strings = (
            'Masculino'
            'Femino'
            'Todos')
          TabOrder = 6
        end
        object GroupBox7: TGroupBox
          Left = 254
          Top = 169
          Width = 217
          Height = 49
          Caption = 'Agente de Sa'#250'de'
          TabOrder = 7
          object DBLookupComboBox6: TDBLookupComboBox
            Left = 9
            Top = 18
            Width = 202
            Height = 21
            KeyField = 'COD_AGENTE'
            ListField = 'NOME_DO_AGENTE'
            ListSource = Dados.dsAgente
            TabOrder = 0
          end
        end
        object txtMInicio: TEdit
          Left = 480
          Top = 32
          Width = 65
          Height = 21
          TabOrder = 8
        end
        object txtMFim: TEdit
          Left = 576
          Top = 32
          Width = 65
          Height = 21
          TabOrder = 9
        end
        object txtAIni: TEdit
          Left = 480
          Top = 72
          Width = 65
          Height = 21
          TabOrder = 10
        end
        object txtAFim: TEdit
          Left = 576
          Top = 72
          Width = 65
          Height = 21
          TabOrder = 11
        end
        object chkSComp: TCheckBox
          Left = 480
          Top = 114
          Width = 161
          Height = 17
          Caption = 'Sem Complica'#231#245'es'
          TabOrder = 12
        end
        object chkangina: TCheckBox
          Left = 480
          Top = 131
          Width = 66
          Height = 17
          Caption = 'Angina'
          TabOrder = 13
        end
        object chkIAM: TCheckBox
          Left = 480
          Top = 148
          Width = 89
          Height = 17
          Caption = 'IAM'
          TabOrder = 14
        end
        object chkAVC: TCheckBox
          Left = 480
          Top = 165
          Width = 89
          Height = 17
          Caption = 'AVC'
          TabOrder = 15
        end
        object chkPeDiabetico: TCheckBox
          Left = 480
          Top = 180
          Width = 105
          Height = 17
          Caption = 'P'#233' Diab'#233'tico'
          TabOrder = 16
        end
        object chkAmputacao: TCheckBox
          Left = 480
          Top = 195
          Width = 105
          Height = 17
          Caption = 'Amputa'#231#227'o'
          TabOrder = 17
        end
        object chkDoenca: TCheckBox
          Left = 480
          Top = 210
          Width = 105
          Height = 17
          Caption = 'Doen'#231'a Renal'
          TabOrder = 18
        end
        object chkRetnopatia: TCheckBox
          Left = 558
          Top = 132
          Width = 105
          Height = 17
          Caption = 'Retinopatia'
          TabOrder = 19
        end
        object chkObsidade: TCheckBox
          Left = 558
          Top = 150
          Width = 105
          Height = 17
          Caption = 'Obsesidade'
          TabOrder = 20
        end
        object chkFumante: TCheckBox
          Left = 558
          Top = 166
          Width = 105
          Height = 17
          Caption = 'Fumante'
          TabOrder = 21
        end
        object chkAlcoolismo: TCheckBox
          Left = 558
          Top = 182
          Width = 105
          Height = 17
          Caption = 'Alcoolismo'
          TabOrder = 22
        end
        object chkMedicamento: TCheckBox
          Left = 559
          Top = 198
          Width = 105
          Height = 17
          Caption = 'Uso Cr'#244'nico'
          TabOrder = 23
        end
      end
      object chkGravida: TCheckBox
        Left = 199
        Top = 329
        Width = 225
        Height = 17
        Caption = 'Imprimir Sometes as Mulheres Gr'#225'vidas'
        TabOrder = 4
      end
      object chkAnalfa: TCheckBox
        Left = 496
        Top = 321
        Width = 105
        Height = 17
        Caption = 'Analfabetismo'
        TabOrder = 5
      end
      object chkDislipidemia: TCheckBox
        Left = 587
        Top = 321
        Width = 105
        Height = 17
        Caption = 'Dislipidemia'
        TabOrder = 6
      end
      object chkAcamado: TCheckBox
        Left = 496
        Top = 337
        Width = 85
        Height = 17
        Caption = 'Acamado'
        TabOrder = 7
      end
      object chkDomiciliado: TCheckBox
        Left = 587
        Top = 337
        Width = 105
        Height = 17
        Caption = 'Domiciliado'
        TabOrder = 8
      end
      object chkDesnutricao: TCheckBox
        Left = 496
        Top = 354
        Width = 85
        Height = 17
        Caption = 'Desnutri'#231#227'o'
        TabOrder = 9
      end
      object chkDesemprego: TCheckBox
        Left = 587
        Top = 354
        Width = 105
        Height = 17
        Caption = 'Desemprego'
        TabOrder = 10
      end
      object chkSedetar: TCheckBox
        Left = 496
        Top = 373
        Width = 85
        Height = 17
        Caption = 'Sedentarismo'
        TabOrder = 11
      end
      object chkAlimentacao: TCheckBox
        Left = 587
        Top = 373
        Width = 105
        Height = 17
        Caption = 'Alimenta'#231#227'o'
        TabOrder = 12
      end
      object chkMasCondicoes: TCheckBox
        Left = 320
        Top = 352
        Width = 170
        Height = 17
        Caption = 'Baixas condi'#231#245'es de Saneamento'
        TabOrder = 13
      end
    end
  end
end
