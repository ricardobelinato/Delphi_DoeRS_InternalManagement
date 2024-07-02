unit Unit_cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.Mask;

type
  TForm_cadastro = class(TForm)
    MainMenu1: TMainMenu;
    Usurios1: TMenuItem;
    Cidades1: TMenuItem;
    Estados1: TMenuItem;
    Instituies2: TMenuItem;
    Itens3: TMenuItem;
    iposdeItens1: TMenuItem;
    Panel1: TPanel;
    lblSejaBemVindo: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
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
    procedure Usurios1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure Instituies2Click(Sender: TObject);
    procedure Itens3Click(Sender: TObject);
    procedure iposdeItens1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
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
  if IndicadorAdministrador then
    Menu := MainMenu1
  else
    Menu := nil;
end;

//Procedure do evento de clique no botão, responsável por dar o insert em todas as tabelas
procedure TForm_cadastro.btnEnviarClick(Sender: TObject);
begin
  //
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
  Form_tipoitem.Show;
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
