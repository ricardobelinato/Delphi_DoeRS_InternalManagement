unit Unit_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Param, FireDAC.Comp.Client, System.UITypes;

type
  TForm_item = class(TForm)
    DBGrid1: TDBGrid;
    pnl1: TPanel;
    pnl2: TPanel;
    lblItens: TLabel;
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
  Form_item: TForm_item;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_manipular_item;

//Procedure de evento de clique no botão adicionar que abre o form 'manipular_item' e seta o valor da tag pra zero, para que, na lógica, o form seja aberto e configurado no modo de inserção de dados
//Click event procedure on the add button that opens the 'manipular_usuario' form and sets the tag value to zero, so that, logically, the form is opened and configured in data insertion mode
procedure TForm_item.btnAdicionarClick(Sender: TObject);
begin
  Form_manipular_item.Tag := 0; //Modo de inserção / Insertion mode
  Form_manipular_item.ShowModal;
end;

//Procedure de evento de clique no botão editar que abre o form 'manipular_item' e seta o valor da tag pra um, para que, na lógica, o form seja aberto e configurado no modo de edição de dados
//Click event procedure on the edit button that opens the 'manipular_usuario' form and sets the tag value to one, so that, logically, the form is opened and configured in data editing mode
procedure TForm_item.btnEditarClick(Sender: TObject);
begin
  Form_manipular_item.Tag := 1; //Modo de edição / Editing mode
  Form_manipular_item.ShowModal;
end;

//Procedure de evento de clique no botão excluir, dá um delete no usuário com o mesmo código usuário da query
//Click event procedure on the delete button, deletes the user with the same user code as the query
procedure TForm_item.btnExcluirClick(Sender: TObject);
var
  Query: TFDQuery;
  ItemID: Integer;
begin
  ItemID := Unit_data_module.DataModule3.FDQuery_Itens.FieldByName('codigo_item').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir este item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Unit_data_module.DataModule3.FD_Connection;
      Query.SQL.Text := 'DELETE FROM item WHERE codigo_item = :codigo_item';
      Query.ParamByName('codigo_item').AsInteger := ItemID;

      Query.ExecSQL;

      Unit_data_module.DataModule3.FDQuery_Itens.Close;
      Unit_data_module.DataModule3.FDQuery_Itens.Open;

      ShowMessage('Item deletado com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao deletar item: ' + E.Message);
    end;

    Query.Free;
  end;
end;

end.
