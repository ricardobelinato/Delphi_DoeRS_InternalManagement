unit Unit_functions;

interface

uses
Vcl.StdCtrls, System.SysUtils, System.Classes, FireDAC.Comp.Client, FireDAC.Stan.Param, Vcl.Dialogs,
Vcl.Forms, Unit_data_module, Unit_cadastro, Unit_usuario, Unit_cidade, Unit_estado, Unit_instituicoes,
Unit_item, Unit_tipo_item, Unit_manipular_usuario, Unit_manipular_cidade, Unit_manipular_estado,
Unit_manipular_instituicoes, Unit_manipular_item, Unit_manipular_tipo_item;

procedure HandleEditCPFKeyPress(Sender: TObject; var Key: Char);
function RemoverFormatacaoCPF(const CPF: string): string;
function ValidarCamposLogin(Form: TForm; LoginEdit, CPFEEdit: TEdit): Boolean;
procedure InsertUser(const Nome, CPF, Login: string; Adm, Ativo: Boolean);
procedure UpdateUser(const CodigoUsuario: Integer; const Nome, CPF, Login: string; Adm, Ativo: Boolean);
procedure InsertCidade(const nomeCidade, populacao: string);
procedure UpdateCidade(CodigoCidade: Integer; const nomeCidade, populacao: string);
//procedure SetarCodEstado(Index: Integer; const edtCodigoEstado: TEdit);
procedure InsertEstado(const NomeEstado, Sigla: String);
procedure UpdateEstado(CodigoEstado: Integer; edtEstado: TEdit; const NomeEstado, Sigla: String);
procedure SetarEstado(Index: Integer; const edtEstado: TEdit);
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
//Procedure to insert users into the database
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
//Procedure to edit users in the database
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
//Procedure to insert cities into the database
procedure InsertCidade(const nomeCidade, populacao: string);
var
  SQLInsert: string;
  Query: TFDQuery;
begin
  SQLInsert :=
    'INSERT INTO cidade (nome_cidade, populacao, codigo_usuario) ' +
    'VALUES (:nome_cidade, :populacao, :CodigoUsuario)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('nome_cidade').AsString := nomeCidade;
    Query.ParamByName('populacao').AsString := populacao;
    Query.ParamByName('CodigoUsuario').AsString := IntToStr(CodigoUsuario);

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
//Procedure to edit cities in the database
procedure UpdateCidade(CodigoCidade: Integer; const nomeCidade, populacao: string);
var
  SQLUpdate: string;
  Query: TFDQuery;
begin
  SQLUpdate :=
    'UPDATE cidade ' +
    'SET nome_cidade = :nome_cidade, ' +
    '    populacao = :populacao, ' +
    '    codigo_usuario = :CodigoUsuario ' +
    'WHERE codigo_cidade = :codigo_cidade';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('nome_cidade').AsString := nomeCidade;
    Query.ParamByName('populacao').AsString := populacao;
    Query.ParamByName('CodigoUsuario').AsString := IntToStr(CodigoUsuario);
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

{Unit_manipular_cidade}
//Procedure criada pra passar o codestado pra cidade
//procedure SetarCodEstado(Index: Integer; const edtCodigoEstado: TEdit);
//begin
//  if Index <> -1 then
//  begin
//    case Index of
//      0: edtCodigoEstado.Text := '1';       //Acre
//      1: edtCodigoEstado.Text := '2';       //Alagoas
//      2: edtCodigoEstado.Text := '3';       //Amapá
//      3: edtCodigoEstado.Text := '4';       //Amazonas
//      4: edtCodigoEstado.Text := '5';       //Bahia
//      5: edtCodigoEstado.Text := '6';       //Ceará
//      6: edtCodigoEstado.Text := '7';       //Distrito Federal
//      7: edtCodigoEstado.Text := '8';       //Espírito Santo
//      8: edtCodigoEstado.Text := '9';       //Goiás
//      9: edtCodigoEstado.Text := '10';      //Maranhão
//      10: edtCodigoEstado.Text := '11';     //Mato Grosso
//      11: edtCodigoEstado.Text := '12';     //Mato Grosso do Sul
//      12: edtCodigoEstado.Text := '13';     //Minas Gerais
//      13: edtCodigoEstado.Text := '14';     //Pará
//      14: edtCodigoEstado.Text := '15';     //Paraíba
//      15: edtCodigoEstado.Text := '16';     //Paraná
//      16: edtCodigoEstado.Text := '17';     //Pernambuco
//      17: edtCodigoEstado.Text := '18';     //Piauí
//      18: edtCodigoEstado.Text := '19';     //Rio de Janeiro
//      19: edtCodigoEstado.Text := '20';     //Rio Grande do Norte
//      20: edtCodigoEstado.Text := '21';     //Rio Grande do Sul
//      21: edtCodigoEstado.Text := '22';     //Rondônia
//      22: edtCodigoEstado.Text := '23';     //Roraima
//      23: edtCodigoEstado.Text := '24';     //Santa Catarina
//      24: edtCodigoEstado.Text := '25';     //São Paulo
//      25: edtCodigoEstado.Text := '26';     //Sergipe
//      26: edtCodigoEstado.Text := '27';     //Tocantins
//    end;
//  end;
//end;

