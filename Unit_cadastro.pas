unit Unit_cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.Mask, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm_cadastro = class(TForm)
    pnl1: TPanel;
    lblSejaBemVindo: TLabel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl9: TPanel;
    pnl10: TPanel;
    DBGrid1: TDBGrid;
    lblGrid: TLabel;
    lblPreenchaForm1: TLabel;
    lblPreenchaForm2: TLabel;
    edtPopulacao: TEdit;
    edtNomeEstado: TEdit;
    edtNomeInstituicao: TEdit;
    edtResponsavel: TEdit;
    edtDescricaoItem: TEdit;
    edtPeso: TEdit;
    edtValor: TEdit;
    btnEnviar: TButton;
    lblItemDoado: TLabel;
    lblQuantidade: TLabel;
    lblValor: TLabel;
    lblPeso: TLabel;
    lblDescricao: TLabel;
    lblUnidade: TLabel;
    cmbUnidade: TComboBox;
    spnQuantidade: TSpinEdit;
    cmbSiglaEstado: TComboBox;
    lblEstado: TLabel;
    lblNomeEstado: TLabel;
    lblNomeCidade: TLabel;
    lblPopulacao: TLabel;
    lblInstituicao: TLabel;
    lblCnpj: TLabel;
    mskDataValidade: TMaskEdit;
    lblDataValidade: TLabel;
    lblDataDoacao: TLabel;
    mskDataDoacao: TMaskEdit;
    lblResponsavel: TLabel;
    mskCnpj: TMaskEdit;
    MainMenu_Cadastro: TMainMenu;
    Usurios1: TMenuItem;
    Cidades1: TMenuItem;
    Estados1: TMenuItem;
    Instituies2: TMenuItem;
    Itens3: TMenuItem;
    iposdeItens1: TMenuItem;
    cmbNomeCidade: TComboBox;
    cmbDescricaoTipoItem: TComboBox;
    lblCodigoCidade: TLabel;
    edtCodigoCidade: TEdit;
    lblCodigoTipoItem: TLabel;
    edtCodigoTipoItem: TEdit;
    lblCodigoEstado: TLabel;
    edtCodigoEstado: TEdit;
    procedure Usurios1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure Instituies2Click(Sender: TObject);
    procedure Itens3Click(Sender: TObject);
    procedure iposdeItens1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure cmbSiglaEstadoChange(Sender: TObject);
    procedure cmbDescricaoTipoItemChange(Sender: TObject);
    procedure cmbNomeCidadeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_cadastro: TForm_cadastro;

implementation

{$R *.dfm}
uses Unit_login, Unit_usuario, Unit_cidade, Unit_estado, Unit_instituicoes, Unit_item, Unit_tipo_item, Unit_data_module, Unit_functions;

//Procedure que verifica quando o valor do combobox 'cmbDescricaoTipoItem' muda e apartir disso dá o devido codTipoItem para o campo 'codigo_tipo_item'
//Procedure that checks when the value of the combobox 'cmbDescricaoTipoItem' changes and then gives the appropriate codTipoItem to the field 'codigo_tipo_item'
procedure TForm_cadastro.cmbDescricaoTipoItemChange(Sender: TObject);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule3.FD_Connection;
    Query.SQL.Text := 'SELECT codigo_tipo_item ' +
                      'FROM tipoitem ' +
                      'WHERE descricao_tipo_item = :DescricaoTipoITem';
    Query.Params.ParamByName('DescricaoTipoITem').AsString := cmbDescricaoTipoItem.Text;
    Query.Open;

    finally
      edtCodigoTipoItem.Text := Query.FieldByName('codigo_tipo_item').AsString;
  end;
end;

