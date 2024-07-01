unit Unit_manipular_tipo_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm_manipular_tipo_item = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Btn_salvar: TButton;
    Label1: TLabel;
    Edit_descricao_tipo_item: TEdit;
    Label_codigo_tipo_item: TLabel;
    Edit_codigo_tipo_item: TEdit;
    Label_codigo_usuario: TLabel;
    Edit_codigo_usuario: TEdit;
    procedure Btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure InsertTipoItem;
    procedure UpdateTipoItem;
  public
    { Public declarations }
  end;

var
  Form_manipular_tipo_item: TForm_manipular_tipo_item;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_tipo_item;

procedure TForm_manipular_tipo_item.Btn_salvarClick(Sender: TObject);
begin

  if (Edit_descricao_tipo_item.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher o campo obrigatório.');
    Exit;
  end;

  if Tag = 0 then
    InsertTipoItem
  else
    UpdateTipoItem;
end;

procedure TForm_manipular_tipo_item.FormShow(Sender: TObject);
begin
  Edit_codigo_tipo_item.ReadOnly := True;
  Edit_codigo_usuario.ReadOnly := True;

  Edit_codigo_tipo_item.Enabled := False;
  Edit_codigo_usuario.Enabled := False;
  if Tag = 0 then
  begin
    // Modo de inserção
    Edit_codigo_tipo_item.Visible := False;
    Edit_codigo_usuario.Visible := False;

    Label_codigo_tipo_item.Visible := False;
    Label_codigo_usuario.Visible := False;

    Edit_descricao_tipo_item.Text := '';
  end
  else
  begin
    // Modo de edição
    with Unit_data_module.DataModule3.FDQuery_Tipo_Item do
    begin
      Edit_codigo_tipo_item.Visible := True;
      Edit_codigo_usuario.Visible := True;

      Label_codigo_tipo_item.Visible := True;
      Label_codigo_usuario.Visible := True;

      Edit_descricao_tipo_item.Text := FieldByName('descricao_tipo_item').AsString;

      Edit_codigo_tipo_item.Text := FieldByName('codigo_tipo_item').AsString;
      Edit_codigo_usuario.Text := FieldByName('codigo_usuario').AsString;
    end;
  end;
end;

procedure TForm_manipular_tipo_item.InsertTipoItem;
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

    Query.ParamByName('descricao_tipo_item').AsString := Edit_descricao_tipo_item.Text;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Tipo_Item.Close;
    Unit_data_module.DataModule3.FDQuery_Tipo_Item.Open;
    ShowMessage('Tipo do Item adicionado com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar tipo do item: ' + E.Message);
  end;

  Query.Free;
end;

procedure TForm_manipular_tipo_item.UpdateTipoItem;
var
  SQLUpdate: string;
  Query: TFDQuery;
  CodigoTipoItem: Integer;
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

    Query.ParamByName('descricao_tipo_item').AsString := Edit_descricao_tipo_item.Text;
    Query.ParamByName('codigo_tipo_item').AsInteger := CodigoTipoItem;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Tipo_Item.Close;
    Unit_data_module.DataModule3.FDQuery_Tipo_Item.Open;
    ShowMessage('Tipo do Item atualizado com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar tipo do item: ' + E.Message);
  end;

  Query.Free;
end;

end.
