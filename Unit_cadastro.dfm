object Form_cadastro: TForm_cadastro
  Left = 0
  Top = 0
  Align = alBottom
  Caption = 'Cadastro'
  ClientHeight = 544
  ClientWidth = 948
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  WindowState = wsMaximized
  OnActivate = FormActivate
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 948
    Height = 81
    Align = alTop
    BevelOuter = bvNone
    Color = clHotLight
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 946
    object lblSejaBemVindo: TLabel
      Left = 0
      Top = 0
      Width = 948
      Height = 81
      Align = alClient
      Alignment = taCenter
      Caption = 'Seja bem vindo!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clCream
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 206
      ExplicitHeight = 37
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 475
    Height = 463
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 455
    object lblItemDoado: TLabel
      Left = 107
      Top = 88
      Width = 61
      Height = 15
      Caption = 'Item doado'
    end
    object lblQuantidade: TLabel
      Left = 315
      Top = 87
      Width = 62
      Height = 15
      Caption = 'Quantidade'
    end
    object lblValor: TLabel
      Left = 223
      Top = 88
      Width = 26
      Height = 15
      Caption = 'Valor'
    end
    object lblPeso: TLabel
      Left = 107
      Top = 146
      Width = 25
      Height = 15
      Caption = 'Peso'
    end
    object lblDescricao: TLabel
      Left = 315
      Top = 146
      Width = 51
      Height = 15
      Caption = 'Descri'#231#227'o'
    end
    object lblUnidade: TLabel
      Left = 223
      Top = 146
      Width = 44
      Height = 15
      Caption = 'Unidade'
    end
    object lblEstado: TLabel
      Left = 107
      Top = 258
      Width = 35
      Height = 15
      Caption = 'Estado'
    end
    object lblNomeEstado: TLabel
      Left = 187
      Top = 258
      Width = 88
      Height = 15
      Caption = 'Nome do Estado'
    end
    object lblNomeCidade: TLabel
      Left = 302
      Top = 258
      Width = 37
      Height = 15
      Caption = 'Cidade'
    end
    object lblPopulacao: TLabel
      Left = 107
      Top = 316
      Width = 56
      Height = 15
      Caption = 'Popula'#231#227'o'
    end
    object lblInstituicao: TLabel
      Left = 200
      Top = 316
      Width = 55
      Height = 15
      Caption = 'Institui'#231#227'o'
    end
    object lblCnpj: TLabel
      Left = 335
      Top = 316
      Width = 27
      Height = 15
      Caption = 'CNPJ'
    end
    object lblDataValidade: TLabel
      Left = 107
      Top = 200
      Width = 87
      Height = 15
      Caption = 'Data de validade'
    end
    object lblDataDoacao: TLabel
      Left = 223
      Top = 200
      Width = 82
      Height = 15
      Caption = 'Data de doa'#231#227'o'
    end
    object lblResponsavel: TLabel
      Left = 315
      Top = 200
      Width = 65
      Height = 15
      Caption = 'Respons'#225'vel'
    end
    object Panel4: TPanel
      Left = 1
      Top = 421
      Width = 473
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 413
    end
    object Panel6: TPanel
      Left = 1
      Top = 73
      Width = 100
      Height = 348
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitHeight = 340
    end
    object Panel8: TPanel
      Left = 1
      Top = 1
      Width = 473
      Height = 72
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object lblPreenchaForm1: TLabel
        Left = 104
        Top = 27
        Width = 170
        Height = 23
        Caption = 'Preencha o formul'#225'rio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lblPreenchaForm2: TLabel
        Left = 104
        Top = 43
        Width = 254
        Height = 23
        Caption = 'para cadastrar um Item / Doa'#231#227'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object edtNomeCidade: TEdit
      Left = 302
      Top = 279
      Width = 134
      Height = 23
      TabOrder = 3
      TextHint = 'Nome da cidade'
    end
    object edtPopulacao: TEdit
      Left = 107
      Top = 337
      Width = 87
      Height = 23
      TabOrder = 4
      TextHint = 'Popula'#231#227'o'
    end
    object edtNomeEstado: TEdit
      Left = 187
      Top = 279
      Width = 109
      Height = 23
      TabOrder = 5
      TextHint = 'Nome do Estado'
    end
    object edtNomeInstituicao: TEdit
      Left = 200
      Top = 337
      Width = 129
      Height = 23
      TabOrder = 6
      TextHint = 'Nome da Institui'#231#227'o'
    end
    object edtResponsavel: TEdit
      Left = 315
      Top = 221
      Width = 121
      Height = 23
      TabOrder = 7
      TextHint = 'Respons'#225'vel'
    end
    object edtDescricaoItem: TEdit
      Left = 107
      Top = 109
      Width = 110
      Height = 23
      TabOrder = 8
      TextHint = 'Descri'#231#227'o do Item (tbl item)'
    end
    object edtDescricaoTipoItem: TEdit
      Left = 315
      Top = 167
      Width = 142
      Height = 23
      TabOrder = 9
      TextHint = 'Descri'#231#227'o do tipo do item (tbl TipoItem)'
    end
    object edtPeso: TEdit
      Left = 107
      Top = 167
      Width = 110
      Height = 23
      TabOrder = 10
      TextHint = 'Peso (tbl ItemDoacao)'
    end
    object edtValor: TEdit
      Left = 223
      Top = 109
      Width = 86
      Height = 23
      NumbersOnly = True
      TabOrder = 11
      TextHint = 'Valor (tbl ItemDoacao)'
    end
    object btnEnviar: TButton
      Left = 107
      Top = 378
      Width = 110
      Height = 25
      Caption = 'Enviar'
      TabOrder = 12
      OnClick = btnEnviarClick
    end
    object cmbUnidade: TComboBox
      Left = 223
      Top = 167
      Width = 86
      Height = 23
      TabOrder = 13
      TextHint = 'Unidade (tbl Item)'
    end
    object spnQuantidade: TSpinEdit
      Left = 315
      Top = 108
      Width = 51
      Height = 24
      MaxValue = 0
      MinValue = 0
      TabOrder = 14
      Value = 0
    end
    object cmbSiglaEstado: TComboBox
      Left = 107
      Top = 279
      Width = 74
      Height = 23
      TabOrder = 15
      TextHint = 'Sigla do Estado'
    end
    object mskDataValidade: TMaskEdit
      Left = 107
      Top = 221
      Width = 110
      Height = 23
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 16
      Text = '  /  /  '
    end
    object mskDataDoacao: TMaskEdit
      Left = 223
      Top = 221
      Width = 85
      Height = 23
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 17
      Text = '  /  /  '
    end
    object mskCnpj: TMaskEdit
      Left = 335
      Top = 337
      Width = 101
      Height = 23
      EditMask = '00.000.000/0000-00;1;_'
      MaxLength = 18
      TabOrder = 18
      Text = '  .   .   /    -  '
    end
  end
  object Panel3: TPanel
    Left = 475
    Top = 81
    Width = 473
    Height = 463
    Align = alClient
    Caption = 'Panel3'
    TabOrder = 2
    ExplicitWidth = 471
    ExplicitHeight = 455
    object Panel5: TPanel
      Left = 1
      Top = 421
      Width = 471
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 413
      ExplicitWidth = 469
    end
    object Panel7: TPanel
      Left = 372
      Top = 73
      Width = 100
      Height = 348
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 370
      ExplicitHeight = 340
    end
    object Panel9: TPanel
      Left = 1
      Top = 1
      Width = 471
      Height = 72
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      ExplicitWidth = 469
      object lblGrid: TLabel
        Left = 24
        Top = 43
        Width = 69
        Height = 23
        Caption = 'Doa'#231#245'es:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object Panel10: TPanel
      Left = 1
      Top = 73
      Width = 20
      Height = 348
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
      ExplicitHeight = 340
    end
    object DBGrid1: TDBGrid
      Left = 21
      Top = 73
      Width = 351
      Height = 348
      Align = alClient
      BorderStyle = bsNone
      DataSource = DataModule3.DataSource_Cadastro
      TabOrder = 4
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  object MainMenu1: TMainMenu
    Left = 888
    Top = 16
    object Usurios1: TMenuItem
      Caption = 'Usu'#225'rios'
      OnClick = Usurios1Click
    end
    object Cidades1: TMenuItem
      Caption = 'Cidades'
      OnClick = Cidades1Click
    end
    object Estados1: TMenuItem
      Caption = 'Estados'
      OnClick = Estados1Click
    end
    object Instituies2: TMenuItem
      Caption = 'Institui'#231#245'es'
      OnClick = Instituies2Click
    end
    object Itens3: TMenuItem
      Caption = 'Itens'
      OnClick = Itens3Click
    end
    object iposdeItens1: TMenuItem
      Caption = 'Tipos de Itens'
      OnClick = iposdeItens1Click
    end
  end
end