{Unit_manipular_estado}
//Procedure para inserir estados no banco de dados
//Procedure to insert states into the database
procedure InsertEstado(const NomeEstado, Sigla: String);
var
  SQLInsert: string;
  Query: TFDQuery;
begin
  SQLInsert :=
    'INSERT INTO estado (nome_estado, sigla, codigo_usuario) ' +
    'VALUES (:nome_estado, :sigla, :CodigoUsuario)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('nome_estado').AsString := NomeEstado;
    Query.ParamByName('sigla').AsString := Sigla;
    Query.ParamByName('CodigoUsuario').AsString := IntToStr(CodigoUsuario);

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
//Procedure to edit states in the database



//procedure UpdateEstado(CodigoEstado: Integer; const NomeEstado, Sigla: String);
procedure UpdateEstado(CodigoEstado: Integer; edtEstado: TEdit; const NomeEstado, Sigla: String);
var
  SQLUpdate: string;
  Query: TFDQuery;
begin
  SQLUpdate :=
    'UPDATE estado ' +
    'SET nome_estado = :nome_estado, ' +
    '    sigla = :sigla, ' +
    '    codigo_usuario = :CodigoUsuario ' +
    'WHERE codigo_estado = :codigo_estado';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('nome_estado').AsString := edtEstado.Text;
    Query.ParamByName('sigla').AsString := Sigla;
    Query.ParamByName('CodigoUsuario').AsString := IntToStr(CodigoUsuario);
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

{Unit_manipular_estado}
//Procedure que altera o valor do edit 'edtEstado' de acordo com a sigla selecionada no combobox
//Procedure that changes the value of edit 'edtEstado' according to the acronym selected in the combobox
procedure SetarEstado(Index: Integer; const edtEstado: TEdit);
begin
  if Index <> -1 then
  begin
    case Index of
      0: edtEstado.Text := 'Acre';
      1: edtEstado.Text := 'Alagoas';
      2: edtEstado.Text := 'Amapá';
      3: edtEstado.Text := 'Amazonas';
      4: edtEstado.Text := 'Bahia';
      5: edtEstado.Text := 'Ceará';
      6: edtEstado.Text := 'Distrito Federal';
      7: edtEstado.Text := 'Espírito Santo';
      8: edtEstado.Text := 'Goiás';
      9: edtEstado.Text := 'Maranhão';
      10: edtEstado.Text := 'Mato Grosso';
      11: edtEstado.Text := 'Mato Grosso do Sul';
      12: edtEstado.Text := 'Minas Gerais';
      13: edtEstado.Text := 'Pará';
      14: edtEstado.Text := 'Paraíba';
      15: edtEstado.Text := 'Paraná';
      16: edtEstado.Text := 'Pernambuco';
      17: edtEstado.Text := 'Piauí';
      18: edtEstado.Text := 'Rio de Janeiro';
      19: edtEstado.Text := 'Rio Grande do Norte';
      20: edtEstado.Text := 'Rio Grande do Sul';
      21: edtEstado.Text := 'Rondônia';
      22: edtEstado.Text := 'Roraima';
      23: edtEstado.Text := 'Santa Catarina';
      24: edtEstado.Text := 'São Paulo';
      25: edtEstado.Text := 'Sergipe';
      26: edtEstado.Text := 'Tocantins';
    end;
  end;
end;

{Unit_manipular_instituicoes}
//Procedure para inserir instituições no banco de dados
//Procedure to insert institutions into the database
procedure InsertInstituicao(const NomeInstituicao, Cnpj, Responsavel: String);
var
  SQLInsert: string;
  Query: TFDQuery;
