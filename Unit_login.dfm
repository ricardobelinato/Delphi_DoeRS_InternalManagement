object Form_Login: TForm_Login
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 417
  ClientWidth = 424
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 104
    Top = 96
    Width = 215
    Height = 17
    Caption = 'Entre com seu nome completo e CPF'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 168
    Top = 53
    Width = 72
    Height = 37
    Caption = 'Login'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 64
    Top = 131
    Width = 33
    Height = 15
    Caption = 'Nome'
  end
  object Label4: TLabel
    Left = 64
    Top = 189
    Width = 21
    Height = 15
    Caption = 'CPF'
  end
  object TEditName: TEdit
    Left = 64
    Top = 152
    Width = 289
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImeName = 'Portuguese (Brazilian ABNT)'
    ParentFont = False
    TabOrder = 0
  end
  object TEditCPF: TEdit
    Left = 64
    Top = 205
    Width = 289
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = []
    ImeName = 'Portuguese (Brazilian ABNT)'
    NumbersOnly = True
    ParentFont = False
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 64
    Top = 272
    Width = 289
    Height = 41
    BevelOuter = bvNone
    Color = clHotLight
    ParentBackground = False
    TabOrder = 2
    object SpeedButton1: TSpeedButton
      Left = 0
      Top = 0
      Width = 289
      Height = 41
      Cursor = crHandPoint
      Align = alClient
      Caption = 'Entrar'
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      StyleElements = [seClient]
      OnClick = SpeedButton1Click
      OnMouseEnter = SpeedButton1MouseEnter
      OnMouseLeave = SpeedButton1MouseLeave
      ExplicitLeft = 40
      ExplicitWidth = 217
    end
  end
  object FD_Connection: TFDConnection
    Params.Strings = (
      'Database=delphi'
      'User_Name=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Left = 64
    Top = 336
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 
      'C:\Users\pcrub\OneDrive\'#193'rea de Trabalho\delphi\projeto\libmysql' +
      '.dll'
    Left = 184
    Top = 336
  end
end
