object Form_manipular_estado: TForm_manipular_estado
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Estado'
  ClientHeight = 156
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
    Width = 361
    Height = 41
    TabOrder = 0
    object Btn_salvar: TButton
      Left = 256
      Top = 11
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
    Height = 121
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 88
      Height = 15
      Caption = 'Sigla do Estado *'
    end
    object Label2: TLabel
      Left = 168
      Top = 16
      Width = 35
      Height = 15
      Caption = 'Estado'
    end
    object Label_codigo_estado: TLabel
      Left = 16
      Top = 66
      Width = 94
      Height = 15
      Caption = 'C'#243'digo do Estado'
    end
    object Label_codigo_usuario: TLabel
      Left = 168
      Top = 66
      Width = 99
      Height = 15
      Caption = 'C'#243'digo do Usu'#225'rio'
    end
    object ComboBox_sigla_estado: TComboBox
      Left = 16
      Top = 37
      Width = 137
      Height = 23
      TabOrder = 0
      TextHint = 'Selecione o Estado'
      OnChange = ComboBox_sigla_estadoChange
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO')
    end
    object Edit_estado: TEdit
      Left = 168
      Top = 37
      Width = 153
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object Edit_codigo_estado: TEdit
      Left = 16
      Top = 87
      Width = 137
      Height = 23
      TabOrder = 2
    end
    object Edit_codigo_usuario: TEdit
      Left = 168
      Top = 87
      Width = 153
      Height = 23
      TabOrder = 3
    end
  end
end