begin
  SQLInsert :=
    'INSERT INTO instituicao (nome_instituicao, cnpj, responsavel, codigo_usuario) ' +
    'VALUES (:nome_instituicao, :cnpj, :responsavel, :CodigoUsuario)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('nome_instituicao').AsString := NomeInstituicao;
    Query.ParamByName('cnpj').AsString := Cnpj;
    Query.ParamByName('responsavel').AsString := Responsavel;
    Query.ParamByName('CodigoUsuario').AsString := IntToStr(CodigoUsuario);

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
//Procedure to edit institutions in the database
procedure UpdateInstituicao(CodigoInstituicao: Integer; const NomeInstituicao, Cnpj, Responsavel: String);
var
  SQLUpdate: string;
  Query: TFDQuery;
begin
  SQLUpdate :=
    'UPDATE instituicao ' +
    'SET nome_instituicao = :nome_instituicao, ' +
    '    cnpj = :cnpj, ' +
    '    responsavel = :responsavel, ' +
    '    codigo_usuario = :CodigoUsuario ' +
    'WHERE codigo_instituicao = :codigo_instituicao';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('nome_instituicao').AsString := NomeInstituicao;
    Query.ParamByName('cnpj').AsString := Cnpj;
    Query.ParamByName('responsavel').AsString := Responsavel;
    Query.ParamByName('CodigoUsuario').AsString := IntToStr(CodigoUsuario);
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
//Procedure to insert items into the database
procedure InsertItem(const DescricaoItem, Unidade, DataValidade: string);
var
  SQLInsert: string;
  Query: TFDQuery;
begin
  SQLInsert :=
    'INSERT INTO item (descricao_item, unidade, data_validade, codigo_usuario) ' +
    'VALUES (:descricao_item, :unidade, :data_validade, :CodigoUsuario)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('descricao_item').AsString := DescricaoItem;
    Query.ParamByName('unidade').AsString := Unidade;
    Query.ParamByName('data_validade').AsString := DataValidade;
    Query.ParamByName('CodigoUsuario').AsString := IntToStr(CodigoUsuario);

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
//Procedure to edit items in the database
procedure UpdateItem(CodigoItem: Integer; const DescricaoItem, Unidade, DataValidade: string);
var
  SQLUpdate: string;
  Query: TFDQuery;
begin
  SQLUpdate :=
    'UPDATE item ' +
    'SET descricao_item = :descricao_item, ' +
    '    unidade = :unidade, ' +
    '    data_validade = :data_validade, ' +
    '    codigo_usuario = :CodigoUsuario ' +
    'WHERE codigo_item = :codigo_item';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('descricao_item').AsString := DescricaoItem;
    Query.ParamByName('unidade').AsString := Unidade;
    Query.ParamByName('data_validade').AsString := DataValidade;
    Query.ParamByName('CodigoUsuario').AsString := IntToStr(CodigoUsuario);
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
//Procedure to insert item types into the database
procedure InsertTipoItem(const DescricaoTipoItem: String);
var
  SQLInsert: string;
  Query: TFDQuery;
begin
  SQLInsert :=
    'INSERT INTO tipoitem (descricao_tipo_item, codigo_usuario) ' +
    'VALUES (:descricao_tipo_item, :CodigoUsuario)';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLInsert;

    Query.ParamByName('descricao_tipo_item').AsString := DescricaoTipoItem;
    Query.ParamByName('CodigoUsuario').AsString := IntToStr(CodigoUsuario);

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
//Procedure to edit item types in the database
procedure UpdateTipoItem(CodigoTipoItem: Integer; const DescricaoTipoItem: String);
var
  SQLUpdate: string;
  Query: TFDQuery;
begin
  SQLUpdate :=
    'UPDATE tipoitem ' +
    'SET descricao_tipo_item = :descricao_tipo_item, ' +
    'SET codigo_usuario = :CodigoUsuario ' +
    'WHERE codigo_tipo_item = :codigo_tipo_item';

  Query := TFDQuery.Create(nil);
  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := SQLUpdate;

    Query.ParamByName('descricao_tipo_item').AsString := DescricaoTipoItem;
    Query.ParamByName('CodigoUsuario').AsString := IntToStr(CodigoUsuario);
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
