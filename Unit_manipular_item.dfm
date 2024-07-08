object Form_manipular_item: TForm_manipular_item
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Item'
  ClientHeight = 167
  ClientWidth = 490
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = -1
    Top = 127
    Width = 498
    Height = 41
    TabOrder = 0
    object btnSalvar: TButton
      Left = 380
      Top = 8
      Width = 105
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
  end
  object Panel2: TPanel
    Left = -2
    Top = 0
    Width = 499
    Height = 129
    TabOrder = 1
    object lblNomeItem: TLabel
      Left = 16
      Top = 16
      Width = 32
      Height = 15
      Caption = 'Item *'
    end
    object lblUnidade: TLabel
      Left = 143
      Top = 16
      Width = 52
      Height = 15
      Caption = 'Unidade *'
    end
    object lblDataValidade: TLabel
      Left = 215
      Top = 16
      Width = 95
      Height = 15
      Caption = 'Data de validade *'
    end
    object lblCodigoItem: TLabel
      Left = 16
      Top = 66
      Width = 83
      Height = 15
      Caption = 'C'#243'digo do Item'
    end
    object lblCodigoTipoItem: TLabel
      Left = 119
      Top = 66
      Width = 90
      Height = 15
      Caption = 'C'#243'digo tipo item'
    end
    object lblCodigoUsuario: TLabel
      Left = 231
      Top = 66
      Width = 99
      Height = 15
      Caption = 'C'#243'digo do Usu'#225'rio'
    end
    object lblDescricaoTipoItem: TLabel
      Left = 341
      Top = 16
      Width = 144
      Height = 15
      Caption = 'Descri'#231#227'o do tipo do item *'
    end
    object edtDescricaoItem: TEdit
      Left = 16
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object cmbUnidade: TComboBox
      Left = 143
      Top = 37
      Width = 66
      Height = 23
      TabOrder = 1
      Items.Strings = (
        'kg'
        'g'
        't'
        'L'
        'ml'
        'unidade'
        'pacote'
        'caixa'
        'par'
        'pe'#231'a'
        'm')
    end
    object mskDataValidade: TMaskEdit
      Left = 215
      Top = 37
      Width = 120
      Height = 23
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 2
      Text = '  /  /  '
    end
    object edtCodigoItem: TEdit
      Left = 16
      Top = 87
      Width = 97
      Height = 23
      TabOrder = 3
    end
    object edtCodigoTipoItem: TEdit
      Left = 119
      Top = 87
      Width = 106
      Height = 23
      TabOrder = 4
    end
    object edtCodigoUsuario: TEdit
      Left = 231
      Top = 87
      Width = 104
      Height = 23
      TabOrder = 5
    end
    object cmbDescricaoTipoItem: TComboBox
      Left = 341
      Top = 37
      Width = 145
      Height = 23
      TabOrder = 6
      OnChange = cmbDescricaoTipoItemChange
    end
  end
end
