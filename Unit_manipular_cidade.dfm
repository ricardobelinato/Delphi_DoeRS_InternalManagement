object Form_manipular_cidade: TForm_manipular_cidade
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Cidade'
  ClientHeight = 167
  ClientWidth = 416
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
    Top = 117
    Width = 433
    Height = 57
    TabOrder = 0
    object btnSalvar: TButton
      Left = 312
      Top = 10
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
    Width = 425
    Height = 121
    TabOrder = 1
    object lblNomeCidade: TLabel
      Left = 117
      Top = 17
      Width = 95
      Height = 15
      Caption = 'Nome da cidade *'
    end
    object lblPopulacao: TLabel
      Left = 256
      Top = 17
      Width = 64
      Height = 15
      Caption = 'Popula'#231#227'o *'
    end
    object lblCodigoCidade: TLabel
      Left = 16
      Top = 67
      Width = 95
      Height = 15
      Caption = 'C'#243'digo da Cidade'
    end
    object lblCodigoEstado: TLabel
      Left = 143
      Top = 67
      Width = 94
      Height = 15
      Caption = 'C'#243'digo do Estado'
    end
    object lblCodigoUsuario: TLabel
      Left = 272
      Top = 67
      Width = 99
      Height = 15
      Caption = 'C'#243'digo do Usu'#225'rio'
    end
    object UF: TLabel
      Left = 16
      Top = 17
      Width = 43
      Height = 15
      Caption = 'Estado *'
    end
    object edtNomeCidade: TEdit
      Left = 117
      Top = 38
      Width = 133
      Height = 23
      TabOrder = 0
    end
    object edtPopulacao: TEdit
      Left = 256
      Top = 38
      Width = 161
      Height = 23
      ImeName = 'Portuguese (Brazilian ABNT)'
      NumbersOnly = True
      TabOrder = 1
    end
    object edtCodigoCidade: TEdit
      Left = 16
      Top = 88
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object edtCodigoEstado: TEdit
      Left = 143
      Top = 88
      Width = 123
      Height = 23
      TabOrder = 3
    end
    object edtCodigoUsuario: TEdit
      Left = 272
      Top = 88
      Width = 145
      Height = 23
      TabOrder = 4
    end
    object cmbSiglaEstado: TComboBox
      Left = 16
      Top = 38
      Width = 95
      Height = 23
      TabOrder = 5
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
  end
end
