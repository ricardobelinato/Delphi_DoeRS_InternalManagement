object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 135
    Height = 28
    Caption = 'Seja bem vindo'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 513
    Top = 67
    Width = 88
    Height = 15
    Caption = 'tela de cadastros'
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 96
    Width = 585
    Height = 281
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object MainMenu1: TMainMenu
    Left = 24
    Top = 384
    object Cadastro1: TMenuItem
      Caption = 'Cadastro'
    end
    object Usurios1: TMenuItem
      Caption = 'Usu'#225'rios'
    end
    object Cidades1: TMenuItem
      Caption = 'Cidades'
    end
    object Estados1: TMenuItem
      Caption = 'Estados'
    end
    object Instituies2: TMenuItem
      Caption = 'Institui'#231#245'es'
    end
    object Itens3: TMenuItem
      Caption = 'Itens'
    end
    object iposdeItens1: TMenuItem
      Caption = 'Tipos de Itens'
    end
  end
end
