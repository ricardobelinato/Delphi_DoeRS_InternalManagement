unit Unit_manipular_estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm_manipular_estado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TButton;
    cmbSiglaEstado: TComboBox;
    lblSiglaEstado: TLabel;
    lblEstado: TLabel;
    edtEstado: TEdit;
    lblCodigoEstado: TLabel;
    edtCodigoEstado: TEdit;
    lblCodigoUsuario: TLabel;
    edtCodigoUsuario: TEdit;
    procedure cmbSiglaEstadoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_manipular_estado: TForm_manipular_estado;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_functions;

//Procedure do evento de clique no botão salvar que executa um insert ou update dependendo do modo selecionado, essa procedure também valida se os campos obrigatórios não estão vazios, caso estejam é barrado de prosseguir
//Procedure of the click event on the save button that performs an insert or update depending on the selected mode, this procedure also validates that the mandatory fields are not empty, if they are, it is blocked from proceeding
procedure TForm_manipular_estado.btnSalvarClick(Sender: TObject);
var
  CodigoEstado: Integer;
begin
  if (cmbSiglaEstado.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher o campo obrigatório.');
    Exit;
  end;

  if Tag = 0 then
    Unit_functions.InsertEstado(edtEstado.Text, cmbSiglaEstado.Text)
  else
    CodigoEstado := StrToInt(edtCodigoEstado.Text);
    Unit_functions.UpdateEstado(CodigoEstado, cmbSiglaEstado.Text, edtEstado.Text);
end;

//Procedure que altera o valor do edit 'edtEstado' de acordo com a sigla selecionada no combobox
//Procedure that changes the value of edit 'edtEstado' according to the acronym selected in the combobox
procedure TForm_manipular_estado.cmbSiglaEstadoChange(Sender: TObject);
begin
  if cmbSiglaEstado.ItemIndex <> -1 then
  begin
    case cmbSiglaEstado.ItemIndex of
      0: edtEstado.Text := 'Acre';
      1: edtEstado.Text := 'Alagoas';
      2: edtEstado.Text := 'Amapá';
      3: edtEstado.Text := 'Amazonas';
      4: edtEstado.Text := 'Bahia';
      5: edtEstado.Text := 'Ceará';
      6: edtEstado.Text := 'Distrito Federal';
      7: edtEstado.Text := 'Espírito Santo';
      8: edtEstado.Text := 'Goiás';
      9: edtEstado.Text := 'Maranhão';
      10: edtEstado.Text := 'Mato Grosso';
      11: edtEstado.Text := 'Mato Grosso do Sul';
      12: edtEstado.Text := 'Minas Gerais';
      13: edtEstado.Text := 'Pará';
      14: edtEstado.Text := 'Paraíba';
      15: edtEstado.Text := 'Paraná';
      16: edtEstado.Text := 'Pernambuco';
      17: edtEstado.Text := 'Piauí';
      18: edtEstado.Text := 'Rio de Janeiro';
      19: edtEstado.Text := 'Rio Grande do Norte';
      20: edtEstado.Text := 'Rio Grande do Sul';
      21: edtEstado.Text := 'Rondônia';
      22: edtEstado.Text := 'Roraima';
      23: edtEstado.Text := 'Santa Catarina';
      24: edtEstado.Text := 'São Paulo';
      25: edtEstado.Text := 'Sergipe';
      26: edtEstado.Text := 'Tocantins';
    end;
  end;
end;

//Procedure que trata de labels e campos edit de acordo com o modo de inserção ou edição, mexendo com a visibilidade de componentes, deixando-os disabled, limpando campos ou dando valores a eles
//Procedure that deals with labels and edit fields according to the insertion or editing mode, changing the visibility of components, leaving them disabled, clearing fields or giving them values
procedure TForm_manipular_estado.FormShow(Sender: TObject);
begin
  edtCodigoEstado.ReadOnly := True;
  edtCodigoUsuario.ReadOnly := True;

  edtCodigoEstado.Enabled := False;
  edtCodigoUsuario.Enabled := False;
  if Tag = 0 then
  begin
    //Modo de inserção
    //Insertion mode
    edtCodigoEstado.Visible := False;
    edtCodigoUsuario.Visible := False;

    lblCodigoEstado.Visible := False;
    lblCodigoUsuario.Visible := False;

    cmbSiglaEstado.Text := '';
    edtEstado.Text := '';
  end
  else
  begin
    //Modo de edição
    //Editing mode
    with Unit_data_module.DataModule3.FDQuery_Estados do
    begin
      edtCodigoEstado.Visible := True;
      edtCodigoUsuario.Visible := True;

      lblCodigoEstado.Visible := True;
      lblCodigoUsuario.Visible := True;

      cmbSiglaEstado.Text := FieldByName('sigla').AsString;
      edtEstado.Text := FieldByName('nome_estado').AsString;
      edtCodigoEstado.Text := FieldByName('codigo_estado').AsString;
      edtCodigoUsuario.Text := FieldByName('codigo_usuario').AsString;
    end;
  end;
end;

end.
