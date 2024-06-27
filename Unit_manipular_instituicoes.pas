unit Unit_manipular_instituicoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm_manipular_instituicao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Btn_salvar: TButton;
    Edit_nome_instituicao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit_cnpj: TMaskEdit;
    Label3: TLabel;
    Edit_responsavel: TEdit;
    Label_codigo_instituicao: TLabel;
    Edit_codigo_instituicao: TEdit;
    Label_codigo_cidade: TLabel;
    Label_codigo_usuario: TLabel;
    Edit_codigo_cidade: TEdit;
    Edit_codigo_usuario: TEdit;
    procedure Btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure InsertInstituicao;
    procedure UpdateInstituicao;
  public
    { Public declarations }
  end;

var
  Form_manipular_instituicao: TForm_manipular_instituicao;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_instituicoes;

procedure TForm_manipular_instituicao.Btn_salvarClick(Sender: TObject);
begin

  if (Edit_nome_instituicao.Text='') or (MaskEdit_cnpj.Text='') or (Edit_responsavel.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher algum(s) campo(s) obrigatório(s).');
    Exit;
  end;

  if Tag = 0 then
    InsertInstituicao
  else
    UpdateInstituicao;
end;

procedure TForm_manipular_instituicao.FormShow(Sender: TObject);
begin
  Edit_codigo_instituicao.ReadOnly := True;
  Edit_codigo_cidade.ReadOnly := True;
  Edit_codigo_usuario.ReadOnly := True;

  Edit_codigo_instituicao.Enabled := False;
  Edit_codigo_cidade.Enabled := False;
  Edit_codigo_usuario.Enabled := False;

  if Tag = 0 then
  begin
    // Modo de inserção
    Edit_codigo_instituicao.Visible := False;
    Edit_codigo_cidade.Visible := False;
    Edit_codigo_usuario.Visible := False;

    Label_codigo_instituicao.Visible := False;
    Label_codigo_cidade.Visible := False;
    Label_codigo_usuario.Visible := False;

    Edit_nome_instituicao.Text := '';
    MaskEdit_cnpj.Text := '';
    Edit_responsavel.Text := '';

  end
  else
  begin
    // Modo de edição
    with Unit_data_module.DataModule3.FDQuery_Instituicoes do
    begin
      Edit_codigo_instituicao.Visible := True;
      Edit_codigo_cidade.Visible := True;
      Edit_codigo_usuario.Visible := True;

      Label_codigo_instituicao.Visible := True;
      Label_codigo_cidade.Visible := True;
      Label_codigo_usuario.Visible := True;

      Edit_nome_instituicao.Text := FieldByName('nome_instituicao').AsString;
      MaskEdit_cnpj.Text := FieldByName('cnpj').AsString;
      Edit_responsavel.Text := FieldByName('responsavel').AsString;
      Edit_codigo_instituicao.Text := FieldByName('codigo_instituicao').AsString;
      Edit_codigo_cidade.Text := FieldByName('codigo_cidade').AsString;
      Edit_codigo_usuario.Text := FieldByName('codigo_usuario').AsString;
    end;
  end;
end;

procedure TForm_manipular_instituicao.InsertInstituicao;
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

    Query.ParamByName('nome_instituicao').AsString := Edit_nome_instituicao.Text;
    Query.ParamByName('cnpj').AsString := MaskEdit_cnpj.Text;
    Query.ParamByName('responsavel').AsString := Edit_responsavel.Text;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Instituicoes.Close;
    Unit_data_module.DataModule3.FDQuery_Instituicoes.Open;
    ShowMessage('Instituição adicionada com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar instituição: ' + E.Message);
  end;

  Query.Free;
end;

procedure TForm_manipular_instituicao.UpdateInstituicao;
var
  SQLUpdate: string;
  Query: TFDQuery;
  CodigoInstituicao: Integer;
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

    Query.ParamByName('nome_instituicao').AsString := Edit_nome_instituicao.Text;
    Query.ParamByName('cnpj').AsString := MaskEdit_cnpj.Text;
    Query.ParamByName('responsavel').AsString := Edit_responsavel.Text;
    Query.ParamByName('codigo_instituicao').AsInteger := CodigoInstituicao;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Instituicoes.Close;
    Unit_data_module.DataModule3.FDQuery_Instituicoes.Open;
    ShowMessage('Instituição atualizada com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar instituição: ' + E.Message);
  end;

  Query.Free;
end;

end.
