object Dados: TDados
  OldCreateOrder = False
  Height = 508
  Width = 676
  object DB: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      
        'Database=P:\Pasta M'#227'e\Sistemas\trunk\INFORAGENT\Banco\SISTEMA.GD' +
        'B'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 32
    Top = 24
  end
  object sqlBusca: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DB
    Left = 88
    Top = 24
  end
  object sqlUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM USUARIOS')
    SQLConnection = DB
    Left = 152
    Top = 32
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 205
    Top = 32
    object cdsUsuarioCOD_USUARIO: TIntegerField
      FieldName = 'COD_USUARIO'
      Required = True
    end
    object cdsUsuarioNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 400
    end
  end
  object dspUsuario: TDataSetProvider
    DataSet = sqlUsuario
    Left = 261
    Top = 32
  end
  object dsUsuario: TDataSource
    DataSet = cdsUsuario
    Left = 314
    Top = 34
  end
  object sqlParam: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM PARAM')
    SQLConnection = DB
    Left = 368
    Top = 32
  end
  object cdsParam: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParam'
    Left = 421
    Top = 32
    object cdsParamCOD_PARAM: TIntegerField
      FieldName = 'COD_PARAM'
      Required = True
    end
    object cdsParamDAT_CAD: TDateField
      FieldName = 'DAT_CAD'
    end
    object cdsParamDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsParamRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Size = 100
    end
  end
  object dspParam: TDataSetProvider
    DataSet = sqlParam
    Left = 477
    Top = 32
  end
  object dsParam: TDataSource
    DataSet = cdsParam
    Left = 530
    Top = 34
  end
  object sqlClass: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM CLASSIFICACAO ORDER BY DESCRICAO')
    SQLConnection = DB
    Left = 32
    Top = 96
  end
  object cdsClass: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClass'
    Left = 85
    Top = 96
    object cdsClassCOD_CLASS: TIntegerField
      FieldName = 'COD_CLASS'
      Required = True
    end
    object cdsClassDAT_CAD: TDateField
      FieldName = 'DAT_CAD'
    end
    object cdsClassDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object cdsClassACIMA_DE: TStringField
      FieldName = 'ACIMA_DE'
      Size = 1
    end
    object cdsClassIDADE_MIN: TIntegerField
      FieldName = 'IDADE_MIN'
    end
    object cdsClassIDADE_MAX: TIntegerField
      FieldName = 'IDADE_MAX'
    end
    object cdsClassABAIXO_DE: TStringField
      FieldName = 'ABAIXO_DE'
      Size = 1
    end
  end
  object dspClass: TDataSetProvider
    DataSet = sqlClass
    Left = 141
    Top = 96
  end
  object dsClass: TDataSource
    DataSet = cdsClass
    Left = 194
    Top = 98
  end
  object sqlPosicao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM POSICAO ORDER BY DESCRICAO')
    SQLConnection = DB
    Left = 240
    Top = 96
  end
  object cdsPosicao: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPosicao'
    Left = 293
    Top = 96
    object cdsPosicaoCOD_POSICAO: TIntegerField
      FieldName = 'COD_POSICAO'
      Required = True
    end
    object cdsPosicaoDAT_CAD: TDateField
      FieldName = 'DAT_CAD'
    end
    object cdsPosicaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
  end
  object dspPosicao: TDataSetProvider
    DataSet = sqlPosicao
    Left = 349
    Top = 96
  end
  object dsPosicao: TDataSource
    DataSet = cdsPosicao
    Left = 402
    Top = 98
  end
  object sqlAgente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT * FROM AGENTES ORDER BY NOME_DO_AGENTE')
    SQLConnection = DB
    Left = 456
    Top = 96
  end
  object cdsAgente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgente'
    Left = 509
    Top = 96
    object cdsAgenteCOD_AGENTE: TIntegerField
      FieldName = 'COD_AGENTE'
      Required = True
    end
    object cdsAgenteDAT_CAD: TDateField
      FieldName = 'DAT_CAD'
    end
    object cdsAgenteNOME_DO_AGENTE: TStringField
      FieldName = 'NOME_DO_AGENTE'
      Size = 100
    end
    object cdsAgentePOSICAO: TStringField
      FieldName = 'POSICAO'
      Size = 1
    end
  end
  object dspAgente: TDataSetProvider
    DataSet = sqlAgente
    Left = 565
    Top = 96
  end
  object dsAgente: TDataSource
    DataSet = cdsAgente
    Left = 618
    Top = 98
  end
  object dsPessoa: TDataSource
    DataSet = cdsPessoa
    Left = 618
    Top = 162
  end
  object dspPessoa: TDataSetProvider
    DataSet = sqlPessoa
    Left = 565
    Top = 160
  end
  object cdsPessoa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPessoa'
    Left = 509
    Top = 160
    object cdsPessoaCOD_PESSOA: TIntegerField
      FieldName = 'COD_PESSOA'
      Required = True
    end
    object cdsPessoaNOME: TStringField
      FieldName = 'NOME'
      Size = 114
    end
  end
  object sqlPessoa: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT COD_PESSOA, COD_PESSOA || '#39' - '#39' || NOME AS NOME FROM PESS' +
        'OAS ORDER BY NOME')
    SQLConnection = DB
    Left = 456
    Top = 160
  end
  object sqlMed: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT COD_MEDICAMENTO, COD_MEDICAMENTO || '#39' - '#39' || DESCRICAO AS' +
        ' NOME FROM MEDICAMENTOS ORDER BY DESCRICAO')
    SQLConnection = DB
    Left = 240
    Top = 160
  end
  object cdsMed: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMed'
    Left = 293
    Top = 160
    object cdsMedCOD_MEDICAMENTO: TIntegerField
      FieldName = 'COD_MEDICAMENTO'
      Required = True
    end
    object cdsMedNOME: TStringField
      FieldName = 'NOME'
      Size = 114
    end
  end
  object dspMed: TDataSetProvider
    DataSet = sqlMed
    Left = 349
    Top = 160
  end
  object dsMed: TDataSource
    DataSet = cdsMed
    Left = 402
    Top = 162
  end
  object sqlDef: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT COD_DEFICIENCIA, COD_DEFICIENCIA || '#39' - '#39' || DESCRICAO AS' +
        ' NOME FROM DEFICIENCIA ORDER BY DESCRICAO')
    SQLConnection = DB
    Left = 240
    Top = 208
  end
  object cdsDef: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDef'
    Left = 293
    Top = 208
    object cdsDefCOD_DEFICIENCIA: TIntegerField
      FieldName = 'COD_DEFICIENCIA'
      Required = True
    end
    object cdsDefNOME: TStringField
      FieldName = 'NOME'
      Size = 114
    end
  end
  object dspDef: TDataSetProvider
    DataSet = sqlDef
    Left = 349
    Top = 208
  end
  object dsDef: TDataSource
    DataSet = cdsDef
    Left = 402
    Top = 210
  end
  object dsAgravo: TDataSource
    DataSet = cdsAgravo
    Left = 194
    Top = 154
  end
  object dspAgravo: TDataSetProvider
    DataSet = sqlAgravo
    Left = 141
    Top = 152
  end
  object cdsAgravo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAgravo'
    Left = 85
    Top = 152
    object cdsAgravoCOD_AGRAVO: TIntegerField
      FieldName = 'COD_AGRAVO'
      Required = True
    end
    object cdsAgravoNOME: TStringField
      FieldName = 'NOME'
      Size = 114
    end
  end
  object sqlAgravo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT COD_AGRAVO, COD_AGRAVO || '#39' - '#39' || DESCRICAO AS NOME FROM' +
        ' AGRAVO ORDER BY DESCRICAO')
    SQLConnection = DB
    Left = 32
    Top = 152
  end
  object sqlVacina: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM VACINA')
    SQLConnection = DB
    Left = 240
    Top = 264
  end
  object cdsVacina: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVacina'
    Left = 293
    Top = 264
    object cdsVacinaCOD_VACINA: TIntegerField
      FieldName = 'COD_VACINA'
      Required = True
    end
    object cdsVacinaNOME_VACINA: TStringField
      FieldName = 'NOME_VACINA'
      Size = 100
    end
    object cdsVacinaMES_PARA_APLICACAO: TIntegerField
      FieldName = 'MES_PARA_APLICACAO'
    end
  end
  object dspVacina: TDataSetProvider
    DataSet = sqlVacina
    Left = 349
    Top = 264
  end
  object dsVacina: TDataSource
    DataSet = cdsVacina
    Left = 402
    Top = 266
  end
end
