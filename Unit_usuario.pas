unit Unit_usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param, System.UITypes;

type
  TForm_usuarios = class(TForm)
    DBGrid_usuario: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
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

procedure TForm_usuarios.btnAdicionarClick(Sender: TObject);
begin
  Form_manipular_usuario.Tag := 0; // Modo de inserção
  Form_manipular_usuario.ShowModal;
end;

procedure TForm_usuarios.btnEditarClick(Sender: TObject);
begin
  Form_manipular_usuario.Tag := 1; // Modo de edição
  Form_manipular_usuario.ShowModal;
end;

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

