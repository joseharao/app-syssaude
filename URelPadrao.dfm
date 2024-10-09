object frmRelPadrao: TfrmRelPadrao
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio Padr'#227'o'
  ClientHeight = 517
  ClientWidth = 782
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsTab
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 66
      BandType = btColumnHeader
      object RLLabel1: TRLLabel
        Left = 254
        Top = 11
        Width = 199
        Height = 29
        Caption = 'Relat'#243'rio Padr'#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 0
        Top = 50
        Width = 130
        Height = 14
        Align = faLeftOnly
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Text = 'Data da Emiss'#227'o: '
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 471
        Top = 49
        Width = 247
        Height = 14
        Align = faRightOnly
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = itPagePreview
        ParentFont = False
        Text = 'P'#225'gina: # de #'
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 104
      Width = 718
      Height = 14
      BandType = btFooter
      object RLLabel2: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 14
        Align = faClient
        Alignment = taCenter
        AutoSize = False
        Caption = 
          'INFORATACADO - Sistema Gerenciamento de Agentes de Sa'#250'de [Vers'#227'o' +
          ': [1.0.0] DesenvolvidoPor: InforCENTER Sistemas]'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 6447714
        Font.Height = -9
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object dsTab: TDataSource
    DataSet = cdsTab
    Left = 424
  end
  object dspTab: TDataSetProvider
    DataSet = sqlTab
    Left = 463
  end
  object cdsTab: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTab'
    Left = 507
  end
  object sqlTab: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Dados.DB
    Left = 549
  end
  object RLPDFFilter1: TRLPDFFilter
    DocumentInfo.Creator = 
      'FortesReport (Open Source) v3.71B \251 Copyright '#169' 1999-2009 For' +
      'tes Inform'#225'tica'
    DisplayName = 'Documento PDF'
    Left = 616
    Top = 208
  end
  object RLXLSFilter1: TRLXLSFilter
    DisplayName = 'Planilha Excel'
    Left = 616
    Top = 264
  end
end
