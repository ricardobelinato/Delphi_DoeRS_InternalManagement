program Doe_RS_Sistema_Interno;

uses
  Vcl.Forms,
  Unit_login in 'Unit_login.pas' {Form_Login},
  Unit_cadastros in 'Unit_cadastros.pas' {Form_cadastro},
  Unit_usuario in 'Unit_usuario.pas' {Form_usuarios},
  Unit_cidade in 'Unit_cidade.pas' {Form_cidade},
  Unit_estado in 'Unit_estado.pas' {Form_estado},
  Unit_instituicoes in 'Unit_instituicoes.pas' {Form_instituicao},
  Unit_itens in 'Unit_itens.pas' {Form_item},
  Unit_tipos_de_itens in 'Unit_tipos_de_itens.pas' {Form_tipoitem},
  Unit_data_module in 'Unit_data_module.pas' {DataModule3: TDataModule},
  Unit_mascaras in 'Unit_mascaras.pas',
  Usuario_adicionar in 'Usuario_adicionar.pas' {Form_adicionar_usuario},
  Usuario_editar in 'Usuario_editar.pas' {Form_editar_usuario};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule3, DataModule3);
  Application.CreateForm(TForm_Login, Form_Login);
  Application.CreateForm(TForm_cadastro, Form_cadastro);
  Application.CreateForm(TForm_usuarios, Form_usuarios);
  Application.CreateForm(TForm_cidade, Form_cidade);
  Application.CreateForm(TForm_estado, Form_estado);
  Application.CreateForm(TForm_instituicao, Form_instituicao);
  Application.CreateForm(TForm_item, Form_item);
  Application.CreateForm(TForm_tipoitem, Form_tipoitem);
  Application.CreateForm(TForm_adicionar_usuario, Form_adicionar_usuario);
  Application.CreateForm(TForm_editar_usuario, Form_editar_usuario);
  Application.Run;
end.
