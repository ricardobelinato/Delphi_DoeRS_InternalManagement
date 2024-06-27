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
  object Panel2: TPanel
    Left = 0
    Top = 407
    Width = 625
    Height = 41
    TabOrder = 2
    object Btn_adicionar: TButton
      Left = 366
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = Btn_adicionarClick
    end
    object Btn_editar: TButton
      Left = 447
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = Btn_editarClick
    end
    object Btn_excluir: TButton
      Left = 528
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = Btn_excluirClick
    end
  end
end
