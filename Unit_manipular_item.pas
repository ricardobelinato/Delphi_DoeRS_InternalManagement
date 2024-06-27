unit Unit_manipular_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm_manipular_item = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Btn_salvar: TButton;
    Label1: TLabel;
    Edit_descricao_item: TEdit;
    ComboBox_unidade: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit_data_validade: TMaskEdit;
    Label_codigo_item: TLabel;
    Edit_codigo_item: TEdit;
    Label_codigo_tipo_item: TLabel;
    Edit_codigo_tipo_item: TEdit;
    Label_codigo_usuario: TLabel;
    Edit_codigo_usuario: TEdit;
    procedure Btn_salvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure InsertItem;
    procedure UpdateItem;
  public
    { Public declarations }
  end;

var
  Form_manipular_item: TForm_manipular_item;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_item;

procedure TForm_manipular_item.Btn_salvarClick(Sender: TObject);
begin

  if (Edit_descricao_item.Text='') or (ComboBox_unidade.Text='') or (MaskEdit_data_validade.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher algum(s) campo(s) obrigatório(s).');
    Exit;
  end;

  if Tag = 0 then
    InsertItem
  else
    UpdateItem;
end;

procedure TForm_manipular_item.FormShow(Sender: TObject);
begin
  Edit_codigo_item.ReadOnly := True;
  Edit_codigo_tipo_item.ReadOnly := True;
  Edit_codigo_usuario.ReadOnly := True;

  Edit_codigo_item.Enabled := False;
  Edit_codigo_tipo_item.Enabled := False;
  Edit_codigo_usuario.Enabled := False;
  if Tag = 0 then
  begin
    // Modo de inserção
    Edit_codigo_item.Visible := False;
    Edit_codigo_tipo_item.Visible := False;
    Edit_codigo_usuario.Visible := False;

    Label_codigo_item.Visible := False;
    Label_codigo_tipo_item.Visible := False;
    Label_codigo_usuario.Visible := False;

    Edit_descricao_item.Text := '';
    ComboBox_unidade.Text := '';
    MaskEdit_data_validade.Text := '';
  end
  else
  begin
    // Modo de edição
    with Unit_data_module.DataModule3.FDQuery_Itens do
    begin
      Edit_codigo_item.Visible := True;
      Edit_codigo_tipo_item.Visible := True;
      Edit_codigo_usuario.Visible := True;

      Label_codigo_item.Visible := True;
      Label_codigo_tipo_item.Visible := True;
      Label_codigo_usuario.Visible := True;

      Edit_descricao_item.Text := FieldByName('descricao_item').AsString;
      ComboBox_unidade.Text := FieldByName('unidade').AsString;
      MaskEdit_data_validade.Text := FieldByName('data_validade').AsString;

      Edit_codigo_item.Text := FieldByName('codigo_item').AsString;
      Edit_codigo_tipo_item.Text := FieldByName('codigo_tipo_item').AsString;
      Edit_codigo_usuario.Text := FieldByName('codigo_usuario').AsString;
    end;
  end;
end;

procedure TForm_manipular_item.InsertItem;
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

    Query.ParamByName('descricao_item').AsString := Edit_descricao_item.Text;
    Query.ParamByName('unidade').AsString := Combobox_unidade.Text;
    Query.ParamByName('data_validade').AsString := MaskEdit_data_validade.Text;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Itens.Close;
    Unit_data_module.DataModule3.FDQuery_Itens.Open;
    ShowMessage('Item adicionado com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao adicionar item: ' + E.Message);
  end;

  Query.Free;
end;

procedure TForm_manipular_item.UpdateItem;
var
  SQLUpdate: string;
  Query: TFDQuery;
  CodigoItem: Integer;
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

    Query.ParamByName('descricao_item').AsString := Edit_descricao_item.Text;
    Query.ParamByName('unidade').AsString := ComboBox_unidade.Text;
    Query.ParamByName('data_validade').AsString := MaskEdit_data_validade.Text;
    Query.ParamByName('codigo_item').AsInteger := CodigoItem;

    Query.ExecSQL;

    Unit_data_module.DataModule3.FDQuery_Itens.Close;
    Unit_data_module.DataModule3.FDQuery_Itens.Open;
    ShowMessage('Item atualizado com sucesso!');
    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage('Erro ao atualizar item: ' + E.Message);
  end;

  Query.Free;
end;

end.
