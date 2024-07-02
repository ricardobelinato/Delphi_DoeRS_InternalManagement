unit Unit_manipular_tipo_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm_manipular_tipo_item = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Btn_salvar: TButton;
    lblDescricaoTipoItem: TLabel;
    edtDescricaoTipoItem: TEdit;
    lblCodigoTipoItem: TLabel;
    edtCodigoTipoItem: TEdit;
    lblCodigoUsuario: TLabel;
    edtCodigoUsuario: TEdit;
    procedure Btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_manipular_tipo_item: TForm_manipular_tipo_item;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_functions;

//Procedure do evento de clique no botão salvar que executa um insert ou update dependendo do modo selecionado, essa procedure também valida se os campos obrigatórios não estão vazios, caso estejam é barrado de prosseguir
//Procedure of the click event on the save button that performs an insert or update depending on the selected mode, this procedure also validates that the mandatory fields are not empty, if they are, it is blocked from proceeding
procedure TForm_manipular_tipo_item.Btn_salvarClick(Sender: TObject);
var
  CodigoTipoItem: Integer;
begin
  if (edtDescricaoTipoItem.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher o campo obrigatório.');
    Exit;
  end;

  if Tag = 0 then
    Unit_functions.InsertTipoItem(edtDescricaoTipoItem.Text)
  else
    CodigoTipoItem := StrToInt(edtCodigoTipoItem.Text);
    Unit_functions.UpdateTipoItem(CodigoTipoItem, edtDescricaoTipoItem.Text);
end;

//Procedure que trata de labels e campos edit de acordo com o modo de inserção ou edição, mexendo com a visibilidade de componentes, deixando-os disabled, limpando campos ou dando valores a eles
//Procedure that deals with labels and edit fields according to the insertion or editing mode, changing the visibility of components, leaving them disabled, clearing fields or giving them values
procedure TForm_manipular_tipo_item.FormShow(Sender: TObject);
begin
  edtCodigoTipoItem.ReadOnly := True;
  edtCodigoUsuario.ReadOnly := True;

  edtCodigoTipoItem.Enabled := False;
  edtCodigoUsuario.Enabled := False;
  if Tag = 0 then
  begin
    //Modo de inserção
    //Insertion mode
    edtCodigoTipoItem.Visible := False;
    edtCodigoUsuario.Visible := False;

    lblCodigoTipoItem.Visible := False;
    lblCodigoUsuario.Visible := False;

    edtDescricaoTipoItem.Text := '';
  end
  else
  begin
    //Modo de edição
    //Editing mode
    with Unit_data_module.DataModule3.FDQuery_Tipo_Item do
    begin
      edtCodigoTipoItem.Visible := True;
      edtCodigoUsuario.Visible := True;

      lblCodigoTipoItem.Visible := True;
      lblCodigoUsuario.Visible := True;

      edtDescricaoTipoItem.Text := FieldByName('descricao_tipo_item').AsString;

      edtCodigoTipoItem.Text := FieldByName('codigo_tipo_item').AsString;
      edtCodigoUsuario.Text := FieldByName('codigo_usuario').AsString;
    end;
  end;
end;

end.
