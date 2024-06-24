unit Unit_usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm_usuarios = class(TForm)
    DBGrid_usuario: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    btnAdicionar: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_usuarios: TForm_usuarios;

implementation

{$R *.dfm}
uses Unit_data_module, Unit_manipular_usuario;

procedure TForm_usuarios.btnAdicionarClick(Sender: TObject);
begin
//  Unit_manipular_usuario.Form_manipular_usuario.EditNome.DataSource := nil;
//  Unit_manipular_usuario.Form_manipular_usuario.EditCPF.DataSource := nil;
//  Unit_manipular_usuario.Form_manipular_usuario.EditLogin.DataSource := nil;
//  Unit_manipular_usuario.Form_manipular_usuario.CheckboxAdm.DataSource := nil;
//  Unit_manipular_usuario.Form_manipular_usuario.CheckboxAtivo.DataSource := nil;

  Unit_manipular_usuario.Form_manipular_usuario.EditNome.Text := '';
  Unit_manipular_usuario.Form_manipular_usuario.EditCPF.Text := '';
  Unit_manipular_usuario.Form_manipular_usuario.EditLogin.Text := '';
  Unit_manipular_usuario.Form_manipular_usuario.CheckboxAdm.Checked := False;
  Unit_manipular_usuario.Form_manipular_usuario.CheckboxAtivo.Checked := False;

  Unit_manipular_usuario.Form_manipular_usuario.Tag := 0;

  Form_manipular_usuario.ShowModal;
end;

procedure TForm_usuarios.btnEditarClick(Sender: TObject);
begin
  with Unit_data_module.DataModule3.FDQuery_Usuarios do
  begin
    Unit_manipular_usuario.Form_manipular_usuario.EditNome.Text := FieldByName('nome_completo').AsString;
    Unit_manipular_usuario.Form_manipular_usuario.EditCPF.Text := FieldByName('cpf').AsString;
    Unit_manipular_usuario.Form_manipular_usuario.EditLogin.Text := FieldByName('login').AsString;
    Unit_manipular_usuario.Form_manipular_usuario.CheckboxAdm.Checked := FieldByName('indicador_administrador').AsBoolean;
    Unit_manipular_usuario.Form_manipular_usuario.CheckboxAtivo.Checked := FieldByName('indicador_usuario_ativo').AsBoolean;

    Unit_manipular_usuario.Form_manipular_usuario.Tag := FieldByName('codigo_usuario').AsInteger;
  end;

  Form_manipular_usuario.ShowModal;
end;

procedure TForm_usuarios.btnExcluirClick(Sender: TObject);
var
  Query: TFDQuery;
  UsuarioID: Integer;
begin
  UsuarioID := Unit_data_module.DataModule3.FDQuery_Usuarios.FieldByName('codigo_usuario').AsInteger;

  if MessageDlg('Você tem certeza que deseja excluir este usuário?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := Unit_data_module.DataModule3.FD_Connection;
      Query.SQL.Text := 'DELETE FROM usuario WHERE codigo_usuario = :codigo_usuario';
      Query.ParamByName('codigo_usuario').AsInteger := UsuarioID;

      Query.ExecSQL;

      Unit_data_module.DataModule3.FDQuery_Usuarios.Close;
      Unit_data_module.DataModule3.FDQuery_Usuarios.Open;

      ShowMessage('Usuário deletado com sucesso!');
    except
      on E: Exception do
        ShowMessage('Erro ao deletar usuário: ' + E.Message);
    end;

    Query.Free;
  end;
end;

end.
