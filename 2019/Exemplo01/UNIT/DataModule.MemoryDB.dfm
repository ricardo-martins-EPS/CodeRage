object dmMemoryDB: TdmMemoryDB
  OldCreateOrder = False
  Height = 260
  Width = 449
  object sqlfValidarDocumento: TFDSQLiteFunction
    DriverLink = plkSQlite
    FunctionName = 'DocumentoValido'
    ArgumentsCount = 1
    OnCalculate = sqlfValidarDocumentoCalculate
    Left = 152
    Top = 184
  end
  object connMemoryDB: TFDConnection
    Params.Strings = (
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 54
    Top = 72
  end
  object lsqlMemoryDB: TFDLocalSQL
    Connection = connMemoryDB
    Left = 54
    Top = 128
  end
  object qryDisplay: TFDQuery
    Connection = connMemoryDB
    Left = 54
    Top = 184
  end
  object plkSQlite: TFDPhysSQLiteDriverLink
    Left = 52
    Top = 16
  end
end
