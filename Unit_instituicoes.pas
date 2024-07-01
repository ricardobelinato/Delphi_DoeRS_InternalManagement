unit Unit_instituicoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Param, FireDAC.Comp.Client, System.UITypes;

type
  TForm_instituicao = class(TForm)
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
  Form_instituicao: TForm_instituicao;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_manipular_instituicoes;

procedure TForm_instituicao.Btn_adicionarClick(Sender: TObject);
begin
  Form_manipular_instituicao.Tag := 0; // Modo de inserção
  Form_manipular_instituicao.ShowModal;
end;

procedure TForm_instituicao.Btn_editarClick(Sender: TObject);
begin
  Form_manipular_instituicao.Tag := 1; // Modo de edição
  Form_manipular_instituicao.ShowModal;
end;

procedure TForm_instituicao.Btn_excluirClick(Sender: TObject);
var
  Query: TFDQuery;
  InstituicaoID: Integer;
begin
  InstituicaoID := Unit_data_module.DataModule3.FDQuery_Instituicoes.FieldByName('codigo_instituicao').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir esta instituição?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Unit_data_module.DataModule3.FD_Connection;
      Query.SQL.Text := 'DELETE FROM instituicao WHERE codigo_instituicao = :codigo_instituicao';
      Query.ParamByName('codigo_instituicao').AsInteger := InstituicaoID;

      Query.ExecSQL;

      Unit_data_module.DataModule3.FDQuery_Instituicoes.Close;
      Unit_data_module.DataModule3.FDQuery_Instituicoes.Open;

      ShowMessage('Instituição deletada com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao deletar instituição: ' + E.Message);
    end;

    Query.Free;
  end;
end;

end.
