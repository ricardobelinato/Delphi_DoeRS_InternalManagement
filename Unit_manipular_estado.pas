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
//    procedure cmbSiglaEstadoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure cmbSiglaEstadoChange(Sender: TObject);
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
  begin
    Unit_functions.InsertEstado(edtEstado.Text, cmbSiglaEstado.Text);
  end
  else
  begin
    CodigoEstado := StrToInt(edtCodigoEstado.Text);
    Unit_functions.UpdateEstado(CodigoEstado, edtEstado, cmbSiglaEstado.Text, edtEstado.Text);
  end;
end;

procedure TForm_manipular_estado.cmbSiglaEstadoChange(Sender: TObject);
begin
  if cmbSiglaEstado.ItemIndex <> -1 then
  begin
    SetarEstado(cmbSiglaEstado.ItemIndex, edtEstado);
  end;
end;

//Procedure que trata de labels e campos edit de acordo com o modo de inserção ou edição, mexendo com a visibilidade de componentes, deixando-os disabled, limpando campos ou dando valores a eles
//Procedure that deals with labels and edit fields according to the insertion or editing mode, changing the visibility of components, leaving them disabled, clearing fields or giving them values
procedure TForm_manipular_estado.FormShow(Sender: TObject);
begin
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
