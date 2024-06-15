object Cidades: TCidades
  Left = 0
  Top = 0
  Caption = 'Cidades'
  ClientHeight = 440
  ClientWidth = 630
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
    Width = 633
    Height = 361
    DataSource = DataModule3.DataSource_Cidades
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
    Width = 638
    Height = 41
    Color = clHotLight
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 73
      Height = 28
      Caption = 'Cidades'
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
    Width = 633
    Height = 41
    TabOrder = 2
    object Button1: TButton
      Left = 374
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 455
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 536
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
    end
  end
end
