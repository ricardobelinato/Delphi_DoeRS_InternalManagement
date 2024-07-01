unit Unit_tipo_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Param, FireDAC.Comp.Client, System.UITypes;

type
  TForm_tipoitem = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    Btn_adicionar: TButton;
    Btn_editar: TButton;
    Btn_excluir: TButton;
    procedure Btn_adicionarClick(Sender: TObject);
    procedure Btn_editarClick(Sender: TObject);
    procedure Btn_excluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_tipoitem: TForm_tipoitem;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_manipular_tipo_item;

procedure TForm_tipoitem.Btn_adicionarClick(Sender: TObject);
begin
  Form_manipular_tipo_item.Tag := 0; // Modo de inserção
  Form_manipular_tipo_item.ShowModal;
end;

procedure TForm_tipoitem.Btn_editarClick(Sender: TObject);
begin
  Form_manipular_tipo_item.Tag := 1; // Modo de edição
  Form_manipular_tipo_item.ShowModal;
end;

procedure TForm_tipoitem.Btn_excluirClick(Sender: TObject);
var
  Query: TFDQuery;
  TipoItemID: Integer;
begin
  TipoItemID := Unit_data_module.DataModule3.FDQuery_Tipo_Item.FieldByName('codigo_tipo_item').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir este tipo de item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Unit_data_module.DataModule3.FD_Connection;
      Query.SQL.Text := 'DELETE FROM tipoitem WHERE codigo_tipo_item = :codigo_tipo_item';
      Query.ParamByName('codigo_tipo_item').AsInteger := TipoItemID;

      Query.ExecSQL;

      Unit_data_module.DataModule3.FDQuery_Tipo_Item.Close;
      Unit_data_module.DataModule3.FDQuery_Tipo_Item.Open;

      ShowMessage('Tipo de Item deletado com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao deletar tipo de item: ' + E.Message);
    end;

    Query.Free;
  end;
end;

end.
