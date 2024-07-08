unit Unit_estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Param, FireDAC.Comp.Client, System.UITypes;

type
  TForm_estado = class(TForm)
    DBGrid1: TDBGrid;
    pnl1: TPanel;
    lblEstados: TLabel;
    pnl2: TPanel;
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
  Form_estado: TForm_estado;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_manipular_estado;

//Procedure de evento de clique no botão adicionar que abre o form 'manipular_estado' e seta o valor da tag pra zero, para que, na lógica, o form seja aberto e configurado no modo de inserção de dados
//Click event procedure on the add button that opens the 'manipular_estado' form and sets the tag value to zero, so that, logically, the form is opened and configured in data insertion mode
procedure TForm_estado.btnAdicionarClick(Sender: TObject);
begin
  Form_manipular_estado.Tag := 0; //Modo de inserção / Insertion mode
  Form_manipular_estado.ShowModal;
end;

//Procedure de evento de clique no botão editar que abre o form 'manipular_estado' e seta o valor da tag pra um, para que, na lógica, o form seja aberto e configurado no modo de edição de dados
//Click event procedure on the edit button that opens the 'manipular_estado' form and sets the tag value to one, so that, logically, the form is opened and configured in data editing mode
procedure TForm_estado.btnEditarClick(Sender: TObject);
begin
  Form_manipular_estado.Tag := 1; //Modo de edição / Editing mode
  Form_manipular_estado.ShowModal;
end;

//Procedure de evento de clique no botão excluir, dá um delete no usuário com o mesmo código usuário da query
//Click event procedure on the delete button, deletes the user with the same user code as the query
procedure TForm_estado.btnExcluirClick(Sender: TObject);
var
  Query: TFDQuery;
  EstadoID: Integer;
begin
  EstadoID := Unit_data_module.DataModule3.FDQuery_Estados.FieldByName('codigo_estado').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir este estado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Unit_data_module.DataModule3.FD_Connection;
      Query.SQL.Text := 'DELETE FROM estado WHERE codigo_estado = :codigo_estado';
      Query.ParamByName('codigo_estado').AsInteger := EstadoID;

      Query.ExecSQL;

      Unit_data_module.DataModule3.FDQuery_Estados.Close;
      Unit_data_module.DataModule3.FDQuery_Estados.Open;

      ShowMessage('Estado deletado com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao deletar estado: ' + E.Message);
    end;

    Query.Free;
  end;
end;

end.
