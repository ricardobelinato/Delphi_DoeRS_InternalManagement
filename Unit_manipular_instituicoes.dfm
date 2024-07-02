object Form_manipular_instituicao: TForm_manipular_instituicao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Institui'#231#227'o'
  ClientHeight = 156
  ClientWidth = 368
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
    Left = 0
    Top = 120
    Width = 369
    Height = 41
    TabOrder = 0
    object btnSalvar: TButton
      Left = 256
      Top = 7
      Width = 105
      Height = 25
      Caption = 'Salvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
  end
  object Panel2: TPanel
    Left = -7
    Top = 0
    Width = 376
    Height = 121
    TabOrder = 1
    object lblNomeInstituicao: TLabel
      Left = 16
      Top = 16
      Width = 115
      Height = 15
      Caption = 'Nome da Institui'#231#227'o *'
    end
    object lblCpnj: TLabel
      Left = 143
      Top = 16
      Width = 35
      Height = 15
      Caption = 'CNPJ *'
    end
    object lblResponsavel: TLabel
      Left = 247
      Top = 16
      Width = 73
      Height = 15
      Caption = 'Respons'#225'vel *'
    end
    object lblCodigoInstituicao: TLabel
      Left = 16
      Top = 66
      Width = 113
      Height = 15
      Caption = 'C'#243'digo da Institui'#231#227'o'
    end
    object lblCodigoCidade: TLabel
      Left = 143
      Top = 66
      Width = 95
      Height = 15
      Caption = 'C'#243'digo da Cidade'
    end
    object lblCodigoUsuario: TLabel
      Left = 247
      Top = 66
      Width = 99
      Height = 15
      Caption = 'C'#243'digo do Usu'#225'rio'
    end
    object edtNomeInstituicao: TEdit
      Left = 16
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 0
    end
    object mskCnpj: TMaskEdit
      Left = 143
      Top = 37
      Width = 98
      Height = 23
      EditMask = '00.000.000/0000-00;1;_'
      MaxLength = 18
      TabOrder = 1
      Text = '  .   .   /    -  '
    end
    object edtResponsavel: TEdit
      Left = 247
      Top = 37
      Width = 121
      Height = 23
      TabOrder = 2
    end
    object edtCodigoInstituicao: TEdit
      Left = 16
      Top = 87
      Width = 121
      Height = 23
      TabOrder = 3
    end
    object edtCodigoCidade: TEdit
      Left = 143
      Top = 87
      Width = 98
      Height = 23
      TabOrder = 4
    end
    object edtCodigoUsuario: TEdit
      Left = 247
      Top = 87
      Width = 121
      Height = 23
      TabOrder = 5
    end
  end
end
