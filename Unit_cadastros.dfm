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
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 73
    Align = alTop
    Color = clHotLight
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 625
    object Label1: TLabel
      Left = 160
      Top = 11
      Width = 282
      Height = 32
      Caption = 'Seja bem vindo de volta!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCream
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 128
      Top = 40
      Width = 357
      Height = 15
      Caption = 'Cadastre uma doa'#231#227'o / item preenchendo todos os campos abaixo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCream
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 71
    Width = 625
    Height = 370
    TabOrder = 1
  end
  object MainMenu1: TMainMenu
    Left = 568
    Top = 8
    object Usurios1: TMenuItem
      Caption = 'Usu'#225'rios'
      OnClick = Usurios1Click
    end
    object Cidades1: TMenuItem
      Caption = 'Cidades'
      OnClick = Cidades1Click
    end
    object Estados1: TMenuItem
      Caption = 'Estados'
      OnClick = Estados1Click
    end
    object Instituies2: TMenuItem
      Caption = 'Institui'#231#245'es'
      OnClick = Instituies2Click
    end
    object Itens3: TMenuItem
      Caption = 'Itens'
      OnClick = Itens3Click
    end
    object iposdeItens1: TMenuItem
      Caption = 'Tipos de Itens'
      OnClick = iposdeItens1Click
    end
  end
end
