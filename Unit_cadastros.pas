unit Unit_cadastros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    MainMenu1: TMainMenu;
    Usurios1: TMenuItem;
    Cidades1: TMenuItem;
    Estados1: TMenuItem;
    Instituies2: TMenuItem;
    Itens3: TMenuItem;
    iposdeItens1: TMenuItem;
    Label2: TLabel;
    FDConnection1: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure Usurios1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Estados1Click(Sender: TObject);
    procedure Instituies2Click(Sender: TObject);
    procedure Itens3Click(Sender: TObject);
    procedure iposdeItens1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  ShowMenu: Boolean;

implementation

{$R *.dfm}
uses Unit1, Unit_usuarios, Unit_cidades, Unit_estados, Unit_instituicoes, Unit_itens, Unit_tipos_de_itens;

procedure TForm3.Cidades1Click(Sender: TObject);
begin
  Form5.Show; //form cidades
end;

procedure TForm3.Estados1Click(Sender: TObject);
begin
  Form6.Show; //form estados
end;

//procedure TForm3.FormCreate(Sender: TObject);
//var
//  Query: TFDQuery;
//begin
//  Query := TFDQuery.Create(nil);
//  try
//    Query.Connection := FDConnection1;
//    Query.SQL.Text := 'SELECT indicador_administrador FROM usuario WHERE login = :Login';
//    Query.Params.ParamByName('Login').AsString := NomeUsuarioLogado;
//
//    Query.Open;
//    if not Query.IsEmpty then
//    begin
//      ShowMenu := Query.FieldByName('indicador_administrador').AsBoolean;
//    end
//    else
//    begin
//      // Se não encontrar o usuário, ShowMenu = False
//      ShowMenu := False;
//    end;
//  finally
//    Query.Free;
//  end;
//
//  // Mostra ou oculta o menu com base na permissão do usuário
//  if ShowMenu then
//    Self.Menu := MainMenu1
//  else
//    Self.Menu := nil;
//end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  ShowMenu := True;

  if ShowMenu then
    Menu := MainMenu1
  else
    Menu := nil;
end;

procedure TForm3.Instituies2Click(Sender: TObject);
begin
  Form7.Show; //form instituições
end;

procedure TForm3.iposdeItens1Click(Sender: TObject);
begin
  Form9.Show; //form Tipos de Itens
end;

procedure TForm3.Itens3Click(Sender: TObject);
begin
  Form8.Show; //form Itens
end;

procedure TForm3.Usurios1Click(Sender: TObject);
begin
  Form4.Show; //form usuários
end;

end.
