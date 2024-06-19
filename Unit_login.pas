unit Unit_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TForm_Login = class(TForm)
    TEditLogin: TEdit;
    TEditCPF: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    procedure SpeedButton1MouseEnter(Sender: TObject);
    procedure SpeedButton1MouseLeave(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    function ValidarCPF(const CPF: string): Boolean;
  public
    { Public declarations }
  end;

var
  Form_Login: TForm_Login;
  NomeUsuarioLogado: String;

implementation

{$R *.dfm}

uses Unit_cadastros, Unit_data_module, Unit_mascaras;

procedure TForm_Login.SpeedButton1Click(Sender: TObject);
var
  Query: TFDQuery;
  LOGIN, CPF: string;
begin

  if TEditLogin.Text=('') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher o campo login.');
    Exit;
  end;

  if TEditCPF.Text=('') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher o campo CPF.');
    Exit;
  end;

//  if not ValidarCPF(CPF) then
//  begin
//    ShowMessage('CPF inválido. Por favor, insira um CPF válido.');
//    Exit;
//  end;

  LOGIN := TEditLogin.Text;
  CPF := TEditCPF.Text;

Query := TFDQuery.Create(nil);

  try
    Query.Connection := Unit_data_module.DataModule3.FD_Connection;
    Query.SQL.Text := 'SELECT COUNT(*) FROM usuario WHERE login = :LOGIN AND cpf = :CPF';
    Query.Params.ParamByName('LOGIN').AsString := LOGIN;
    Query.Params.ParamByName('CPF').AsString := CPF;
    Query.Open;

    if Query.Fields[0].AsInteger > 0 then
    begin
      Form_login.Hide;
      Form3.Show
    end
    else
    begin
      ShowMessage('Houve um erro nos campos login e/ou CPF. Por favor, verifique novamente.');
    end;
  finally
    Query.Free;
  end;
end;

procedure TForm_Login.SpeedButton1MouseEnter(Sender: TObject);
begin
  Panel1.Color := clMenuHighlight;
end;

procedure TForm_Login.SpeedButton1MouseLeave(Sender: TObject);
begin
  Panel1.Color := clHotLight;
end;

function TForm_Login.ValidarCPF(const CPF: string): Boolean;
var
  I, J, Digito1, Digito2, Soma: Integer;
  s: string;
begin
  s := '';
  for I := 1 to Length(CPF) do
    if CPF[I] in ['0'..'9'] then
      s := s + CPF[I];
  if Length(s) <> 11 then
    Exit(False);
  Soma := 0;
  for I := 1 to 9 do
    Soma := Soma + StrToInt(s[I]) * (11 - I);
  Digito1 := (Soma * 10) mod 11;
  if Digito1 = 10 then
    Digito1 := 0;
  Soma := 0;
  for I := 1 to 10 do
    Soma := Soma + StrToInt(s[I]) * (12 - I);
  Digito2 := (Soma * 10) mod 11;
  if Digito2 = 10 then
    Digito2 := 0;
  Result := (Digito1 = StrToInt(s[10])) and (Digito2 = StrToInt(s[11]));
end;

end.
