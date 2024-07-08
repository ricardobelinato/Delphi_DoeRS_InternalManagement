unit Unit_usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param, System.UITypes;

type
  TForm_usuarios = class(TForm)
    DBGrid_usuario: TDBGrid;
    pnl1: TPanel;
    pnl2: TPanel;
    lblUsuarios: TLabel;
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
  Form_usuarios: TForm_usuarios;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_manipular_usuario;

//Procedure de evento de clique no botão adicionar que abre o form 'manipular_usuario' e seta o valor da tag pra zero, para que, na lógica, o form seja aberto e configurado no modo de inserção de dados
//Click event procedure on the add button that opens the 'manipular_usuario' form and sets the tag value to zero, so that, logically, the form is opened and configured in data insertion mode
procedure TForm_usuarios.btnAdicionarClick(Sender: TObject);
begin
  Form_manipular_usuario.Tag := 0; //Modo de inserção / Insertion mode
  Form_manipular_usuario.ShowModal;
end;

//Procedure de evento de clique no botão editar que abre o form 'manipular_usuario' e seta o valor da tag pra um, para que, na lógica, o form seja aberto e configurado no modo de edição de dados
//Click event procedure on the edit button that opens the 'manipular_usuario' form and sets the tag value to one, so that, logically, the form is opened and configured in data editing mode
procedure TForm_usuarios.btnEditarClick(Sender: TObject);
begin
  Form_manipular_usuario.Tag := 1; //Modo de edição / Editing mode
  Form_manipular_usuario.ShowModal;
end;

//Procedure de evento de clique no botão excluir, dá um delete no usuário com o mesmo código usuário da query
//Click event procedure on the delete button, deletes the user with the same user code as the query
procedure TForm_usuarios.btnExcluirClick(Sender: TObject);
var
  Query: TFDQuery;
  UsuarioID: Integer;
begin
  UsuarioID := Unit_data_module.DataModule3.FDQuery_Usuarios.FieldByName('codigo_usuario').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir este usuário?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Unit_data_module.DataModule3.FD_Connection;
      Query.SQL.Text := 'DELETE FROM usuario WHERE codigo_usuario = :codigo_usuario';
      Query.ParamByName('codigo_usuario').AsInteger := UsuarioID;

      Query.ExecSQL;

      Unit_data_module.DataModule3.FDQuery_Usuarios.Close;
      Unit_data_module.DataModule3.FDQuery_Usuarios.Open;

      ShowMessage('Usuário deletado com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao deletar usuário: ' + E.Message);
    end;

    Query.Free;
  end;
end;

end.

