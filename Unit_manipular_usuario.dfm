object Form_manipular_usuario: TForm_manipular_usuario
  Left = 0
  Top = 0
  Caption = 'Cadastro de Usu'#225'rio'
  ClientHeight = 167
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = -8
    Top = 127
    Width = 377
    Height = 41
    TabOrder = 0
    object btnSalvar: TButton
      Left = 264
      Top = 7
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
    Height = 121
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 60
      Width = 30
      Height = 15
      Caption = 'Login'
    end
    object Label2: TLabel
      Left = 16
      Top = 10
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 205
      Top = 10
      Width = 21
      Height = 15
      Caption = 'CPF'
    end
    object EditNome: TDBEdit
      Left = 16
      Top = 31
      Width = 169
      Height = 23
      DataField = 'nome_completo'
      DataSource = DataModule3.DataSource_Usuarios
      TabOrder = 0
    end
    object EditCPF: TDBEdit
      Left = 205
      Top = 31
      Width = 164
      Height = 23
      DataField = 'cpf'
      DataSource = DataModule3.DataSource_Usuarios
      TabOrder = 1
    end
    object EditLogin: TDBEdit
      Left = 16
      Top = 81
      Width = 169
      Height = 23
      DataField = 'login'
      DataSource = DataModule3.DataSource_Usuarios
      TabOrder = 2
    end
    object CheckboxAdm: TDBCheckBox
      Left = 205
      Top = 83
      Width = 97
      Height = 17
      Caption = 'Administrador'
      DataField = 'indicador_administrador'
      DataSource = DataModule3.DataSource_Usuarios
      TabOrder = 3
    end
    object CheckboxAtivo: TDBCheckBox
      Left = 320
      Top = 83
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'indicador_usuario_ativo'
      DataSource = DataModule3.DataSource_Usuarios
      TabOrder = 4
    end
  end
end
