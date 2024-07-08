object Form_instituicao: TForm_instituicao
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Institui'#231#245'es'
  ClientHeight = 446
  ClientWidth = 624
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
    Width = 625
    Height = 369
    DataSource = DataModule3.DataSource_Instituicoes
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
    Width = 625
    Height = 41
    Color = clHotLight
    ParentBackground = False
    TabOrder = 1
    object lblInstituicoes: TLabel
      Left = 8
      Top = 6
      Width = 109
      Height = 28
      Caption = 'Institui'#231#245'es'
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
    Top = 407
    Width = 625
    Height = 41
    TabOrder = 2
    object btnAdicionar: TButton
      Left = 366
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      DisabledImageName = 'btnAdicionar'
      TabOrder = 0
      OnClick = btnAdicionarClick
    end
    object btnEditar: TButton
      Left = 447
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 528
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
end
