unit Unit_manipular_usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls;

type
  TForm_manipular_usuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnSalvar: TButton;
    EditNome: TDBEdit;
    EditCPF: TDBEdit;
    EditLogin: TDBEdit;
    CheckboxAdm: TDBCheckBox;
    CheckboxAtivo: TDBCheckBox;
    procedure btnSalvarClick(Sender: TObject);
    procedure CheckboxAdmClick(Sender: TObject);
    procedure CheckboxAtivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure InsertUser;
    procedure UpdateUser;
  public
    { Public declarations }
  end;

var
  Form_manipular_usuario: TForm_manipular_usuario;
  loginUsuario, nomeUsuario, CPFUsuario: String;
  UsuarioAdm, UsuarioAtivo: Boolean;
  Query: TFDQuery;

implementation

{$R *.dfm}
uses Unit_Login, Unit_data_module;


procedure TForm_manipular_usuario.CheckboxAtivoClick(Sender: TObject);
begin
  UsuarioAtivo := CheckboxAtivo.Checked;
end;

procedure TForm_manipular_usuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EditNome.DataSource := Unit_data_module.DataModule3.DataSource_Usuarios;
  EditCPF.DataSource := Unit_data_module.DataModule3.DataSource_Usuarios;
  EditLogin.DataSource := Unit_data_module.DataModule3.DataSource_Usuarios;
  CheckboxAdm.DataSource := Unit_data_module.DataModule3.DataSource_Usuarios;
  CheckboxAtivo.DataSource := Unit_data_module.DataModule3.DataSource_Usuarios;
end;

procedure TForm_manipular_usuario.FormShow(Sender: TObject);
begin
  if Tag = 0 then
  begin
    // Modo de inserção
    EditNome.DataSource := nil;
    EditCPF.DataSource := nil;
    EditLogin.DataSource := nil;
    CheckboxAdm.DataSource := nil;
    CheckboxAtivo.DataSource := nil;
  end
  else
  begin
    // Modo de edição
    EditNome.DataSource := Unit_data_module.DataModule3.DataSource_Usuarios;
    EditCPF.DataSource := Unit_data_module.DataModule3.DataSource_Usuarios;
    EditLogin.DataSource := Unit_data_module.DataModule3.DataSource_Usuarios;
    CheckboxAdm.DataSource := Unit_data_module.DataModule3.DataSource_Usuarios;
    CheckboxAtivo.DataSource := Unit_data_module.DataModule3.DataSource_Usuarios;
  end;
end;

procedure TForm_manipular_usuario.CheckboxAdmClick(Sender: TObject);
begin
  UsuarioAdm := CheckboxAdm.Checked;
end;

procedure TForm_manipular_usuario.btnSalvarClick(Sender: TObject);
begin
  if Tag = 0 then
    InsertUser
  else
    UpdateUser;
end;

procedure TForm_manipular_usuario.InsertUser;
var
  SQLInsert: string;
begin
  loginUsuario := EditLogin.Text;
  nomeUsuario := EditNome.Text;
  CPFUsuario := EditCPF.Text;

  SQLInsert :=
    'INSERT INTO usuario (login, nome_completo, cpf, indicador_administrador, indicador_usuario_ativo) ' +
    'VALUES (:login, :nome, :cpf, :adm, :ativo)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('nome').AsString := nomeUsuario;
    Query.ParamByName('cpf').AsString := CPFUsuario;
    Query.ParamByName('login').AsString := loginUsuario;
    Query.ParamByName('adm').AsBoolean := CheckboxAdm.Checked;
    Query.ParamByName('ativo').AsBoolean := CheckboxAtivo.Checked;

    Query.ExecSQL;

    Form_manipular_usuario.Close;
    Unit_data_module.DataModule3.FDQuery_Usuarios.Close;
    Unit_data_module.DataModule3.FDQuery_Usuarios.Open;

    ShowMessage('Usuário adicionado com sucesso!');

    EditNome.Text := '';
    EditCPF.Text := '';
    EditLogin.Text := '';
    CheckboxAdm.Checked := False;
    CheckboxAtivo.Checked := False;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar usuário: ' + E.Message);
  end;

  Query.Free;
end;

procedure TForm_manipular_usuario.UpdateUser;
var
  SQLUpdate: string;
begin
  loginUsuario := EditLogin.Text;
  nomeUsuario := EditNome.Text;
  CPFUsuario := EditCPF.Text;

  SQLUpdate :=
    'UPDATE usuario SET ' +
    'login = :login, ' +
    'nome_completo = :nome, ' +
    'cpf = :cpf, ' +
    'indicador_administrador = :adm, ' +
    'indicador_usuario_ativo = :ativo ' +
    'WHERE codigo_usuario = :codigo_usuario';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('nome').AsString := nomeUsuario;
    Query.ParamByName('cpf').AsString := CPFUsuario;
    Query.ParamByName('login').AsString := loginUsuario;
    Query.ParamByName('adm').AsBoolean := CheckboxAdm.Checked;
    Query.ParamByName('ativo').AsBoolean := CheckboxAtivo.Checked;
    Query.ParamByName('codigo_usuario').AsInteger := Tag;

    Query.ExecSQL;

    Form_manipular_usuario.Close;
    Unit_data_module.DataModule3.FDQuery_Usuarios.Close;
    Unit_data_module.DataModule3.FDQuery_Usuarios.Open;

    ShowMessage('Usuário atualizado com sucesso!');

    EditNome.Text := '';
    EditCPF.Text := '';
    EditLogin.Text := '';
    CheckboxAdm.Checked := False;
    CheckboxAtivo.Checked := False;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar usuário: ' + E.Message);
  end;

  Query.Free;
end;

//var
//  SQLInsert: string;
//begin
//  loginUsuario := EditLogin.Text;
//  nomeUsuario := EditNome.Text;
//  CPFUsuario := EditCPF.Text;
//
//  SQLInsert :=
//    'INSERT INTO usuario (login, nome_completo, cpf, indicador_administrador, indicador_usuario_ativo) ' +
//    'VALUES (:login, :nome, :cpf, :adm, :ativo)';
//
//  Query := TFDQuery.Create(nil);
//  try
//    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
//    Query.SQL.Text := SQLInsert;
//
//    Query.ParamByName('nome').AsString := nomeUsuario;
//    Query.ParamByName('cpf').AsString := CPFUsuario;
//    Query.ParamByName('login').AsString := loginUsuario;
//    Query.ParamByName('adm').AsBoolean := UsuarioAdm;
//    Query.ParamByName('ativo').AsBoolean := UsuarioAtivo;
//
//    Query.ExecSQL;
//
//    Form_manipular_usuario.Close;
//    Unit_data_module.DataModule3.FDQuery_Usuarios.Close;
//    Unit_data_module.DataModule3.FDQuery_Usuarios.Open;
//
//
//    ShowMessage('Usuário adicionado com sucesso!');
//
//    EditNome.Text := '';
//    EditCPF.Text := '';
//    EditLogin.Text := '';
//    CheckboxAdm.Checked := False;
//    CheckboxAtivo.Checked := False;
//
//  except
//    on E: Exception do
//      ShowMessage('Erro ao adicionar usuário: ' + E.Message);
//  end;
//
//  Query.Free;
//end;

end.
