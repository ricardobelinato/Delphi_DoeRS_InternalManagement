unit Unit_manipular_estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm_manipular_estado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Btn_salvar: TButton;
    ComboBox_sigla_estado: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit_estado: TEdit;
    Label_codigo_estado: TLabel;
    Edit_codigo_estado: TEdit;
    Label_codigo_usuario: TLabel;
    Edit_codigo_usuario: TEdit;
    procedure ComboBox_sigla_estadoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Btn_salvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure InsertEstado;
    procedure UpdateEstado;
  public
    { Public declarations }
  end;

var
  Form_manipular_estado: TForm_manipular_estado;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_estado;

procedure TForm_manipular_estado.Btn_salvarClick(Sender: TObject);
begin

  if (ComboBox_sigla_estado.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher o campo obrigatório.');
    Exit;
  end;

  if Tag = 0 then
    InsertEstado
  else
    UpdateEstado;
end;

procedure TForm_manipular_estado.ComboBox_sigla_estadoChange(Sender: TObject);
begin
  if ComboBox_sigla_estado.ItemIndex <> -1 then
  begin
    case ComboBox_sigla_estado.ItemIndex of
      0: Edit_estado.Text := 'Acre';
      1: Edit_estado.Text := 'Alagoas';
      2: Edit_estado.Text := 'Amapá';
      3: Edit_estado.Text := 'Amazonas';
      4: Edit_estado.Text := 'Bahia';
      5: Edit_estado.Text := 'Ceará';
      6: Edit_estado.Text := 'Distrito Federal';
      7: Edit_estado.Text := 'Espírito Santo';
      8: Edit_estado.Text := 'Goiás';
      9: Edit_estado.Text := 'Maranhão';
      10: Edit_estado.Text := 'Mato Grosso';
      11: Edit_estado.Text := 'Mato Grosso do Sul';
      12: Edit_estado.Text := 'Minas Gerais';
      13: Edit_estado.Text := 'Pará';
      14: Edit_estado.Text := 'Paraíba';
      15: Edit_estado.Text := 'Paraná';
      16: Edit_estado.Text := 'Pernambuco';
      17: Edit_estado.Text := 'Piauí';
      18: Edit_estado.Text := 'Rio de Janeiro';
      19: Edit_estado.Text := 'Rio Grande do Norte';
      20: Edit_estado.Text := 'Rio Grande do Sul';
      21: Edit_estado.Text := 'Rondônia';
      22: Edit_estado.Text := 'Roraima';
      23: Edit_estado.Text := 'Santa Catarina';
      24: Edit_estado.Text := 'São Paulo';
      25: Edit_estado.Text := 'Sergipe';
      26: Edit_estado.Text := 'Tocantins';
    end;
  end;
end;

procedure TForm_manipular_estado.FormShow(Sender: TObject);
begin
  if Tag = 0 then
  begin
    // Modo de inserção
    Edit_codigo_estado.Visible := False;
    Edit_codigo_usuario.Visible := False;

    Edit_codigo_estado.ReadOnly := True;
    Edit_codigo_usuario.ReadOnly := True;

    Label_codigo_estado.Visible := False;
    Label_codigo_usuario.Visible := False;

    Edit_codigo_estado.Enabled := False;
    Edit_codigo_usuario.Enabled := False;

    ComboBox_sigla_estado.Text := '';
    Edit_estado.Text := '';
  end
  else
  begin
    // Modo de edição
    with Unit_data_module.DataModule3.FDQuery_Estados do
    begin
      Edit_codigo_estado.Visible := True;
      Edit_codigo_usuario.Visible := True;

      Edit_codigo_estado.ReadOnly := True;
      Edit_codigo_usuario.ReadOnly := True;

      Label_codigo_estado.Visible := True;
      Label_codigo_usuario.Visible := True;

      Edit_codigo_estado.Enabled := False;
      Edit_codigo_usuario.Enabled := False;

      ComboBox_sigla_estado.Text := FieldByName('sigla').AsString;
      Edit_estado.Text := FieldByName('nome_estado').AsString;
      Edit_codigo_estado.Text := FieldByName('codigo_estado').AsString;
      Edit_codigo_usuario.Text := FieldByName('codigo_usuario').AsString;
    end;
  end;
end;

procedure TForm_manipular_estado.InsertEstado;
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

    Query.ParamByName('nome_estado').AsString := Edit_estado.Text;
    Query.ParamByName('sigla').AsString := ComboBox_sigla_estado.Text;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Estados.Close;
    Unit_data_module.DataModule3.FDQuery_Estados.Open;
    ShowMessage('Estado adicionado com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar estado: ' + E.Message);
  end;

  Query.Free;
end;

procedure TForm_manipular_estado.UpdateEstado;
var
  SQLUpdate: string;
  Query: TFDQuery;
  CodigoEstado: Integer;
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

    Query.ParamByName('nome_estado').AsString := Edit_estado.Text;
    Query.ParamByName('sigla').AsString := ComboBox_sigla_estado.Text;
    Query.ParamByName('codigo_estado').AsInteger := CodigoEstado;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Estados.Close;
    Unit_data_module.DataModule3.FDQuery_Estados.Open;
    ShowMessage('Estado atualizado com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar estado: ' + E.Message);
  end;

  Query.Free;
end;

end.
