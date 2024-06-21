object Form_cadastro: TForm_cadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 544
  ClientWidth = 948
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 948
    Height = 81
    Align = alTop
    Color = clHotLight
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 946
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 946
      Height = 79
      Align = alClient
      Alignment = taCenter
      Caption = 'Seja bem vindo de volta!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCream
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 282
      ExplicitHeight = 32
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 948
    Height = 463
    Align = alClient
    TabOrder = 1
    ExplicitTop = 80
    ExplicitWidth = 956
    ExplicitHeight = 465
    object Label6: TLabel
      Left = 16
      Top = 16
      Width = 517
      Height = 23
      Alignment = taCenter
      Caption = 'Cadastre uma doa'#231#227'o / item preenchendo todos os campos abaixo:'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 107
      Height = 15
      Caption = 'Nome da institui'#231#227'o'
    end
    object Label3: TLabel
      Left = 169
      Top = 56
      Width = 27
      Height = 15
      Caption = 'CNPJ'
    end
    object Label4: TLabel
      Left = 320
      Top = 56
      Width = 65
      Height = 15
      Caption = 'Respons'#225'vel'
    end
    object Label7: TLabel
      Left = 16
      Top = 120
      Width = 24
      Height = 15
      Caption = 'Item'
    end
    object Label5: TLabel
      Left = 169
      Top = 120
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object Label8: TLabel
      Left = 320
      Top = 120
      Width = 44
      Height = 15
      Caption = 'Unidade'
    end
    object Label9: TLabel
      Left = 472
      Top = 120
      Width = 87
      Height = 15
      Caption = 'Data de validade'
    end
    object Label10: TLabel
      Left = 16
      Top = 170
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object Label11: TLabel
      Left = 169
      Top = 170
      Width = 25
      Height = 15
      Caption = 'Peso'
    end
    object Label12: TLabel
      Left = 320
      Top = 170
      Width = 26
      Height = 15
      Caption = 'Valor'
    end
    object Edit5: TEdit
      Left = 16
      Top = 77
      Width = 137
      Height = 23
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 169
      Top = 77
      Width = 137
      Height = 23
      TabOrder = 1
    end
    object Edit7: TEdit
      Left = 320
      Top = 77
      Width = 137
      Height = 23
      TabOrder = 2
    end
    object Edit8: TEdit
      Left = 16
      Top = 141
      Width = 137
      Height = 23
      TabOrder = 3
    end
    object ComboBox2: TComboBox
      Left = 320
      Top = 141
      Width = 137
      Height = 23
      TabOrder = 4
      TextHint = 'Unidade'
    end
    object Edit9: TEdit
      Left = 472
      Top = 141
      Width = 137
      Height = 23
      TabOrder = 5
    end
    object ComboBox3: TComboBox
      Left = 169
      Top = 141
      Width = 137
      Height = 23
      TabOrder = 6
    end
    object Edit10: TEdit
      Left = 16
      Top = 191
      Width = 137
      Height = 23
      TabOrder = 7
    end
    object Edit11: TEdit
      Left = 169
      Top = 191
      Width = 137
      Height = 23
      TabOrder = 8
    end
    object Edit12: TEdit
      Left = 320
      Top = 191
      Width = 137
      Height = 23
      TabOrder = 9
    end
    object Button1: TButton
      Left = 16
      Top = 238
      Width = 121
      Height = 33
      Caption = 'Enviar'
      TabOrder = 10
    end
  end
  object MainMenu1: TMainMenu
    Left = 888
    Top = 16
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
