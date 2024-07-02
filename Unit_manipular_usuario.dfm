object Form_manipular_usuario: TForm_manipular_usuario
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 189
  ClientWidth = 363
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
    Top = 146
    Width = 377
    Height = 54
    TabOrder = 0
    object btnSalvar: TButton
      Left = 264
      Top = 13
      Width = 105
      Height = 25
      Caption = 'Salvar'
      DisabledImageName = 'btnSalvar'
      TabOrder = 0
      OnClick = btnSalvarClick
    end
  end
  object Panel2: TPanel
    Left = -8
    Top = 0
    Width = 377
    Height = 153
    TabOrder = 1
    object lblLogin: TLabel
      Left = 16
      Top = 60
      Width = 38
      Height = 15
      Caption = 'Login *'
    end
    object lblNome: TLabel
      Left = 16
      Top = 10
      Width = 41
      Height = 15
      Caption = 'Nome *'
    end
    object lblCpf: TLabel
      Left = 205
      Top = 10
      Width = 29
      Height = 15
      Caption = 'CPF *'
    end
    object lblCodigoUsuario: TLabel
      Left = 16
      Top = 120
      Width = 81
      Height = 15
      Caption = 'C'#243'digo usu'#225'rio'
    end
    object edtNomeUsuario: TEdit
      Left = 16
      Top = 31
      Width = 169
      Height = 23
      ImeName = 'Edit_nome_usuario'
      TabOrder = 0
    end
    object edtLogin: TEdit
      Left = 16
      Top = 80
      Width = 169
      Height = 23
      TabOrder = 1
    end
    object edtCpf: TEdit
      Left = 205
      Top = 31
      Width = 164
      Height = 23
      MaxLength = 11
      NumbersOnly = True
      TabOrder = 2
    end
    object chkAdm: TCheckBox
      Left = 205
      Top = 83
      Width = 97
      Height = 17
      Caption = 'Administrador'
      TabOrder = 3
    end
    object chkAtivo: TCheckBox
      Left = 308
      Top = 83
      Width = 97
      Height = 17
      Caption = 'Ativo'
      TabOrder = 4
    end
    object edtCodigoUsuario: TEdit
      Left = 103
      Top = 117
      Width = 82
      Height = 23
      ImeName = 'Edit_codigo_usuario'
      TabOrder = 5
    end
  end
end
