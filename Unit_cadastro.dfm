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
  Menu = MainMenu_Cadastro
  Position = poScreenCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  TextHeight = 15
  object pnl1: TPanel
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
  object pnl2: TPanel
    Left = 0
    Top = 81
    Width = 475
    Height = 463
    Align = alLeft
    TabOrder = 1
    ExplicitLeft = -6
    ExplicitTop = 87
    object lblItemDoado: TLabel
      Left = 107
      Top = 88
      Width = 69
      Height = 15
      Caption = 'Item doado *'
    end
    object lblQuantidade: TLabel
      Left = 315
      Top = 87
      Width = 70
      Height = 15
      Caption = 'Quantidade *'
    end
    object lblValor: TLabel
      Left = 223
      Top = 88
      Width = 34
      Height = 15
      Caption = 'Valor *'
    end
    object lblPeso: TLabel
      Left = 107
      Top = 146
      Width = 33
      Height = 15
      Caption = 'Peso *'
    end
    object lblDescricao: TLabel
      Left = 315
      Top = 146
      Width = 59
      Height = 15
      Caption = 'Descri'#231#227'o *'
    end
    object lblUnidade: TLabel
      Left = 223
      Top = 146
      Width = 52
      Height = 15
      Caption = 'Unidade *'
    end
    object lblEstado: TLabel
      Left = 319
      Top = 200
      Width = 43
      Height = 15
      Caption = 'Estado *'
    end
    object lblNomeEstado: TLabel
      Left = 107
      Top = 258
      Width = 96
      Height = 15
      Caption = 'Nome do Estado *'
    end
    object lblNomeCidade: TLabel
      Left = 222
      Top = 258
      Width = 45
      Height = 15
      Caption = 'Cidade *'
    end
    object lblPopulacao: TLabel
      Left = 319
      Top = 258
      Width = 64
      Height = 15
      Caption = 'Popula'#231#227'o *'
    end
    object lblInstituicao: TLabel
      Left = 107
      Top = 316
      Width = 63
      Height = 15
      Caption = 'Institui'#231#227'o *'
    end
    object lblCnpj: TLabel
      Left = 231
      Top = 316
      Width = 35
      Height = 15
      Caption = 'CNPJ *'
    end
    object lblDataValidade: TLabel
      Left = 107
      Top = 200
      Width = 95
      Height = 15
      Caption = 'Data de validade *'
    end
    object lblDataDoacao: TLabel
      Left = 223
      Top = 200
      Width = 90
      Height = 15
      Caption = 'Data de doa'#231#227'o *'
    end
    object lblResponsavel: TLabel
      Left = 335
      Top = 316
      Width = 73
      Height = 15
      Caption = 'Respons'#225'vel *'
    end
    object lblCodigoCidade: TLabel
      Left = 170
      Top = 396
      Width = 59
      Height = 15
      Caption = 'CodCidade'
    end
    object lblCodigoTipoItem: TLabel
      Left = 235
      Top = 396
      Width = 69
      Height = 15
      Caption = 'CodTipoItem'
    end
    object lblCodigoEstado: TLabel
      Left = 107
      Top = 396
      Width = 57
      Height = 15
      Caption = 'CodEstado'
    end
    object lblCodigoInstituicao: TLabel
      Left = 310
      Top = 396
      Width = 77
      Height = 15
      Caption = 'CodInstitui'#231#227'o'
    end
    object lblCodigoItem: TLabel
      Left = 393
      Top = 396
      Width = 46
      Height = 15
      Caption = 'CodItem'
    end
    object pnl4: TPanel
      Left = 1
      Top = 452
      Width = 473
      Height = 10
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 19
    end
    object pnl6: TPanel
      Left = 1
      Top = 73
      Width = 100
      Height = 379
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 20
      ExplicitHeight = 340
    end
    object pnl8: TPanel
      Left = 1
      Top = 1
      Width = 473
      Height = 72
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 21
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
    object edtPopulacao: TEdit
      Left = 319
      Top = 279
      Width = 117
      Height = 23
      NumbersOnly = True
      TabOrder = 11
    end
    object edtNomeEstado: TEdit
      Left = 107
      Top = 279
      Width = 109
      Height = 23
      TabOrder = 9
    end
    object edtResponsavel: TEdit
      Left = 335
      Top = 337
      Width = 101
      Height = 23
      Enabled = False
      TabOrder = 14
    end
    object edtDescricaoItem: TEdit
      Left = 107
      Top = 109
      Width = 110
      Height = 23
      TabOrder = 0
    end
    object edtPeso: TEdit
      Left = 107
      Top = 167
      Width = 110
      Height = 23
      TabOrder = 3
    end
    object edtValor: TEdit
      Left = 223
      Top = 109
      Width = 86
      Height = 23
      NumbersOnly = True
      TabOrder = 1
    end
    object btnEnviar: TButton
      Left = 107
      Top = 374
      Width = 95
      Height = 25
      Caption = 'Enviar'
      TabOrder = 15
      OnClick = btnEnviarClick
    end
    object cmbUnidade: TComboBox
      Left = 223
      Top = 167
      Width = 86
      Height = 23
      TabOrder = 4
      Items.Strings = (
        'kg'
        'g'
        't'
        'L'
        'ml'
        'unidade'
        'pacote'
        'caixa'
        'par'
        'pe'#231'a'
        'm')
    end
    object spnQuantidade: TSpinEdit
      Left = 315
      Top = 108
      Width = 51
      Height = 24
      MaxValue = 10000
      MinValue = 1
      TabOrder = 2
      Value = 1
    end
    object cmbSiglaEstado: TComboBox
      Left = 319
      Top = 221
      Width = 117
      Height = 23
      TabOrder = 8
      OnChange = cmbSiglaEstadoChange
    end
    object mskDataValidade: TMaskEdit
      Left = 107
      Top = 221
      Width = 110
      Height = 23
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 6
      Text = '  /  /  '
    end
    object mskDataDoacao: TMaskEdit
      Left = 223
      Top = 221
      Width = 90
      Height = 23
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 7
      Text = '  /  /  '
    end
    object mskCnpj: TMaskEdit
      Left = 231
      Top = 337
      Width = 98
      Height = 23
      Enabled = False
      EditMask = '00.000.000/0000-00;1;_'
      MaxLength = 18
      TabOrder = 13
      Text = '  .   .   /    -  '
    end
    object cmbNomeCidade: TComboBox
      Left = 222
      Top = 279
      Width = 91
      Height = 23
      TabOrder = 10
      OnChange = cmbNomeCidadeChange
    end
    object cmbDescricaoTipoItem: TComboBox
      Left = 315
      Top = 167
      Width = 121
      Height = 23
      TabOrder = 5
      OnChange = cmbDescricaoTipoItemChange
    end
    object edtCodigoCidade: TEdit
      Left = 170
      Top = 417
      Width = 59
      Height = 23
      TabOrder = 17
    end
    object edtCodigoTipoItem: TEdit
      Left = 235
      Top = 417
      Width = 69
      Height = 23
      TabOrder = 18
    end
    object edtCodigoEstado: TEdit
      Left = 107
      Top = 417
      Width = 57
      Height = 23
      TabOrder = 16
    end
    object cmbNomeInstituicao: TComboBox
      Left = 107
      Top = 337
      Width = 118
      Height = 23
      TabOrder = 12
      OnChange = cmbNomeInstituicaoChange
    end
    object edtCodigoInstituicao: TEdit
      Left = 310
      Top = 417
      Width = 77
      Height = 23
      TabOrder = 22
    end
    object edtCodigoItem: TEdit
      Left = 393
      Top = 417
      Width = 55
      Height = 23
      TabOrder = 23
    end
  end
  object pnl3: TPanel
    Left = 475
    Top = 81
    Width = 473
    Height = 463
    Align = alClient
    Caption = 'pnl3'
    TabOrder = 2
    ExplicitWidth = 471
    ExplicitHeight = 455
    object pnl5: TPanel
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
    object pnl7: TPanel
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
    object pnl9: TPanel
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
    object pnl10: TPanel
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
  object MainMenu_Cadastro: TMainMenu
    Left = 872
    Top = 24
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
