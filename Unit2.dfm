object DataModule2: TDataModule2
  Height = 750
  Width = 1000
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=delphi'
      'User_Name=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Left = 96
    Top = 72
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\pcrub\OneDrive\'#193'rea de Trabalho\delphi\projeto\libmysql' +
      '.dll'
    Left = 248
    Top = 72
  end
end
