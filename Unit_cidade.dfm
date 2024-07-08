object Form_cidade: TForm_cidade
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cidades'
  ClientHeight = 440
  ClientWidth = 629
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 633
    Height = 361
    DataSource = DataModule3.DataSource_Cidades
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 638
    Height = 41
    Color = clHotLight
    ParentBackground = False
    TabOrder = 1
    object lblCidades: TLabel
      Left = 8
      Top = 6
      Width = 73
      Height = 28
      Caption = 'Cidades'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCream
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnl2: TPanel
    Left = 0
    Top = 400
    Width = 633
    Height = 41
    TabOrder = 2
    object btnAdicionar: TButton
      Left = 374
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = btnAdicionarClick
    end
    object btnEditar: TButton
      Left = 455
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 536
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Excluir'
      DisabledImageName = 'btnExcluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
end
