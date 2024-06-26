unit Unit_manipular_cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm_manipular_cidade = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Btn_salvar: TButton;
    Label1: TLabel;
    Edit_nome_cidade: TEdit;
    Edit_populacao: TEdit;
    Label2: TLabel;
    Label_codigo_cidade: TLabel;
    Edit_codigo_cidade: TEdit;
    Label_codigo_estado: TLabel;
    Label_codigo_usuario: TLabel;
    Edit_codigo_estado: TEdit;
    Edit_codigo_usuario: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure InsertCidade;
    procedure UpdateCidade;
  public
    { Public declarations }
  end;

var
  Form_manipular_cidade: TForm_manipular_cidade;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_cidade;

procedure TForm_manipular_cidade.Btn_salvarClick(Sender: TObject);
begin

  if (Edit_nome_cidade.Text='') or (Edit_populacao.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher algum(s) campo(s) obrigatório(s).');
    Exit;
  end;

  if Tag = 0 then
    InsertCidade
  else
    UpdateCidade;
end;

procedure TForm_manipular_cidade.FormShow(Sender: TObject);
begin
  if Tag = 0 then
  begin
    // Modo de inserção
    Edit_codigo_cidade.Visible := False;
    Edit_codigo_estado.Visible := False;
    Edit_codigo_usuario.Visible := False;

    Edit_codigo_cidade.ReadOnly := True;
    Edit_codigo_estado.ReadOnly := True;
    Edit_codigo_usuario.ReadOnly := True;

    Label_codigo_cidade.Visible := False;
    Label_codigo_estado.Visible := False;
    Label_codigo_usuario.Visible := False;

    Edit_codigo_cidade.Enabled := False;
    Edit_codigo_estado.Enabled := False;
    Edit_codigo_usuario.Enabled := False;

    Edit_nome_cidade.Text := '';
    Edit_populacao.Text := '';
  end
  else
  begin
    // Modo de edição
    with Unit_data_module.DataModule3.FDQuery_Cidades do
    begin
      Edit_codigo_cidade.Visible := True;
      Edit_codigo_estado.Visible := True;
      Edit_codigo_usuario.Visible := True;

      Edit_codigo_cidade.ReadOnly := True;
      Edit_codigo_estado.ReadOnly := True;
      Edit_codigo_usuario.ReadOnly := True;

      Label_codigo_cidade.Visible := True;
      Label_codigo_estado.Visible := True;
      Label_codigo_usuario.Visible := True;

      Edit_codigo_cidade.Enabled := False;
      Edit_codigo_estado.Enabled := False;
      Edit_codigo_usuario.Enabled := False;

      Edit_nome_cidade.Text := FieldByName('nome_cidade').AsString;
      Edit_populacao.Text := FieldByName('populacao').AsString;

      Edit_codigo_cidade.Text := FieldByName('codigo_cidade').AsString;
      Edit_codigo_estado.Text := FieldByName('codigo_estado').AsString;
      Edit_codigo_usuario.Text := FieldByName('codigo_usuario').AsString;
    end;
  end;
end;

procedure TForm_manipular_cidade.InsertCidade;
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

    Query.ParamByName('nome_cidade').AsString := Edit_nome_cidade.Text;
    Query.ParamByName('populacao').AsString := Edit_populacao.Text;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Cidades.Close;
    Unit_data_module.DataModule3.FDQuery_Cidades.Open;
    ShowMessage('Cidade adicionada com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar cidade: ' + E.Message);
  end;

  Query.Free;
end;

procedure TForm_manipular_cidade.UpdateCidade;
var
  SQLUpdate: string;
  Query: TFDQuery;
  CodigoCidade: Integer;
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

    Query.ParamByName('nome_cidade').AsString := Edit_nome_cidade.Text;
    Query.ParamByName('populacao').AsString := Edit_populacao.Text;
    Query.ParamByName('codigo_cidade').AsInteger := CodigoCidade;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Cidades.Close;
    Unit_data_module.DataModule3.FDQuery_Cidades.Open;
    ShowMessage('Cidade atualizada com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar cidade: ' + E.Message);
  end;

  Query.Free;
end;

end.
