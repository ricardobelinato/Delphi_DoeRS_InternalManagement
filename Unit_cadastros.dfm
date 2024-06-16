object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 439
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
    object Label3: TLabel
      Left = 16
      Top = 16
      Width = 208
      Height = 15
      Caption = 'Preencha alguns dados sobre o doador:'
    end
    object Label4: TLabel
      Left = 16
      Top = 128
      Width = 199
      Height = 15
      Caption = 'Preencha alguns dados da institui'#231#227'o:'
    end
    object Label5: TLabel
      Left = 16
      Top = 208
      Width = 84
      Height = 15
      Caption = 'Sobre a doa'#231#227'o:'
    end
    object Edit1: TEdit
      Left = 16
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 0
      TextHint = 'Nome Completo'
    end
    object Edit2: TEdit
      Left = 143
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 1
      TextHint = 'CPF'
    end
    object CheckBox1: TCheckBox
      Left = 270
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Administrador'
      TabOrder = 2
    end
    object CheckBox2: TCheckBox
      Left = 397
      Top = 40
      Width = 97
      Height = 17
      Caption = 'Usu'#225'rio ativo'
      TabOrder = 3
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 72
      Width = 121
      Height = 23
      TabOrder = 4
      TextHint = 'Estado'
    end
    object Edit3: TEdit
      Left = 143
      Top = 72
      Width = 121
      Height = 23
      TabOrder = 5
      TextHint = 'Nome da Cidade'
    end
    object Edit4: TEdit
      Left = 270
      Top = 72
      Width = 121
      Height = 23
      TabOrder = 6
      TextHint = 'Popula'#231#227'o'
    end
    object Edit5: TEdit
      Left = 16
      Top = 149
      Width = 121
      Height = 23
      TabOrder = 7
      TextHint = 'Nome da Instiui'#231#227'o'
    end
    object Edit6: TEdit
      Left = 143
      Top = 149
      Width = 121
      Height = 23
      TabOrder = 8
      TextHint = 'CNPJ'
    end
    object Edit7: TEdit
      Left = 270
      Top = 149
      Width = 121
      Height = 23
      TabOrder = 9
      TextHint = 'Respons'#225'vel'
    end
    object Edit8: TEdit
      Left = 16
      Top = 229
      Width = 121
      Height = 23
      TabOrder = 10
      TextHint = 'Item'
    end
    object ComboBox2: TComboBox
      Left = 270
      Top = 229
      Width = 121
      Height = 23
      TabOrder = 11
      TextHint = 'Unidade'
    end
    object Edit9: TEdit
      Left = 397
      Top = 229
      Width = 121
      Height = 23
      TabOrder = 12
      TextHint = 'Data de Validade'
    end
    object ComboBox3: TComboBox
      Left = 143
      Top = 229
      Width = 121
      Height = 23
      TabOrder = 13
      TextHint = 'Descri'#231#227'o'
    end
    object Edit10: TEdit
      Left = 16
      Top = 258
      Width = 121
      Height = 23
      TabOrder = 14
      TextHint = 'Quantidade'
    end
    object Edit11: TEdit
      Left = 143
      Top = 258
      Width = 121
      Height = 23
      TabOrder = 15
      TextHint = 'Peso'
    end
    object Edit12: TEdit
      Left = 270
      Top = 258
      Width = 121
      Height = 23
      TabOrder = 16
      TextHint = 'Valor'
    end
    object Button1: TButton
      Left = 16
      Top = 304
      Width = 121
      Height = 33
      Caption = 'Enviar'
      TabOrder = 17
    end
  end
  object MainMenu1: TMainMenu
    Left = 552
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
