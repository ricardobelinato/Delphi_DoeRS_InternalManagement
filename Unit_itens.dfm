object Itens: TItens
  Left = 0
  Top = 0
  Caption = 'Itens'
  ClientHeight = 446
  ClientWidth = 622
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
    Height = 369
    DataSource = DataModule3.DataSource_Itens
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
      Width = 46
      Height = 28
      Caption = 'Itens'
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
    Top = 407
    Width = 625
    Height = 41
    TabOrder = 2
    object Button1: TButton
      Left = 367
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
    end
    object Button2: TButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
    end
    object Button3: TButton
      Left = 529
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
    end
  end
end
