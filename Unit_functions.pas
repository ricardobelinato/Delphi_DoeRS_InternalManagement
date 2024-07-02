unit Unit_functions;

interface

uses
Vcl.StdCtrls, System.SysUtils, System.Classes, FireDAC.Comp.Client, FireDAC.Stan.Param, Vcl.Dialogs,
Vcl.Forms, Unit_data_module, Unit_cadastro, Unit_manipular_usuario, Unit_manipular_cidade, Unit_manipular_estado,
Unit_manipular_instituicoes, Unit_manipular_item, Unit_manipular_tipo_item;

procedure HandleEditCPFKeyPress(Sender: TObject; var Key: Char);
function RemoverFormatacaoCPF(const CPF: string): string;
function ValidarCamposLogin(Form: TForm; LoginEdit, CPFEEdit: TEdit): Boolean;
procedure InsertUser(const Nome, CPF, Login: string; Adm, Ativo: Boolean);
procedure UpdateUser(const CodigoUsuario: Integer; const Nome, CPF, Login: string; Adm, Ativo: Boolean);
procedure InsertCidade(const nomeCidade, populacao: string);
procedure UpdateCidade(CodigoCidade: Integer; const nomeCidade, populacao: string);
procedure InsertEstado(const NomeEstado, Sigla: String);
procedure UpdateEstado(CodigoEstado: Integer; const NomeEstado, Sigla: String);
procedure InsertInstituicao(const NomeInstituicao, Cnpj, Responsavel: String);
procedure UpdateInstituicao(CodigoInstituicao: Integer; const NomeInstituicao, Cnpj, Responsavel: String);
procedure InsertItem(const DescricaoItem, Unidade, DataValidade: string);
procedure UpdateItem(CodigoItem: Integer; const DescricaoItem, Unidade, DataValidade: string);
procedure InsertTipoItem(const DescricaoTipoItem: String);
procedure UpdateTipoItem(CodigoTipoItem: Integer; const DescricaoTipoItem: String);
var
  CodigoUsuario: Integer;
  IndicadorAdministrador: Boolean;

implementation

{Unit_login}
//Procedure para formatar o campo CPF no form login, de forma que o "text" do campo esteja vazio e seja preenchido de pontos e traço a medida que se escreve o CPF
//Procedure to format the CPF field in the login form, so that the "text" of the field is empty and is filled with dots and lines as the CPF is written
procedure HandleEditCPFKeyPress(Sender: TObject; var Key: Char);
var
  LEditText: string;
  LLength: Integer;
