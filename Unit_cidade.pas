unit Unit_cidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TForm_cidade = class(TForm)
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
  Form_cidade: TForm_cidade;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_manipular_cidade;

procedure TForm_cidade.Btn_adicionarClick(Sender: TObject);
begin
  Form_manipular_cidade.Tag := 0; // Modo de inserção
  Form_manipular_cidade.ShowModal;
end;

procedure TForm_cidade.Btn_editarClick(Sender: TObject);
begin
  Form_manipular_cidade.Tag := 1; // Modo de edição
  Form_manipular_cidade.ShowModal;
end;

procedure TForm_cidade.Btn_excluirClick(Sender: TObject);
var
  Query: TFDQuery;
  CidadeID: Integer;
begin
  CidadeID := Unit_data_module.DataModule3.FDQuery_Cidades.FieldByName('codigo_cidade').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir esta cidade?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Unit_data_module.DataModule3.FD_Connection;
      Query.SQL.Text := 'DELETE FROM cidade WHERE codigo_cidade = :codigo_cidade';
      Query.ParamByName('codigo_cidade').AsInteger := CidadeID;

      Query.ExecSQL;

      Unit_data_module.DataModule3.FDQuery_Cidades.Close;
      Unit_data_module.DataModule3.FDQuery_Cidades.Open;

      ShowMessage('Cidade deletada com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao deletar cidade: ' + E.Message);
    end;

    Query.Free;
  end;
end;

end.
