program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit_cadastros in 'Unit_cadastros.pas' {Form3},
  Unit_usuarios in 'Unit_usuarios.pas' {Form4},
  Unit_cidades in 'Unit_cidades.pas' {Form5},
  Unit_estados in 'Unit_estados.pas' {Form6},
  Unit_instituicoes in 'Unit_instituicoes.pas' {Form7},
  Unit_itens in 'Unit_itens.pas' {Form8},
  Unit_tipos_de_itens in 'Unit_tipos_de_itens.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