begin
  if not (Key in ['0'..'9', #8]) then
  begin
    Key := #0;
    Exit;
  end;

  LEditText := TEdit(Sender).Text;
  LLength := Length(LEditText);

  if (Key <> #8) then
  begin
    case LLength of
      3, 7: TEdit(Sender).Text := LEditText + '.';
      11: TEdit(Sender).Text := LEditText + '-';
    end;
    TEdit(Sender).SelStart := Length(TEdit(Sender).Text) + 1;
  end;
end;

{Unit_login}
//Função para remover a formatação do campo CPF no form de login, para caso o usuário dê backspace
//Function to remove the formatting of the CPF field in the login form, in case the user backspaces
function RemoverFormatacaoCPF(const CPF: string): string;
var
  I: Integer;
  OnlyNumbers: string;
begin
  OnlyNumbers := '';
  for I := 1 to Length(CPF) do
  begin
    if CPF[I] in ['0'..'9'] then
      OnlyNumbers := OnlyNumbers + CPF[I];
  end;
  Result := OnlyNumbers;
end;

{Unit_login}
//Procedure para validar campos do login, se estão vazios ou incorretos e permitir login caso devidamente validados
//Procedure to validate login fields, whether they are empty or incorrect and allow login if properly validated
function ValidarCamposLogin(Form: TForm; LoginEdit, CPFEEdit: TEdit): Boolean;
var
  Query: TFDQuery;
  LOGIN, CPF: string;
  indicadorAtivo: Boolean;
begin
  if LoginEdit.Text = '' then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher o campo login.');
    Exit;
  end;

  if CPFEEdit.Text = '' then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher o campo CPF.');
    Exit;
  end;

  LOGIN := LoginEdit.Text;
  CPF := RemoverFormatacaoCPF(CPFEEdit.Text);

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := DataModule3.FD_Connection;
    Query.SQL.Text := 'SELECT codigo_usuario, indicador_administrador, indicador_usuario_ativo ' +
                      'FROM usuario ' +
                      'WHERE login = :LOGIN AND cpf = :CPF';
    Query.Params.ParamByName('LOGIN').AsString := LOGIN;
    Query.Params.ParamByName('CPF').AsString := CPF;
    Query.Open;

    if not Query.IsEmpty then
    begin

      CodigoUsuario := Query.FieldByName('codigo_usuario').AsInteger;
      IndicadorAdministrador := Query.FieldByName('indicador_administrador').AsBoolean;
      indicadorAtivo := Query.FieldByName('indicador_usuario_ativo').AsBoolean;

      if indicadorAtivo then
      begin
        Form.Hide;
        Form_cadastro.Show;
        Result := True;
      end
      else
      begin
        ShowMessage('O usuário não está ativo. Por favor, entre em contato com o suporte.');
        Result := False;
      end;
    end
    else
    begin
      ShowMessage('Houve um erro nos campos login e/ou CPF. Por favor, verifique novamente.');
      Result := False;
    end;
  finally
    Query.Free;
  end;
end;

{Unit_manipular_usuario}
//Procedure para inserir usuários no banco de dados
procedure InsertUser(const Nome, CPF, Login: string; Adm, Ativo: Boolean);
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

    Query.ParamByName('nome').AsString := Nome;
    Query.ParamByName('cpf').AsString := CPF;
    Query.ParamByName('login').AsString := Login;
    Query.ParamByName('adm').AsBoolean := Adm;
    Query.ParamByName('ativo').AsBoolean := Ativo;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Usuarios.Close;
    Unit_data_module.DataModule3.FDQuery_Usuarios.Open;
    ShowMessage('Usuário adicionado com sucesso!');
    Form_manipular_usuario.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar usuário: ' + E.Message);
  end;

  Query.Free;
end;

{Unit_manipular_usuario}
//Procedure para editar usuários no banco de dados
procedure UpdateUser(const CodigoUsuario: Integer; const Nome, CPF, Login: string; Adm, Ativo: Boolean);
var
  SQLUpdate: string;
  Query: TFDQuery;
begin
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

    Query.ParamByName('nome').AsString := Nome;
    Query.ParamByName('login').AsString := Login;
    Query.ParamByName('cpf').AsString := CPF;
    Query.ParamByName('adm').AsBoolean := Adm;
    Query.ParamByName('ativo').AsBoolean := Ativo;
    Query.ParamByName('codigo_usuario').AsInteger := CodigoUsuario;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Usuarios.Close;
    Unit_data_module.DataModule3.FDQuery_Usuarios.Open;
    ShowMessage('Usuário atualizado com sucesso!');
    Form_manipular_usuario.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar usuário: ' + E.Message);
  end;

  Query.Free;
end;

{Unit_manipular_cidade}
//Procedure para inserir cidades no banco de dados
procedure InsertCidade(const nomeCidade, populacao: string);
var
  SQLInsert: string;
  Query: TFDQuery;
begin
  SQLInsert :=
    'INSERT INTO cidade (nome_cidade, populacao) ' +
    'VALUES (:nome_cidade, :populacao)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('nome_cidade').AsString := nomeCidade;
    Query.ParamByName('populacao').AsString := populacao;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Cidades.Close;
    Unit_data_module.DataModule3.FDQuery_Cidades.Open;
    ShowMessage('Cidade adicionada com sucesso!');
    Form_manipular_cidade.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar cidade: ' + E.Message);
  end;

  Query.Free;
end;

{Unit_manipular_cidade}
//Procedure para editar cidades no banco de dados
procedure UpdateCidade(CodigoCidade: Integer; const nomeCidade, populacao: string);
var
  SQLUpdate: string;
  Query: TFDQuery;
begin
  CodigoCidade := Unit_data_module.DataModule3.FDQuery_Cidades.FieldByName('codigo_cidade').AsInteger;

  SQLUpdate :=
    'UPDATE cidade ' +
    'SET nome_cidade = :nome_cidade, ' +
    '    populacao = :populacao ' +
    'WHERE codigo_cidade = :codigo_cidade';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('nome_cidade').AsString := nomeCidade;
    Query.ParamByName('populacao').AsString := populacao;
    Query.ParamByName('codigo_cidade').AsInteger := CodigoCidade;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Cidades.Close;
    Unit_data_module.DataModule3.FDQuery_Cidades.Open;
    ShowMessage('Cidade atualizada com sucesso!');
    Form_manipular_cidade.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar cidade: ' + E.Message);
  end;

  Query.Free;
end;

{Unit_manipular_estado}
//Procedure para inserir estados no banco de dados
procedure InsertEstado(const NomeEstado, Sigla: String);
var
  SQLInsert: string;
  Query: TFDQuery;
begin
  SQLInsert :=
    'INSERT INTO estado (nome_estado, sigla) ' +
    'VALUES (:nome_estado, :sigla)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('nome_estado').AsString := NomeEstado;
    Query.ParamByName('sigla').AsString := Sigla;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Estados.Close;
    Unit_data_module.DataModule3.FDQuery_Estados.Open;
    ShowMessage('Estado adicionado com sucesso!');
    Form_manipular_estado.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar estado: ' + E.Message);
  end;

  Query.Free;
end;

{Unit_manipular_estado}
//Procedure para editar estados no banco de dados
procedure UpdateEstado(CodigoEstado: Integer; const NomeEstado, Sigla: String);
var
  SQLUpdate: string;
  Query: TFDQuery;
begin
  CodigoEstado := Unit_data_module.DataModule3.FDQuery_Estados.FieldByName('codigo_estado').AsInteger;

  SQLUpdate :=
    'UPDATE estado ' +
    'SET nome_estado = :nome_estado, ' +
    '    sigla = :sigla ' +
    'WHERE codigo_estado = :codigo_estado';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('nome_estado').AsString := NomeEstado;
    Query.ParamByName('sigla').AsString := Sigla;
    Query.ParamByName('codigo_estado').AsInteger := CodigoEstado;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Estados.Close;
    Unit_data_module.DataModule3.FDQuery_Estados.Open;
    ShowMessage('Estado atualizado com sucesso!');
    Form_manipular_estado.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar estado: ' + E.Message);
  end;

  Query.Free;
end;

{Unit_manipular_instituicoes}
//Procedure para inserir instituições no banco de dados
procedure InsertInstituicao(const NomeInstituicao, Cnpj, Responsavel: String);
var
  SQLInsert: string;
  Query: TFDQuery;
begin
  SQLInsert :=
    'INSERT INTO instituicao (nome_instituicao, cnpj, responsavel) ' +
    'VALUES (:nome_instituicao, :cnpj, :responsavel)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('nome_instituicao').AsString := NomeInstituicao;
    Query.ParamByName('cnpj').AsString := Cnpj;
    Query.ParamByName('responsavel').AsString := Responsavel;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Instituicoes.Close;
    Unit_data_module.DataModule3.FDQuery_Instituicoes.Open;
    ShowMessage('Instituição adicionada com sucesso!');
    Form_manipular_instituicao.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar instituição: ' + E.Message);
  end;

  Query.Free;
end;

{Unit_manipular_instituicoes}
//Procedure para editar instituições no banco de dados
procedure UpdateInstituicao(CodigoInstituicao: Integer; const NomeInstituicao, Cnpj, Responsavel: String);
var
  SQLUpdate: string;
  Query: TFDQuery;
begin
  CodigoInstituicao := Unit_data_module.DataModule3.FDQuery_Instituicoes.FieldByName('codigo_instituicao').AsInteger;

  SQLUpdate :=
    'UPDATE instituicao ' +
    'SET nome_instituicao = :nome_instituicao, ' +
    '    cnpj = :cnpj, ' +
    '    responsavel = :responsavel ' +
    'WHERE codigo_instituicao = :codigo_instituicao';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('nome_instituicao').AsString := NomeInstituicao;
    Query.ParamByName('cnpj').AsString := Cnpj;
    Query.ParamByName('responsavel').AsString := Responsavel;
    Query.ParamByName('codigo_instituicao').AsInteger := CodigoInstituicao;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Instituicoes.Close;
    Unit_data_module.DataModule3.FDQuery_Instituicoes.Open;
    ShowMessage('Instituição atualizada com sucesso!');
    Form_manipular_instituicao.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar instituição: ' + E.Message);
  end;

  Query.Free;
end;

{Unit_manipular_item}
//Procedure para inserir itens no banco de dados
procedure InsertItem(const DescricaoItem, Unidade, DataValidade: string);
var
  SQLInsert: string;
  Query: TFDQuery;
begin
  SQLInsert :=
    'INSERT INTO item (descricao_item, unidade, data_validade) ' +
    'VALUES (:descricao_item, :unidade, :data_validade)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('descricao_item').AsString := DescricaoItem;
    Query.ParamByName('unidade').AsString := Unidade;
    Query.ParamByName('data_validade').AsString := DataValidade;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Itens.Close;
    Unit_data_module.DataModule3.FDQuery_Itens.Open;
    ShowMessage('Item adicionado com sucesso!');
    Form_manipular_item.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar item: ' + E.Message);
  end;

  Query.Free;
end;

{Unit_manipular_item}
//Procedure para editar itens no banco de dados
procedure UpdateItem(CodigoItem: Integer; const DescricaoItem, Unidade, DataValidade: string);
var
  SQLUpdate: string;
  Query: TFDQuery;
begin
  CodigoItem := Unit_data_module.DataModule3.FDQuery_Itens.FieldByName('codigo_item').AsInteger;

  SQLUpdate :=
    'UPDATE item ' +
    'SET descricao_item = :descricao_item, ' +
    '    unidade = :unidade, ' +
    '    data_validade = :data_validade ' +
    'WHERE codigo_item = :codigo_item';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('descricao_item').AsString := DescricaoItem;
    Query.ParamByName('unidade').AsString := Unidade;
    Query.ParamByName('data_validade').AsString := DataValidade;
    Query.ParamByName('codigo_item').AsInteger := CodigoItem;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Itens.Close;
    Unit_data_module.DataModule3.FDQuery_Itens.Open;
    ShowMessage('Item atualizado com sucesso!');
    Form_manipular_item.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar item: ' + E.Message);
  end;

  Query.Free;
end;

{Unit_manipular_tipo_item}
//Procedure para inserir tipos de itens no banco de dados
procedure InsertTipoItem(const DescricaoTipoItem: String);
var
  SQLInsert: string;
  Query: TFDQuery;
begin
  SQLInsert :=
    'INSERT INTO tipoitem (descricao_tipo_item) ' +
    'VALUES (:descricao_tipo_item)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('descricao_tipo_item').AsString := DescricaoTipoItem;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Tipo_Item.Close;
    Unit_data_module.DataModule3.FDQuery_Tipo_Item.Open;
    ShowMessage('Tipo do Item adicionado com sucesso!');
    Form_manipular_tipo_item.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar tipo do item: ' + E.Message);
  end;

  Query.Free;
end;

{Unit_manipular_tipo_item}
//Procedure para editar tipos de itens no banco de dados
procedure UpdateTipoItem(CodigoTipoItem: Integer; const DescricaoTipoItem: String);
var
  SQLUpdate: string;
  Query: TFDQuery;
begin
  CodigoTipoItem := Unit_data_module.DataModule3.FDQuery_Tipo_Item.FieldByName('codigo_tipo_item').AsInteger;

  SQLUpdate :=
    'UPDATE tipoitem ' +
    'SET descricao_tipo_item = :descricao_tipo_item ' +
    'WHERE codigo_tipo_item = :codigo_tipo_item';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('descricao_tipo_item').AsString := DescricaoTipoItem;
    Query.ParamByName('codigo_tipo_item').AsInteger := CodigoTipoItem;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Tipo_Item.Close;
    Unit_data_module.DataModule3.FDQuery_Tipo_Item.Open;
    ShowMessage('Tipo do Item atualizado com sucesso!');
    Form_manipular_tipo_item.Close;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar tipo do item: ' + E.Message);
  end;

  Query.Free;
end;

end.
