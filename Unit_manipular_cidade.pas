unit Unit_manipular_cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm_manipular_cidade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TButton;
    lblNomeCidade: TLabel;
    edtNomeCidade: TEdit;
    edtPopulacao: TEdit;
    lblPopulacao: TLabel;
    lblCodigoCidade: TLabel;
    edtCodigoCidade: TEdit;
    lblCodigoEstado: TLabel;
    lblCodigoUsuario: TLabel;
    edtCodigoEstado: TEdit;
    edtCodigoUsuario: TEdit;
    cmbSiglaEstado: TComboBox;
    UF: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
//    procedure cmbSiglaEstadoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_manipular_cidade: TForm_manipular_cidade;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_functions;

//Procedure do evento de clique no botão salvar que executa um insert ou update dependendo do modo selecionado, essa procedure também valida se os campos obrigatórios não estão vazios, caso estejam é barrado de prosseguir
//Procedure of the click event on the save button that performs an insert or update depending on the selected mode, this procedure also validates that the mandatory fields are not empty, if they are, it is blocked from proceeding
procedure TForm_manipular_cidade.btnSalvarClick(Sender: TObject);
var
  CodigoCidade: Integer;

begin
  if (edtNomeCidade.Text='') or (edtPopulacao.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher algum(s) campo(s) obrigatório(s).');
    Exit;
  end;

  if Tag = 0 then
  begin
    Unit_functions.InsertCidade(edtNomeCidade.Text, edtPopulacao.Text);
  end
  else
  begin
    CodigoCidade := StrToInt(edtCodigoCidade.Text);
    Unit_functions.UpdateCidade(CodigoCidade, edtNomeCidade.Text, edtPopulacao.Text);
  end;
end;

//Procedure que preenche o campo 'edtCodigoEstado' de acordo com o estado selecionado no campo 'cmbSiglaEstado'
//Procedure that fills in the 'edtCodigoEstado' field according to the state selected in the 'cmbSiglaEstado' field
//procedure TForm_manipular_cidade.cmbSiglaEstadoChange(Sender: TObject);
//begin
//  SetarCodEstado(cmbSiglaEstado.ItemIndex, edtCodigoEstado);
//end;

//Procedure que trata de labels e campos edit de acordo com o modo de inserção ou edição, mexendo com a visibilidade de componentes, deixando-os disabled, limpando campos ou dando valores a eles
//Procedure that deals with labels and edit fields according to the insertion or editing mode, changing the visibility of components, leaving them disabled, clearing fields or giving them values
procedure TForm_manipular_cidade.FormShow(Sender: TObject);
begin
  edtCodigoCidade.Enabled := False;
  edtCodigoEstado.Enabled := False;
  edtCodigoUsuario.Enabled := False;

  if Tag = 0 then
  begin
    //Modo de inserção
    //Insertion mode
    edtCodigoCidade.Visible := False;
    edtCodigoEstado.Visible := False;
    edtCodigoUsuario.Visible := False;

    lblCodigoCidade.Visible := False;
    lblCodigoEstado.Visible := False;
    lblCodigoUsuario.Visible := False;

    edtNomeCidade.Text := '';
    edtPopulacao.Text := '';
  end
  else
  begin
    //Modo de edição
    //Editing mode
    with Unit_data_module.DataModule3.FDQuery_Cidades do
    begin
      edtCodigoCidade.Visible := True;
      edtCodigoEstado.Visible := True;
      edtCodigoUsuario.Visible := True;

      lblCodigoCidade.Visible := True;
      lblCodigoEstado.Visible := True;
      lblCodigoUsuario.Visible := True;

      edtNomeCidade.Text := FieldByName('nome_cidade').AsString;
      edtPopulacao.Text := FieldByName('populacao').AsString;

      edtCodigoCidade.Text := FieldByName('codigo_cidade').AsString;
      edtCodigoEstado.Text := FieldByName('codigo_estado').AsString;
      edtCodigoUsuario.Text := FieldByName('codigo_usuario').AsString;
    end;
  end;
end;

end.
