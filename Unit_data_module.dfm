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
    DataSet = FDQuery_Tipo_Item
    Left = 296
    Top = 560
  end
  object FDQuery_Tipo_Item: TFDQuery
    Active = True
    Connection = FD_Connection
    SQL.Strings = (
      'SELECT * FROM tipoitem;')
    Left = 104
    Top = 560
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\pcrub\OneDrive\Documentos\Embarcadero\Studio\Projects\l' +
      'ibmysql.dll'
    Left = 296
    Top = 32
  end
  object FDQuery_Cadastro: TFDQuery
    Active = True
    Connection = FD_Connection
    SQL.Strings = (
      'SELECT '
      '    it.codigo_item,'
      '    it.descricao_item,'
      '    it.data_validade,'
      '    it.unidade,'
      '    e.codigo_estado,'
      '    e.nome_estado,'
      '    e.sigla,'
      '    c.codigo_cidade,'
      '    c.nome_cidade,'
      '    c.populacao,'
      '    i.codigo_instituicao,'
      '    i.nome_instituicao,'
      '    i.cnpj,'
      '    i.responsavel'
      'FROM '
      '    Estado e'
      'JOIN '
      '    Cidade c ON e.codigo_estado = c.codigo_estado'
      'JOIN '
      '    Instituicao i ON c.codigo_cidade = i.codigo_cidade'
      'JOIN '
      '    Item it'
      'order by sigla;')
    Left = 584
    Top = 32
  end
  object DataSource_Cadastro: TDataSource
    DataSet = FDQuery_Cadastro
    Left = 784
    Top = 32
  end
  object FDQuery_CmbSiglaEstado: TFDQuery
    Active = True
    Connection = FD_Connection
    SQL.Strings = (
      'SELECT sigla FROM estado;')
    Left = 584
    Top = 120
  end
  object FDQuery_CmbNomeCidade: TFDQuery
    Active = True
    Connection = FD_Connection
    SQL.Strings = (
      'SELECT nome_cidade FROM cidade;')
    Left = 584
    Top = 208
  end
  object FDQuery_CmbDescricaoTipoItem: TFDQuery
    Active = True
    Connection = FD_Connection
    SQL.Strings = (
      'SELECT descricao_tipo_item FROM tipoitem;')
    Left = 584
    Top = 296
  end
end
