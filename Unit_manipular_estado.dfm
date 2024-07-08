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
    object btnSalvar: TButton
      Left = 248
      Top = 11
      Width = 105
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
  end
  object Panel2: TPanel
    Left = -8
    Top = 0
    Width = 361
    Height = 121
    TabOrder = 1
    object lblSiglaEstado: TLabel
      Left = 16
      Top = 16
      Width = 88
      Height = 15
      Caption = 'Sigla do Estado *'
    end
    object lblEstado: TLabel
      Left = 168
      Top = 16
      Width = 35
      Height = 15
      Caption = 'Estado'
    end
    object lblCodigoEstado: TLabel
      Left = 16
      Top = 66
      Width = 94
      Height = 15
      Caption = 'C'#243'digo do Estado'
    end
    object lblCodigoUsuario: TLabel
      Left = 168
      Top = 66
      Width = 99
      Height = 15
      Caption = 'C'#243'digo do Usu'#225'rio'
    end
    object cmbSiglaEstado: TComboBox
      Left = 16
      Top = 37
      Width = 137
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = cmbSiglaEstadoChange
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
    object edtEstado: TEdit
      Left = 168
      Top = 37
      Width = 153
      Height = 23
      Enabled = False
      TabOrder = 1
    end
    object edtCodigoEstado: TEdit
      Left = 16
      Top = 87
      Width = 137
      Height = 23
      TabOrder = 2
    end
    object edtCodigoUsuario: TEdit
      Left = 168
      Top = 87
      Width = 153
      Height = 23
      TabOrder = 3
    end
  end
end
