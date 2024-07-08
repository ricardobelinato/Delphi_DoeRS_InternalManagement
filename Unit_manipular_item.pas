unit Unit_manipular_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm_manipular_item = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TButton;
    lblNomeItem: TLabel;
    edtDescricaoItem: TEdit;
    cmbUnidade: TComboBox;
    lblUnidade: TLabel;
    lblDataValidade: TLabel;
    mskDataValidade: TMaskEdit;
    lblCodigoItem: TLabel;
    edtCodigoItem: TEdit;
    lblCodigoTipoItem: TLabel;
    edtCodigoTipoItem: TEdit;
    lblCodigoUsuario: TLabel;
    edtCodigoUsuario: TEdit;
    cmbDescricaoTipoItem: TComboBox;
    lblDescricaoTipoItem: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmbDescricaoTipoItemChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_manipular_item: TForm_manipular_item;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_functions;

//Procedure que verifica quando o valor do combobox 'cmbDescricaoTipoItem' muda e apartir disso dá o devido codTipoItem para o campo 'codigo_tipo_item'
//Procedure that checks when the value of the combobox 'cmbDescricaoTipoItem' changes and then gives the appropriate codTipoItem to the field 'codigo_tipo_item'
procedure TForm_manipular_item.cmbDescricaoTipoItemChange(Sender: TObject);
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

//Procedure evento que aciona quando o form é aberto na tela que dá os valores no 'Items' do combobox 'cmbDescricaoTipoItem' através de um select da 'FDQuery_CmbDescricaoTipoItem', no datamodule
//Procedure event that triggers when the form is opened on the screen that gives the values in the 'Items' of the 'cmbDescricaoTipoItem' combobox through a select from 'FDQuery_CmbDescricaoTipoItemFDQuery_CmbSiglaEstado', in the datamodule
procedure TForm_manipular_item.FormActivate(Sender: TObject);
begin
  Unit_data_module.DataModule3.FDQuery_CmbDescricaoTipoItem.Open;
  cmbDescricaoTipoItem.Items.Clear;

  while not Unit_data_module.DataModule3.FDQuery_CmbDescricaoTipoItem.Eof do
  begin
    cmbDescricaoTipoItem.Items.Add(Unit_data_module.DataModule3.FDQuery_CmbDescricaoTipoItem.FieldByName('descricao_tipo_item').AsString);
    Unit_data_module.DataModule3.FDQuery_CmbDescricaoTipoItem.Next;
  end;

  Unit_data_module.DataModule3.FDQuery_CmbDescricaoTipoItem.Close;
end;

//Procedure do evento de clique no botão salvar que executa um insert ou update dependendo do modo selecionado, essa procedure também valida se os campos obrigatórios não estão vazios, caso estejam é barrado de prosseguir
//Procedure of the click event on the save button that performs an insert or update depending on the selected mode, this procedure also validates that the mandatory fields are not empty, if they are, it is blocked from proceeding
procedure TForm_manipular_item.btnSalvarClick(Sender: TObject);
var
  CodigoItem: Integer;
begin
  if (edtDescricaoItem.Text='') or (cmbUnidade.Text='') or (mskDataValidade.Text='') or (cmbDescricaoTipoItem.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher algum(s) campo(s) obrigatório(s).');
    Exit;
  end;

  if Tag = 0 then
  begin
    Unit_functions.InsertItem(edtDescricaoItem.Text, cmbUnidade.Text, mskDataValidade.Text, edtCodigoTipoItem.Text);
  end
  else
  begin
    CodigoItem := StrToInt(edtCodigoItem.Text);
    Unit_functions.UpdateItem(CodigoItem, edtDescricaoItem.Text, cmbUnidade.Text, mskDataValidade.Text);
  end;
end;

//Procedure que trata de labels e campos edit de acordo com o modo de inserção ou edição, mexendo com a visibilidade de componentes, deixando-os disabled, limpando campos ou dando valores a eles
//Procedure that deals with labels and edit fields according to the insertion or editing mode, changing the visibility of components, leaving them disabled, clearing fields or giving them values
procedure TForm_manipular_item.FormShow(Sender: TObject);
begin
  edtCodigoItem.Enabled := False;
  edtCodigoTipoItem.Enabled := False;
  edtCodigoUsuario.Enabled := False;

  if Tag = 0 then
  begin
    //Modo de inserção
    //Insertion mode
    edtCodigoItem.Visible := False;
    edtCodigoTipoItem.Visible := False;
    edtCodigoUsuario.Visible := False;

    lblCodigoItem.Visible := False;
    lblCodigoTipoItem.Visible := False;
    lblCodigoUsuario.Visible := False;

    edtDescricaoItem.Text := '';
    cmbUnidade.Text := '';
    mskDataValidade.Text := '';
  end
  else
  begin
    //Modo de edição
    //Editing mode
    with Unit_data_module.DataModule3.FDQuery_Itens do
    begin
      edtCodigoItem.Visible := True;
      edtCodigoTipoItem.Visible := True;
      edtCodigoUsuario.Visible := True;

      lblCodigoItem.Visible := True;
      lblCodigoTipoItem.Visible := True;
      lblCodigoUsuario.Visible := True;

      edtDescricaoItem.Text := FieldByName('descricao_item').AsString;
      cmbUnidade.Text := FieldByName('unidade').AsString;
      mskDataValidade.Text := FieldByName('data_validade').AsString;

      edtCodigoItem.Text := FieldByName('codigo_item').AsString;
      edtCodigoTipoItem.Text := FieldByName('codigo_tipo_item').AsString;
      edtCodigoUsuario.Text := FieldByName('codigo_usuario').AsString;
    end;
  end;
end;

end.
