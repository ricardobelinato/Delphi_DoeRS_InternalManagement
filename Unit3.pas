unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    DBGrid1: TDBGrid;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Usurios1: TMenuItem;
    Cidades1: TMenuItem;
    Estados1: TMenuItem;
    Instituies2: TMenuItem;
    Itens3: TMenuItem;
    iposdeItens1: TMenuItem;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

end.
