program Doe_RS_Sistema_Interno;

uses
  Vcl.Forms,
  Unit_login in 'Unit_login.pas' {Form_Login},
  Unit_cadastro in 'Unit_cadastro.pas' {Form_cadastro},
  Unit_usuario in 'Unit_usuario.pas' {Form_usuarios},
  Unit_cidade in 'Unit_cidade.pas' {Form_cidade},
  Unit_estado in 'Unit_estado.pas' {Form_estado},
  Unit_instituicoes in 'Unit_instituicoes.pas' {Form_instituicao},
  Unit_item in 'Unit_item.pas' {Form_item},
  Unit_tipo_item in 'Unit_tipo_item.pas' {Form_tipoitem},
  Unit_data_module in 'Unit_data_module.pas' {DataModule3: TDataModule},
  Unit_manipular_usuario in 'Unit_manipular_usuario.pas' {Form_manipular_usuario},
  Unit_manipular_cidade in 'Unit_manipular_cidade.pas' {Form_manipular_cidade},
  Unit_manipular_estado in 'Unit_manipular_estado.pas' {Form2},
  Unit_manipular_instituicoes in 'Unit_manipular_instituicoes.pas' {Form3},
  Unit_manipular_item in 'Unit_manipular_item.pas' {Form4},
  Unit_manipular_tipo_item in 'Unit_manipular_tipo_item.pas' {Form5};

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
  Application.CreateForm(TForm_manipular_usuario, Form_manipular_usuario);
  Application.CreateForm(TForm_manipular_cidade, Form_manipular_cidade);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
