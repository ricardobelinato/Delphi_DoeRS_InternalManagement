unit Unit_item;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm_item = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
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
  Form_item: TForm_item;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_manipular_item;

procedure TForm_item.Btn_adicionarClick(Sender: TObject);
begin
  Form_manipular_item.Tag := 0; // Modo de inserção
  Form_manipular_item.ShowModal;
end;

procedure TForm_item.Btn_editarClick(Sender: TObject);
begin
  Form_manipular_item.Tag := 1; // Modo de edição
  Form_manipular_item.ShowModal;
end;

procedure TForm_item.Btn_excluirClick(Sender: TObject);
var
  Query: TFDQuery;
  ItemID: Integer;
begin
  ItemID := Unit_data_module.DataModule3.FDQuery_Itens.FieldByName('codigo_item').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir este item?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Unit_data_module.DataModule3.FD_Connection;
      Query.SQL.Text := 'DELETE FROM item WHERE codigo_item = :codigo_item';
      Query.ParamByName('codigo_item').AsInteger := ItemID;

      Query.ExecSQL;

      Unit_data_module.DataModule3.FDQuery_Itens.Close;
      Unit_data_module.DataModule3.FDQuery_Itens.Open;

      ShowMessage('Item deletado com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao deletar item: ' + E.Message);
    end;

    Query.Free;
  end;
end;

end.
