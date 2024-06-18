unit Usuario_adicionar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client;

type
  TForm_adicionar_usuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EditNome: TEdit;
    EditCPF: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    EditLogin: TEdit;
    Label3: TLabel;
    CheckboxAdm: TCheckBox;
    CheckboxAtivo: TCheckBox;
    Button1: TButton;
    FD_Connection: TFDConnection;
    procedure Button1Click(Sender: TObject);
    procedure CheckboxAdmClick(Sender: TObject);
    procedure CheckboxAtivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_adicionar_usuario: TForm_adicionar_usuario;
  loginUsuario, nomeUsuario, CPFUsuario: String;
  UsuarioAdm, UsuarioAtivo: Boolean;
  Query: TFDQuery;

implementation

{$R *.dfm}
uses Unit_Login, Unit_data_module;


procedure TForm_adicionar_usuario.CheckboxAtivoClick(Sender: TObject);
begin
  UsuarioAtivo := CheckboxAtivo.Checked;
end;

procedure TForm_adicionar_usuario.CheckboxAdmClick(Sender: TObject);
begin
  UsuarioAdm := CheckboxAdm.Checked;
end;

procedure TForm_adicionar_usuario.Button1Click(Sender: TObject);
var
  SQLInsert: string;
begin
  loginUsuario := EditLogin.Text;
  nomeUsuario := EditNome.Text;
  CPFUsuario := EditCPF.Text;

  // Montar a query de inserção
  SQLInsert :=
    'INSERT INTO usuario (login, nome_completo, cpf, indicador_administrador, indicador_usuario_ativo) ' +
    'VALUES (:login, :nome, :cpf, :adm, :ativo)';

  // Criar e configurar a query
  Query := TFDQuery.Create(nil);
  try
    Query.Connection := FD_Connection;
    Query.SQL.Text := SQLInsert;

    // Passar os parâmetros para a query
    Query.ParamByName('nome').AsString := nomeUsuario;
    Query.ParamByName('cpf').AsString := CPFUsuario;
    Query.ParamByName('login').AsString := loginUsuario;
    Query.ParamByName('adm').AsBoolean := UsuarioAdm; // Se for TINYINT, usar AsInteger
    Query.ParamByName('ativo').AsBoolean := UsuarioAtivo; // Se for TINYINT, usar AsInteger

    // Executar a query de inserção
    Query.ExecSQL;

    // Exemplo de mensagem de sucesso
    ShowMessage('Usuário adicionado com sucesso!');

    // Limpar os campos após a inserção (opcional)
    EditNome.Text := '';
    EditCPF.Text := '';
    EditLogin.Text := '';
    CheckboxAdm.Checked := False;
    CheckboxAtivo.Checked := False;

//    FDQuery_Usuarios.Close;
//    FDQuery_Usuarios.Open;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar usuário: ' + E.Message);
  end;

  // Liberar a query da memória
  Query.Free;
end;

end.
