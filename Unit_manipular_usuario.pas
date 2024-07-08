unit Unit_manipular_usuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, Vcl.Mask, Vcl.DBCtrls, FireDAC.Stan.Param;

type
  TForm_manipular_usuario = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lblLogin: TLabel;
    lblNome: TLabel;
    lblCpf: TLabel;
    btnSalvar: TButton;
    edtNomeUsuario: TEdit;
    edtCpf: TEdit;
    edtLogin: TEdit;
    chkAdm: TCheckBox;
    chkAtivo: TCheckBox;
    edtCodigoUsuario: TEdit;
    lblCodigoUsuario: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_manipular_usuario: TForm_manipular_usuario;

implementation

{$R *.dfm}

uses Unit_data_module, unit_functions;

//Procedure que trata de labels e campos edit de acordo com o modo de inserção ou edição, mexendo com a visibilidade de componentes, deixando-os disabled, limpando campos ou dando valores a eles
//Procedure that deals with labels and edit fields according to the insertion or editing mode, changing the visibility of components, leaving them disabled, clearing fields or giving them values
procedure TForm_manipular_usuario.FormShow(Sender: TObject);
begin
  edtCodigoUsuario.Enabled := False;

  if Tag = 0 then
  begin
    //Modo de inserção
    //Insertion mode
    edtCodigoUsuario.Visible := False;
    lblCodigoUsuario.Visible := False;

    edtNomeUsuario.Text := '';
    edtCpf.Text := '';
    edtLogin.Text := '';
    chkAdm.Checked := False;
    chkAtivo.Checked := False;
  end
  else
  begin
    //Modo de edição
    //Editing mode
    with Unit_data_module.DataModule3.FDQuery_Usuarios do
    begin
      edtCodigoUsuario.Visible := True;
      lblCodigoUsuario.Visible := True;

      edtCodigoUsuario.Text := FieldByName('codigo_usuario').AsString;
      edtNomeUsuario.Text := FieldByName('nome_completo').AsString;
      edtCpf.Text := FieldByName('cpf').AsString;
      edtLogin.Text := FieldByName('login').AsString;
      chkAdm.Checked := FieldByName('indicador_administrador').AsBoolean;
      chkAtivo.Checked := FieldByName('indicador_usuario_ativo').AsBoolean;
    end;
  end;
end;

//Procedure do evento de clique no botão salvar que executa um insert ou update dependendo do modo selecionado, essa procedure também valida se os campos obrigatórios não estão vazios, caso estejam é barrado de prosseguir
//Procedure of the click event on the save button that performs an insert or update depending on the selected mode, this procedure also validates that the mandatory fields are not empty, if they are, it is blocked from proceeding
procedure TForm_manipular_usuario.btnSalvarClick(Sender: TObject);
begin
  if (edtNomeUsuario.Text='') or (edtCpf.Text='') or (edtLogin.Text='') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher algum(s) campo(s) obrigatório(s).');
    Exit;
  end;

  if Tag = 0 then
  begin
    InsertUser(edtNomeUsuario.Text, edtCpf.Text, edtLogin.Text, chkAdm.Checked, chkAtivo.Checked);
  end
  else
  begin
    UpdateUser(StrToInt(edtCodigoUsuario.Text), EdtNomeUsuario.Text, edtCpf.Text, edtLogin.Text, chkAdm.Checked, chkAtivo.Checked);
  end;
end;

end.
