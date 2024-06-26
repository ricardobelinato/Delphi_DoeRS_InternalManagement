object Form_manipular_cidade: TForm_manipular_cidade
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Cidade'
  ClientHeight = 167
  ClientWidth = 351
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = -8
    Top = 116
    Width = 367
    Height = 57
    TabOrder = 0
    object Button1: TButton
      Left = 248
      Top = 16
      Width = 105
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = -8
    Top = 0
    Width = 361
    Height = 121
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 17
      Width = 87
      Height = 15
      Caption = 'Nome da cidade'
    end
    object Label2: TLabel
      Left = 192
      Top = 17
      Width = 56
      Height = 15
      Caption = 'Popula'#231#227'o'
    end
    object Label_codigo_cidade: TLabel
      Left = 16
      Top = 67
      Width = 95
      Height = 15
      Caption = 'C'#243'digo da Cidade'
    end
    object Label_codigo_estado: TLabel
      Left = 127
      Top = 67
      Width = 94
      Height = 15
      Caption = 'C'#243'digo do Estado'
    end
    object Label_codigo_usuario: TLabel
      Left = 238
      Top = 67
      Width = 99
      Height = 15
      Caption = 'C'#243'digo do Usu'#225'rio'
    end
    object Edit_nome_cidade: TEdit
      Left = 16
      Top = 38
      Width = 161
      Height = 23
      TabOrder = 0
    end
    object Edit_populacao: TEdit
      Left = 192
      Top = 38
      Width = 161
      Height = 23
      TabOrder = 1
    end
    object Edit_codigo_cidade: TEdit
      Left = 16
      Top = 88
      Width = 95
      Height = 23
      TabOrder = 2
    end
    object Edit_codigo_estado: TEdit
      Left = 127
      Top = 88
      Width = 94
      Height = 23
      ImeName = 'Edit_codigo_estado'
      TabOrder = 3
    end
    object Edit_codigo_usuario: TEdit
      Left = 238
      Top = 88
      Width = 115
      Height = 23
      TabOrder = 4
    end
  end
end
