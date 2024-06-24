object Form_usuarios: TForm_usuarios
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Form_usuario'
  ClientHeight = 440
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object DBGrid_usuario: TDBGrid
    Left = 0
    Top = 40
    Width = 625
    Height = 354
    DataSource = DataModule3.DataSource_Usuarios
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 625
    Height = 41
    Color = clHotLight
    ParentBackground = False
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 6
      Width = 81
      Height = 28
      Caption = 'Usu'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCream
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 392
    Width = 625
    Height = 49
    TabOrder = 2
    object btnAdicionar: TButton
      Left = 367
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      DisabledImageName = 'btnAdicionar'
      TabOrder = 0
      OnClick = btnAdicionarClick
    end
    object btnEditar: TButton
      Left = 448
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      DisabledImageName = 'btnEditar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 529
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      DisabledImageName = 'btnExcluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
end
