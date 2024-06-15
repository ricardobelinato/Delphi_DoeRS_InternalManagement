object Form7: TForm7
  Left = 0
  Top = 0
  Caption = 'Institui'#231#245'es'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 625
    Height = 361
    DataSource = DataSource_Instituicoes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 41
    Color = clHotLight
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 109
      Height = 28
      Caption = 'Institui'#231#245'es'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCream
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 400
    Width = 624
    Height = 41
    TabOrder = 2
  end
  object FDQuery_Instituicoes: TFDQuery
    Active = True
    ChangeAlertName = 'FDQuery_Instituicoes'
    Connection = Form1.FDConnection1
    SQL.Strings = (
      'SELECT * FROM instituicao;')
    Left = 48
    Top = 144
  end
  object DataSource_Instituicoes: TDataSource
    DataSet = FDQuery_Instituicoes
    Left = 176
    Top = 144
  end
end
