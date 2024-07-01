unit Unit_estado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Param, FireDAC.Comp.Client, System.UITypes;

type
  TForm_estado = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
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
  Form_estado: TForm_estado;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_manipular_estado;

procedure TForm_estado.Btn_adicionarClick(Sender: TObject);
begin
  Form_manipular_estado.Tag := 0; // Modo de inserção
  Form_manipular_estado.ShowModal;
end;

procedure TForm_estado.Btn_editarClick(Sender: TObject);
begin
  Form_manipular_estado.Tag := 1; // Modo de edição
  Form_manipular_estado.ShowModal;
end;

procedure TForm_estado.Btn_excluirClick(Sender: TObject);
var
  Query: TFDQuery;
  EstadoID: Integer;
begin
  EstadoID := Unit_data_module.DataModule3.FDQuery_Estados.FieldByName('codigo_estado').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir este estado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Unit_data_module.DataModule3.FD_Connection;
      Query.SQL.Text := 'DELETE FROM estado WHERE codigo_estado = :codigo_estado';
      Query.ParamByName('codigo_estado').AsInteger := EstadoID;

      Query.ExecSQL;

      Unit_data_module.DataModule3.FDQuery_Estados.Close;
      Unit_data_module.DataModule3.FDQuery_Estados.Open;

      ShowMessage('Estado deletado com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao deletar estado: ' + E.Message);
    end;

    Query.Free;
  end;
end;

end.
