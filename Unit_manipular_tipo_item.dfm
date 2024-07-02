object Form_manipular_tipo_item: TForm_manipular_tipo_item
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Tipo de Item'
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
    Left = -10
    Top = 128
    Width = 363
    Height = 41
    TabOrder = 0
    object Btn_salvar: TButton
      Left = 248
      Top = 7
      Width = 105
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = Btn_salvarClick
    end
  end
  object Panel2: TPanel
    Left = -8
    Top = 0
    Width = 361
    Height = 129
    TabOrder = 1
    object lblDescricaoTipoItem: TLabel
      Left = 24
      Top = 16
      Width = 144
      Height = 15
      Caption = 'Descri'#231#227'o do tipo do item *'
    end
    object lblCodigoTipoItem: TLabel
      Left = 24
      Top = 66
      Width = 124
      Height = 15
      Caption = 'C'#243'digo do tipo do item'
    end
    object lblCodigoUsuario: TLabel
      Left = 168
      Top = 66
      Width = 98
      Height = 15
      Caption = 'C'#243'digo do usu'#225'rio'
    end
    object edtDescricaoTipoItem: TEdit
      Left = 24
      Top = 37
      Width = 169
      Height = 23
      TabOrder = 0
    end
    object edtCodigoTipoItem: TEdit
      Left = 24
      Top = 87
      Width = 121
      Height = 23
      TabOrder = 1
    end
    object edtCodigoUsuario: TEdit
      Left = 168
      Top = 87
      Width = 121
      Height = 23
      TabOrder = 2
    end
  end
end
