unit Unit_functions;

interface

uses
Vcl.StdCtrls, System.SysUtils, System.Classes, FireDAC.Comp.Client, FireDAC.Stan.Param, Vcl.Dialogs,
Vcl.Forms, Unit_data_module, Unit_cadastro;

procedure HandleEditCPFKeyPress(Sender: TObject; var Key: Char);
function RemoverFormatacaoCPF(const CPF: string): string;
function ValidarCamposLogin(Form: TForm; LoginEdit, CPFEEdit: TEdit): Boolean;
function GetIndicadorAdministrador: Boolean;

var
  indicadorAdministrador: Boolean;

implementation

//var
//  indicadorAdministrador: Boolean;

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

//Procedure para validar campos do login, se estão vazios ou incorretos e permitir login caso devidamente validados
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
      indicadorAdministrador := Query.FieldByName('indicador_administrador').AsBoolean;
      indicadorAtivo := Query.FieldByName('indicador_usuario_ativo').AsBoolean;

      if indicadorAtivo then
      begin
        Form.Hide;
        Form_cadastro.Show;
        Result := indicadorAdministrador
      end
      else
      begin
        ShowMessage('O usuário não está ativo. Por favor, entre em contato com o suporte.');
      end;
    end
    else
    begin
      ShowMessage('Houve um erro nos campos login e/ou CPF. Por favor, verifique novamente.');
    end;
  finally
    Query.Free;
  end;
end;

function GetIndicadorAdministrador: Boolean;
begin
  Result := indicadorAdministrador;
end;

end.
