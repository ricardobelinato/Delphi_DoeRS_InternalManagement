unit Unit_manipular_instituicoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm_manipular_instituicao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TButton;
    edtNomeInstituicao: TEdit;
    lblNomeInstituicao: TLabel;
    lblCpnj: TLabel;
    mskCnpj: TMaskEdit;
    lblResponsavel: TLabel;
    edtResponsavel: TEdit;
    lblCodigoInstituicao: TLabel;
    edtCodigoInstituicao: TEdit;
    lblCodigoCidade: TLabel;
    lblCodigoUsuario: TLabel;
    edtCodigoCidade: TEdit;
    edtCodigoUsuario: TEdit;
    lblNomeCidade: TLabel;
    cmbNomeCidade: TComboBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbNomeCidadeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_manipular_instituicao: TForm_manipular_instituicao;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_functions;

//Procedure que verifica quando o valor do combobox 'cmbNomeCidade' muda e apartir disso dá o devido codCidade para o campo 'codigo_cidade'
//Procedure that checks when the value of the combobox 'cmbNomeCidade' changes and then gives the appropriate codCidade to the field 'codigo_cidade'
procedure TForm_manipular_instituicao.cmbNomeCidadeChange(Sender: TObject);
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

//Procedure evento que aciona quando o form é aberto na tela que dá os valores no 'Items' do combobox 'cmbNomeCidade' através de um select da 'FDQuery_CmbNomeCidade', no datamodule
//Procedure event that triggers when the form is opened on the screen that gives the values in the 'Items' of the 'cmbNomeCidade' combobox through a select from 'FDQuery_CmbNomeCidade', in the datamodule
procedure TForm_manipular_instituicao.FormActivate(Sender: TObject);
begin
  Unit_data_module.DataModule3.FDQuery_CmbNomeCidade.Open;
  cmbNomeCidade.Items.Clear;

  while not Unit_data_module.DataModule3.FDQuery_CmbNomeCidade.Eof do
  begin
    cmbNomeCidade.Items.Add(Unit_data_module.DataModule3.FDQuery_CmbNomeCidade.FieldByName('nome_cidade').AsString);
    Unit_data_module.DataModule3.FDQuery_CmbNomeCidade.Next;
  end;

  Unit_data_module.DataModule3.FDQuery_CmbNomeCidade.Close;
end;

//Procedure do evento de clique no botão salvar que executa um insert ou update dependendo do modo selecionado, essa procedure também valida se os campos obrigatórios não estão vazios, caso estejam é barrado de prosseguir
//Procedure of the click event on the save button that performs an insert or update depending on the selected mode, this procedure also validates that the mandatory fields are not empty, if they are, it is blocked from proceeding
procedure TForm_manipular_instituicao.btnSalvarClick(Sender: TObject);
var
  CodigoInstituicao: Integer;
begin
  if (edtNomeInstituicao.Text='') or (mskCnpj.Text='') or (edtResponsavel.Text='') or (cmbNomeCidade.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher algum(s) campo(s) obrigatório(s).');
    Exit;
  end;

  if Tag = 0 then
  begin
    Unit_functions.InsertInstituicao(edtNomeInstituicao.Text, mskCnpj.Text, edtResponsavel.Text, edtCodigoCidade.Text);
  end
  else
  begin
    CodigoInstituicao := StrToInt(edtCodigoInstituicao.Text);
    UpdateInstituicao(CodigoInstituicao, edtNomeInstituicao.Text, mskCnpj.Text, edtResponsavel.Text);
  end;
end;

//Procedure que trata de labels e campos edit de acordo com o modo de inserção ou edição, mexendo com a visibilidade de componentes, deixando-os disabled, limpando campos ou dando valores a eles
//Procedure that deals with labels and edit fields according to the insertion or editing mode, changing the visibility of components, leaving them disabled, clearing fields or giving them values
procedure TForm_manipular_instituicao.FormShow(Sender: TObject);
begin
  edtCodigoInstituicao.Enabled := False;
  edtCodigoCidade.Enabled := False;
  edtCodigoUsuario.Enabled := False;

  if Tag = 0 then
  begin
    //Modo de inserção
    //Insertion mode
    edtCodigoInstituicao.Visible := False;
    edtCodigoCidade.Visible := False;
    edtCodigoUsuario.Visible := False;

    lblCodigoInstituicao.Visible := False;
    lblCodigoCidade.Visible := False;
    lblCodigoUsuario.Visible := False;

    edtNomeInstituicao.Text := '';
    mskCnpj.Text := '';
    edtResponsavel.Text := '';

  end
  else
  begin
    //Modo de edição
    //Editing mode
    with Unit_data_module.DataModule3.FDQuery_Instituicoes do
    begin
      edtCodigoInstituicao.Visible := True;
      edtCodigoCidade.Visible := True;
      edtCodigoUsuario.Visible := True;

      lblCodigoInstituicao.Visible := True;
      lblCodigoCidade.Visible := True;
      lblCodigoUsuario.Visible := True;

      edtNomeInstituicao.Text := FieldByName('nome_instituicao').AsString;
      mskCnpj.Text := FieldByName('cnpj').AsString;
      edtResponsavel.Text := FieldByName('responsavel').AsString;
      edtCodigoInstituicao.Text := FieldByName('codigo_instituicao').AsString;
      edtCodigoCidade.Text := FieldByName('codigo_cidade').AsString;
      edtCodigoUsuario.Text := FieldByName('codigo_usuario').AsString;
    end;
  end;
end;

end.
