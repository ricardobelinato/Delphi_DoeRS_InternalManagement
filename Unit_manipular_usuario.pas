unit Unit_manipular_usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Param;

type
  TForm_manipular_usuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btnSalvar: TButton;
    Edit_nome_usuario: TEdit;
    Edit_cpf: TEdit;
    Edit_login: TEdit;
    Checkbox_adm: TCheckBox;
    Checkbox_ativo: TCheckBox;
    Edit_codigo_usuario: TEdit;
    Label_codigo_usuario: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure InsertUser;
    procedure UpdateUser;
  public
    { Public declarations }
  end;

var
  Form_manipular_usuario: TForm_manipular_usuario;

implementation

{$R *.dfm}

uses Unit_data_module;

procedure TForm_manipular_usuario.FormShow(Sender: TObject);
begin
  Edit_codigo_usuario.ReadOnly := True;
  Edit_codigo_usuario.Enabled := False;
  if Tag = 0 then
  begin
    // Modo de inserção
    Edit_codigo_usuario.Visible := False;
    Label_codigo_usuario.Visible := False;

    Edit_nome_usuario.Text := '';
    Edit_cpf.Text := '';
    Edit_login.Text := '';
    Checkbox_adm.Checked := False;
    Checkbox_ativo.Checked := False;
  end
  else
  begin
    // Modo de edição
    with Unit_data_module.DataModule3.FDQuery_Usuarios do
    begin
      Edit_codigo_usuario.Visible := True;
      Label_codigo_usuario.Visible := True;

      Edit_codigo_usuario.Text := FieldByName('codigo_usuario').AsString;
      Edit_nome_usuario.Text := FieldByName('nome_completo').AsString;
      Edit_cpf.Text := FieldByName('cpf').AsString;
      Edit_login.Text := FieldByName('login').AsString;
      Checkbox_adm.Checked := FieldByName('indicador_administrador').AsBoolean;
      Checkbox_ativo.Checked := FieldByName('indicador_usuario_ativo').AsBoolean;
    end;
  end;
end;

procedure TForm_manipular_usuario.btnSalvarClick(Sender: TObject);
begin

  if (Edit_nome_usuario.Text='') or (Edit_cpf.Text='') or (Edit_login.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher algum(s) campo(s) obrigatório(s).');
    Exit;
  end;

  if Tag = 0 then
    InsertUser
  else
    UpdateUser;
end;

procedure TForm_manipular_usuario.InsertUser;
var
  SQLInsert: string;
  Query: TFDQuery;
begin
  SQLInsert :=
    'INSERT INTO usuario (login, nome_completo, cpf, indicador_administrador, indicador_usuario_ativo) ' +
    'VALUES (:login, :nome, :cpf, :adm, :ativo)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('nome').AsString := Edit_nome_usuario.Text;
    Query.ParamByName('cpf').AsString := Edit_cpf.Text;
    Query.ParamByName('login').AsString := Edit_login.Text;
    Query.ParamByName('adm').AsBoolean := Checkbox_adm.Checked;
    Query.ParamByName('ativo').AsBoolean := Checkbox_ativo.Checked;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Usuarios.Close;
    Unit_data_module.DataModule3.FDQuery_Usuarios.Open;
    ShowMessage('Usuário adicionado com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar usuário: ' + E.Message);
  end;

  Query.Free;
end;

procedure TForm_manipular_usuario.UpdateUser;
var
  SQLUpdate: string;
  Query: TFDQuery;
  CodigoUsuario: Integer;
begin
  CodigoUsuario := Unit_data_module.DataModule3.FDQuery_Usuarios.FieldByName('codigo_usuario').AsInteger;

  SQLUpdate :=
    'UPDATE usuario ' +
    'SET nome_completo = :nome, ' +
    '    login = :login, ' +
    '    cpf = :cpf, ' +
    '    indicador_administrador = :adm, ' +
    '    indicador_usuario_ativo = :ativo ' +
    'WHERE codigo_usuario = :codigo_usuario';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('nome').AsString := Edit_nome_usuario.Text;
    Query.ParamByName('login').AsString := Edit_login.Text;
    Query.ParamByName('cpf').AsString := Edit_cpf.Text;
    Query.ParamByName('adm').AsBoolean := Checkbox_adm.Checked;
    Query.ParamByName('ativo').AsBoolean := Checkbox_ativo.Checked;
    Query.ParamByName('codigo_usuario').AsInteger := CodigoUsuario;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Usuarios.Close;
    Unit_data_module.DataModule3.FDQuery_Usuarios.Open;
    ShowMessage('Usuário atualizado com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar usuário: ' + E.Message);
  end;

  Query.Free;
end;


end.

