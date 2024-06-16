program Doe_RS_Sistema_Interno;

uses
  Vcl.Forms,
  Unit_login in 'Unit_login.pas' {Form1},
  Unit_cadastros in 'Unit_cadastros.pas' {Form3},
  Unit_usuarios in 'Unit_usuarios.pas' {Usuários},
  Unit_cidades in 'Unit_cidades.pas' {Cidades},
  Unit_estados in 'Unit_estados.pas' {Estados},
  Unit_instituicoes in 'Unit_instituicoes.pas' {Form7},
  Unit_itens in 'Unit_itens.pas' {Itens},
  Unit_tipos_de_itens in 'Unit_tipos_de_itens.pas' {Tipoitem},
  Unit_data_module in 'Unit_data_module.pas' {DataModule3: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TUsuários, Usuários);
  Application.CreateForm(TCidades, Cidades);
  Application.CreateForm(TEstados, Estados);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TItens, Itens);
  Application.CreateForm(TTipoitem, Tipoitem);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.Run;
end.
