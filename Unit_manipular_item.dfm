object Form_manipular_item: TForm_manipular_item
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Item'
  ClientHeight = 167
  ClientWidth = 337
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
    Left = -1
    Top = 127
    Width = 359
    Height = 41
    TabOrder = 0
    object Btn_salvar: TButton
      Left = 229
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = Btn_salvarClick
    end
  end
  object Panel2: TPanel
    Left = -2
    Top = 0
    Width = 360
    Height = 129
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 32
      Height = 15
      Caption = 'Item *'
    end
    object Label2: TLabel
      Left = 143
      Top = 16
      Width = 52
      Height = 15
      Caption = 'Unidade *'
    end
    object Label3: TLabel
      Left = 215
      Top = 16
      Width = 95
      Height = 15
      Caption = 'Data de validade *'
    end
    object Label_codigo_item: TLabel
      Left = 16
      Top = 66
      Width = 83
      Height = 15
      Caption = 'C'#243'digo do Item'
    end
    object Label_codigo_tipo_item: TLabel
      Left = 119
      Top = 66
      Width = 90
      Height = 15
      Caption = 'C'#243'digo tipo item'
    end
    object Label_codigo_usuario: TLabel
      Left = 231
      Top = 66
      Width = 99
      Height = 15
      Caption = 'C'#243'digo do Usu'#225'rio'
    end
    object Edit_descricao_item: TEdit
      Left = 16
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object ComboBox_unidade: TComboBox
      Left = 143
      Top = 37
      Width = 66
      Height = 23
      TabOrder = 1
      Items.Strings = (
        'kg'
        'g'#11
        't'#11
        'L'#11
        'ml'#11
        'unidade'
        'pacote'
        'caixa'
        'par'
        'pe'#231'a'#11
        'm')
    end
    object MaskEdit_data_validade: TMaskEdit
      Left = 215
      Top = 37
      Width = 120
      Height = 23
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 2
      Text = '  /  /  '
    end
    object Edit_codigo_item: TEdit
      Left = 16
      Top = 87
      Width = 97
      Height = 23
      TabOrder = 3
    end
    object Edit_codigo_tipo_item: TEdit
      Left = 119
      Top = 87
      Width = 106
      Height = 23
      TabOrder = 4
    end
    object Edit_codigo_usuario: TEdit
      Left = 231
      Top = 87
      Width = 104
      Height = 23
      TabOrder = 5
    end
  end
end
