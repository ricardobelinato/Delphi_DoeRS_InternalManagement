unit Usuario_editar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, Vcl.StdCtrls;

type
  TForm_editar_usuario = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditNome: TEdit;
    EditCPF: TEdit;
    EditLogin: TEdit;
    CheckboxAdm: TCheckBox;
    CheckboxAtivo: TCheckBox;
    FD_Connection: TFDConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_editar_usuario: TForm_editar_usuario;

implementation

{$R *.dfm}

end.
