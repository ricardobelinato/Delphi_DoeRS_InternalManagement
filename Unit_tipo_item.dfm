object Form_tipo_item: TForm_tipo_item
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Tipos de Itens'
  ClientHeight = 437
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnl1: TPanel
    Left = 0
    Top = 0
    Width = 632
    Height = 41
    Color = clHotLight
    ParentBackground = False
    TabOrder = 0
    object lblTipoItem: TLabel
      Left = 8
      Top = 6
      Width = 132
      Height = 28
      Caption = 'Tipos de Itens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCream
      Font.Height = -20
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 40
    Width = 625
    Height = 361
    DataSource = DataModule3.DataSource_tipos_de_itens
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object pnl2: TPanel
    Left = 0
    Top = 400
    Width = 625
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
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
end
