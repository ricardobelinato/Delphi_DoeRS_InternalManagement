unit Unit_tipo_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Param, FireDAC.Comp.Client, System.UITypes;

type
  TForm_tipo_item = class(TForm)
    pnl1: TPanel;
    DBGrid1: TDBGrid;
    pnl2: TPanel;
    lblTipoItem: TLabel;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_tipo_item: TForm_tipo_item;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_manipular_tipo_item;

//Procedure de evento de clique no botão adicionar que abre o form 'manipular_tipo_item' e seta o valor da tag pra zero, para que, na lógica, o form seja aberto e configurado no modo de inserção de dados
//Click event procedure on the add button that opens the 'manipular_tipo_item' form and sets the tag value to zero, so that, logically, the form is opened and configured in data insertion mode
procedure TForm_tipo_item.btnAdicionarClick(Sender: TObject);
begin
  Form_manipular_tipo_item.Tag := 0; //Modo de inserção / Insertion mode
  Form_manipular_tipo_item.ShowModal;
end;

//Procedure de evento de clique no botão editar que abre o form 'manipular_tipo_item' e seta o valor da tag pra um, para que, na lógica, o form seja aberto e configurado no modo de edição de dados
//Click event procedure on the edit button that opens the 'manipular_tipo_item' form and sets the tag value to one, so that, logically, the form is opened and configured in data editing mode
procedure TForm_tipo_item.btnEditarClick(Sender: TObject);
begin
  Form_manipular_tipo_item.Tag := 1; //Modo de edição / Editing mode
  Form_manipular_tipo_item.ShowModal;
end;

//Procedure de evento de clique no botão excluir, dá um delete no usuário com o mesmo código usuário da query
//Click event procedure on the delete button, deletes the user with the same user code as the query
procedure TForm_tipo_item.btnExcluirClick(Sender: TObject);
var
  Query: TFDQuery;
  TipoItemID: Integer;
begin
  TipoItemID := Unit_data_module.DataModule3.FDQuery_Tipo_Item.FieldByName('codigo_tipo_item').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir este tipo de item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Unit_data_module.DataModule3.FD_Connection;
      Query.SQL.Text := 'DELETE FROM tipoitem WHERE codigo_tipo_item = :codigo_tipo_item';
      Query.ParamByName('codigo_tipo_item').AsInteger := TipoItemID;

      Query.ExecSQL;

      Unit_data_module.DataModule3.FDQuery_Tipo_Item.Close;
      Unit_data_module.DataModule3.FDQuery_Tipo_Item.Open;

      ShowMessage('Tipo de Item deletado com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao deletar tipo de item: ' + E.Message);
    end;

    Query.Free;
  end;
end;

end.
