object dmPrincipal: TdmPrincipal
  OldCreateOrder = False
  Height = 483
  Width = 678
  object plkFirebird: TFDPhysFBDriverLink
    VendorLib = 'gds32.dll'
    Left = 56
    Top = 24
  end
  object connFirebird: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      
        'Database=C:\Projetos\CodeRage\2019\Exemplo01\bin\Data\Firebird\E' +
        'XEMPLO01.FDB')
    ConnectedStoredUsage = []
    LoginPrompt = False
    Left = 56
    Top = 88
  end
  object qryFBCliente: TFDQuery
    ActiveStoredUsage = []
    BeforeOpen = qryFBClienteBeforeOpen
    Connection = connFirebird
    SQL.Strings = (
      'SELECT ID, NOME, DOCUMENTO, DATA_INCLUSAO, DATA_ULTIMA_COMPRA'
      '  FROM TBCLI_CLIENTE')
    Left = 56
    Top = 152
    object qryFBClienteID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFBClienteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 200
    end
    object qryFBClienteDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
      Size = 15
    end
    object qryFBClienteDATA_INCLUSAO: TSQLTimeStampField
      FieldName = 'DATA_INCLUSAO'
      Origin = 'DATA_INCLUSAO'
    end
    object qryFBClienteDATA_ULTIMA_COMPRA: TSQLTimeStampField
      FieldName = 'DATA_ULTIMA_COMPRA'
      Origin = 'DATA_ULTIMA_COMPRA'
    end
  end
  object plkSQLite: TFDPhysSQLiteDriverLink
    Left = 152
    Top = 24
  end
  object connSQLite: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite'
      
        'Database=C:\Projetos\CodeRage\2019\Exemplo01\bin\Data\SQLite\EXE' +
        'MPLO01.FDB')
    LoginPrompt = False
    Left = 152
    Top = 88
  end
  object qrySQLCliente: TFDQuery
    BeforeOpen = qrySQLClienteBeforeOpen
    Connection = connSQLite
    SQL.Strings = (
      'SELECT ID,'
      '       NOME,'
      '       DOCUMENTO,'
      '       STATUS,'
      '       DATA_INCLUSAO'
      '  FROM TBCLI_Cliente')
    Left = 152
    Top = 152
  end
  object plkXML: TFDStanStorageXMLLink
    Left = 240
    Top = 24
  end
  object mtbXML: TFDMemTable
    AfterOpen = mtbXMLAfterOpen
    FieldDefs = <>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 240
    Top = 152
    object mtbXMLID: TIntegerField
      FieldName = 'ID'
    end
    object mtbXMLNOME: TStringField
      FieldName = 'NOME'
      Size = 200
    end
    object mtbXMLDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object mtbXMLSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object mtbXMLDATA_INCLUSAO: TDateTimeField
      FieldName = 'DATA_INCLUSAO'
    end
    object mtbXMLDATA_ULTIMA_COMPRA: TDateTimeField
      FieldName = 'DATA_ULTIMA_COMPRA'
    end
  end
  object connMemory: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 320
    Top = 88
  end
  object lsqlMemory: TFDLocalSQL
    Connection = connMemory
    DataSets = <
      item
        DataSet = qryFBCliente
        Name = 'tbFBCliente'
      end
      item
        DataSet = qrySQLCliente
        Name = 'tbSQLCliente'
      end
      item
        DataSet = mtbXML
        Name = 'tbXMLCliente'
      end>
    Left = 320
    Top = 152
  end
  object qryCliente: TFDQuery
    Connection = connMemory
    SQL.Strings = (
      
        'SELECT ID, NOME, DOCUMENTO, NULL AS "STATUS::VARCHAR(1)", DATA_I' +
        'NCLUSAO, DATA_ULTIMA_COMPRA, '#39'Firebird'#39' AS "ORIGEM::VARCHAR(8)"'
      '  FROM tbFBCliente'
      ''
      'UNION ALL'
      ''
      
        'SELECT ID, NOME, DOCUMENTO, STATUS, DATA_INCLUSAO, NULL AS "DATA' +
        '_ULTIMA_INCLUSAO::DATETIME", '#39'SQLite'#39' AS "ORIGEM::VARCHAR(8)"'
      '  FROM tbSQLCliente'
      ''
      'UNION ALL'
      ''
      
        'SELECT ID, NOME, DOCUMENTO, STATUS, DATA_INCLUSAO, DATA_ULTIMA_C' +
        'OMPRA, '#39'XML'#39' AS "ORIGEM::VARCHAR(8)"'
      '  FROM tbXMLCliente')
    Left = 320
    Top = 216
  end
end
