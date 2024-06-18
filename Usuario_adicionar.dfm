object Form_adicionar_usuario: TForm_adicionar_usuario
  Left = 0
  Top = 0
  Caption = 'Adicionar Usu'#225'rio'
  ClientHeight = 159
  ClientWidth = 368
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = -8
    Top = 120
    Width = 377
    Height = 41
    TabOrder = 0
    object Button1: TButton
      Left = 264
      Top = 7
      Width = 105
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = Button1Click
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
    object EditNome: TEdit
      Left = 16
      Top = 31
      Width = 169
      Height = 23
      TabOrder = 0
    end
    object EditCPF: TEdit
      Left = 205
      Top = 31
      Width = 164
      Height = 23
      NumbersOnly = True
      TabOrder = 1
    end
    object EditLogin: TEdit
      Left = 16
      Top = 81
      Width = 169
      Height = 23
      TabOrder = 2
    end
    object CheckboxAdm: TCheckBox
      Left = 205
      Top = 83
      Width = 97
      Height = 17
      Caption = 'Administrador'
      TabOrder = 3
      OnClick = CheckboxAdmClick
    end
    object CheckboxAtivo: TCheckBox
      Left = 320
      Top = 83
      Width = 97
      Height = 17
      Caption = 'Ativo'
      TabOrder = 4
      OnClick = CheckboxAtivoClick
    end
  end
  object FD_Connection: TFDConnection
    Params.Strings = (
      'Database=delphi'
      'User_Name=root'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Left = 32
    Top = 107
  end
end
