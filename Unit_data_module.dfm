object DataModule3: TDataModule3
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FD_Connection: TFDConnection
    Params.Strings = (
      'Database=delphi'
      'User_Name=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Connected = True
    Left = 104
    Top = 32
  end
  object FDQuery_Cidades: TFDQuery
    Active = True
    Connection = FD_Connection
    SQL.Strings = (
      'SELECT * FROM cidade;')
    Left = 104
    Top = 208
  end
  object DataSource_Cidades: TDataSource
    DataSet = FDQuery_Cidades
    Left = 296
    Top = 208
  end
  object FDQuery_Usuarios: TFDQuery
    Active = True
    Connection = FD_Connection
    SQL.Strings = (
      'SELECT * FROM usuario')
    Left = 104
    Top = 120
  end
  object DataSource_Usuarios: TDataSource
    DataSet = FDQuery_Usuarios
    Left = 296
    Top = 120
  end
  object FDQuery_Estados: TFDQuery
    Active = True
    Connection = FD_Connection
    SQL.Strings = (
      'SELECT * FROM estado;')
    Left = 104
    Top = 296
  end
  object DataSource_Estados: TDataSource
    DataSet = FDQuery_Estados
    Left = 296
    Top = 296
  end
  object FDQuery_Instituicoes: TFDQuery
    Active = True
    ChangeAlertName = 'FDQuery_Instituicoes'
    Connection = FD_Connection
    SQL.Strings = (
      'SELECT * FROM instituicao;')
    Left = 104
    Top = 384
  end
  object DataSource_Instituicoes: TDataSource
    DataSet = FDQuery_Instituicoes
    Left = 296
    Top = 384
  end
  object FDQuery_Itens: TFDQuery
    Active = True
    Connection = FD_Connection
    SQL.Strings = (
      'SELECT * FROM item;')
    Left = 104
    Top = 472
  end
  object DataSource_Itens: TDataSource
    DataSet = FDQuery_Itens
    Left = 296
    Top = 472
  end
  object DataSource_tipos_de_itens: TDataSource
    DataSet = FDQuery_tipos_de_itens
    Left = 296
    Top = 560
  end
  object FDQuery_tipos_de_itens: TFDQuery
    Active = True
    Connection = FD_Connection
    SQL.Strings = (
      'SELECT * FROM tipoitem;')
    Left = 104
    Top = 560
  end
end
