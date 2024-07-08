unit Unit_cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.Mask;

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
    edtNomeCidade: TEdit;
    edtPopulacao: TEdit;
    edtNomeEstado: TEdit;
    edtNomeInstituicao: TEdit;
    edtResponsavel: TEdit;
    edtDescricaoItem: TEdit;
    edtDescricaoTipoItem: TEdit;
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
    procedure Usurios1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure Instituies2Click(Sender: TObject);
    procedure Itens3Click(Sender: TObject);
    procedure iposdeItens1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure cmbSiglaEstadoChange(Sender: TObject);
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

//Procedure de permissão, responsável por exibir o menu apenas para usuários com código de administrador 1/true
//Permission procedure, responsible for displaying the menu only for users with administrator code 1/true
procedure TForm_cadastro.FormActivate(Sender: TObject);
begin
  edtNomeEstado.Enabled := False;

  if IndicadorAdministrador then
    Menu := MainMenu_Cadastro
  else
    Menu := nil;
end;

//Procedure do evento de clique no botão, responsável por dar o insert em todas as tabelas
//Procedure of the button click event, responsible for inserting all tables
procedure TForm_cadastro.btnEnviarClick(Sender: TObject);
begin
  if (edtNomeCidade.Text='') or (edtPopulacao.Text='') or (edtNomeEstado.Text='') or (cmbSiglaEstado.Text='')
  or (edtNomeInstituicao.Text='') or (mskCnpj.Text='') or (edtResponsavel.Text='') or (edtDescricaoItem.Text='')
  or (cmbUnidade.Text='') or (mskDataValidade.Text='') or (edtDescricaoTipoItem.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher algum(s) campo(s) obrigatório(s).');
    Exit;
  end;

//  InsertCidade(edtNomeCidade.Text, edtPopulacao.Text);
  InsertEstado(edtNomeEstado.Text, cmbSiglaEstado.Text);
//  InsertInstituicao(edtNomeInstituicao.Text, mskCnpj.Text, edtResponsavel.Text);
//  InsertItem(edtDescricaoItem.Text, cmbUnidade.Text, mskDataValidade.Text);
  InsertTipoItem(edtDescricaoTipoItem.Text);

  Unit_data_module.DataModule3.FDQuery_Cadastro.Close;
  Unit_data_module.DataModule3.FDQuery_Cadastro.Open;
end;

//Procedure responsável por preencher o edit 'edtNomeEstado' com uma string de acordo com a sigla estado que for selecionada no campo 'cmbSiglaEstado'
//Procedure responsible for filling in the edit 'edtNomeEstado' with a string according to the state acronym selected in the 'cmbSiglaEstado' field
procedure TForm_cadastro.cmbSiglaEstadoChange(Sender: TObject);
begin
  if cmbSiglaEstado.ItemIndex <> -1 then
  begin
    SetarEstado(cmbSiglaEstado.ItemIndex, edtNomeEstado);
//    SetarCodEstado(cmbSiglaEstado.ItemIndex, edtCodigoEstado);
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