//Procedure que verifica quando o valor do combobox 'cmbNomeCidade' muda e apartir disso dá o devido codCidade para o campo 'codigo_cidade'
//Procedure that checks when the value of the combobox 'cmbNomeCidade' changes and then gives the appropriate codCidade to the field 'codigo_cidade'
procedure TForm_cadastro.cmbNomeCidadeChange(Sender: TObject);
var
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule3.FD_Connection;
    Query.SQL.Text := 'SELECT codigo_cidade ' +
                      'FROM cidade ' +
                      'WHERE nome_cidade = :NomeCidade';
    Query.Params.ParamByName('NomeCidade').AsString := cmbNomeCidade.Text;
    Query.Open;

    finally
      edtCodigoCidade.Text := Query.FieldByName('codigo_cidade').AsString;
  end;
end;

//Procedure evento que inicia quando o form abre na tela, nela temos o sistema de permissão, responsável por exibir o menu apenas para usuários com código de administrador 1/true, também temos outra parte do código dedicada a puxar o select de algumas colunas no banco e povoar alguns combobox e oculta alguns labels e campos da tela
//Procedure event that starts when the form opens on the screen, in it we have the permission system, responsible for displaying the menu only for users with administrator code 1/true, we also have another part of the code dedicated to pulling the select from some columns in the database and populate some comboboxes and hide some labels and fields from the screen
procedure TForm_cadastro.FormActivate(Sender: TObject);
begin
  //Sistema de permissão de usuário (vê ou não o menu) / User permission system (see the menu or not)
  edtNomeEstado.Enabled := False;

  if IndicadorAdministrador then
    Menu := MainMenu_Cadastro
  else
    Menu := nil;

  //Dá valores pra combobox 'cmbSiglaEstado' através de select da 'FDQuery_CmbSiglaEstado' no data module / Gives values to the 'cmbSiglaEstado' combobox through select from 'FDQuery_CmbSiglaEstado' in the data module
  Unit_data_module.DataModule3.FDQuery_CmbSiglaEstado.Open;
  cmbSiglaEstado.Items.Clear;

  while not Unit_data_module.DataModule3.FDQuery_CmbSiglaEstado.Eof do
  begin
    cmbSiglaEstado.Items.Add(Unit_data_module.DataModule3.FDQuery_CmbSiglaEstado.FieldByName('sigla').AsString);
    Unit_data_module.DataModule3.FDQuery_CmbSiglaEstado.Next;
  end;

  Unit_data_module.DataModule3.FDQuery_CmbSiglaEstado.Close;

  //Dá valores pra combobox 'cmbNomeCidade' através de select da 'FDQuery_CmbNomeCidade' no data module / Gives values to the 'cmbNomeCidade' combobox through select from 'FDQuery_CmbNomeCidade' in the data module
  Unit_data_module.DataModule3.FDQuery_CmbNomeCidade.Open;
  cmbNomeCidade.Items.Clear;

  while not Unit_data_module.DataModule3.FDQuery_CmbNomeCidade.Eof do
  begin
    cmbNomeCidade.Items.Add(Unit_data_module.DataModule3.FDQuery_CmbNomeCidade.FieldByName('nome_cidade').AsString);
    Unit_data_module.DataModule3.FDQuery_CmbNomeCidade.Next;
  end;

  Unit_data_module.DataModule3.FDQuery_CmbNomeCidade.Close;

  //Dá valores pra combobox 'cmbDescricaoTipoItem' através de select da 'FDQuery_CmbDescricaoTipoItem' no data module / Gives values to the 'cmbDescricaoTipoItem' combobox through select from 'FDQuery_CmbDescricaoTipoItem' in the data module
  Unit_data_module.DataModule3.FDQuery_CmbDescricaoTipoItem.Open;
  cmbDescricaoTipoItem.Items.Clear;

  while not Unit_data_module.DataModule3.FDQuery_CmbDescricaoTipoItem.Eof do
  begin
    cmbDescricaoTipoItem.Items.Add(Unit_data_module.DataModule3.FDQuery_CmbDescricaoTipoItem.FieldByName('descricao_tipo_item').AsString);
    Unit_data_module.DataModule3.FDQuery_CmbDescricaoTipoItem.Next;
  end;

  Unit_data_module.DataModule3.FDQuery_CmbDescricaoTipoItem.Close;

  //Oculta alguns labels e campos na tela, usados somente para extrair valores para o insert / Hides some labels and fields on the screen, used only to extract values for the insert
  lblCodigoEstado.Visible := False;
  lblCodigoCidade.Visible := False;
  lblCodigoTipoItem.Visible := False;

  edtCodigoEstado.Visible := False;
  edtCodigoCidade.Visible := False;
  edtCodigoTipoItem.Visible := False;

  lblCodigoEstado.Enabled := False;
  lblCodigoCidade.Enabled := False;
  lblCodigoTipoItem.Enabled := False;

  edtCodigoEstado.Enabled := False;
  edtCodigoCidade.Enabled := False;
  edtCodigoTipoItem.Enabled := False;
