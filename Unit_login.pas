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
  Vcl.ExtCtrls, Vcl.Mask;

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
    procedure TEditCPFKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Login: TForm_Login;
  NomeUsuarioLogado: String;

implementation

{$R *.dfm}

uses Unit_cadastro, Unit_data_module, Unit_mascaras;

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

  LOGIN := TEditLogin.Text;
  CPF := RemoverFormatacaoCPF(TEditCPF.Text);

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
      Form_cadastro.Show
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

procedure TForm_Login.TEditCPFKeyPress(Sender: TObject; var Key: Char);
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

end.