end;

//Procedure do evento de clique no botão, responsável por dar o insert em todas as tabelas
//Procedure of the button click event, responsible for inserting all tables
procedure TForm_cadastro.btnEnviarClick(Sender: TObject);
begin
  if (cmbNomeCidade.Text='') or (edtPopulacao.Text='') or (edtNomeEstado.Text='') or (cmbSiglaEstado.Text='')
  or (edtNomeInstituicao.Text='') or (mskCnpj.Text='') or (edtResponsavel.Text='') or (edtDescricaoItem.Text='')
  or (cmbUnidade.Text='') or (mskDataValidade.Text='') or (cmbDescricaoTipoItem.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher algum(s) campo(s) obrigatório(s).');
    Exit;
  end;

//  InsertInstituicao(edtNomeInstituicao.Text, mskCnpj.Text, edtResponsavel.Text);
//  InsertItem(edtDescricaoItem.Text, cmbUnidade.Text, mskDataValidade.Text);
//  InsertTipoItem(cmbDescricaoTipoItem.Text);

  Unit_data_module.DataModule3.FDQuery_Cadastro.Close;
  Unit_data_module.DataModule3.FDQuery_Cadastro.Open;
end;

//Procedure responsável por preencher o edit 'edtNomeEstado' com uma string de acordo com a sigla estado que for selecionada no campo 'cmbSiglaEstado'
//Procedure responsible for filling in the edit 'edtNomeEstado' with a string according to the state acronym selected in the 'cmbSiglaEstado' field
procedure TForm_cadastro.cmbSiglaEstadoChange(Sender: TObject);
var
  Query: TFDQuery;
begin
  if cmbSiglaEstado.ItemIndex <> -1 then
  begin
    SetarEstado(cmbSiglaEstado.ItemIndex, edtNomeEstado);
  end;

  //Verifica quando o valor do combobox 'cmbSiglaEstado' muda e apartir disso dá o devido codEstado para o campo 'codigo_estado'
  //Checks when the value of the combobox 'cmbSiglaEstado' changes and then gives the appropriate codEstado to the field 'codigo_Estado'
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule3.FD_Connection;
    Query.SQL.Text := 'SELECT codigo_estado ' +
                      'FROM estado ' +
                      'WHERE sigla = :Sigla';
    Query.Params.ParamByName('Sigla').AsString := cmbSiglaEstado.Text;
    Query.Open;

    finally
      edtCodigoEstado.Text := Query.FieldByName('codigo_estado').AsString;
  end;
end;

//Todas as procedures abaixo são eventos de click no menu que direcionam o usuário para o devido form
//All procedures below are click events on the menu that direct the user to the appropriate form
procedure TForm_cadastro.Cidades1Click(Sender: TObject);
begin
  Form_cidade.Show;
end;

procedure TForm_cadastro.Estados1Click(Sender: TObject);
begin
  Form_estado.Show;
end;

procedure TForm_cadastro.Instituies2Click(Sender: TObject);
begin
  Form_instituicao.Show;
end;

procedure TForm_cadastro.iposdeItens1Click(Sender: TObject);
begin
  Form_tipo_item.Show;
end;

procedure TForm_cadastro.Itens3Click(Sender: TObject);
begin
  Form_item.Show;
end;

procedure TForm_cadastro.Usurios1Click(Sender: TObject);
begin
  Form_usuarios.Show;
end;

end.
