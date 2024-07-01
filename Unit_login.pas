unit Unit_login;

interface

uses
  Vcl.Forms, Vcl.Grids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Controls,
  System.Classes;

type
  TForm_Login = class(TForm)
    edtLogin: TEdit;
    edtCpf: TEdit;
    lblSubtitulo: TLabel;
    lblTitulo: TLabel;
    pnlBotao: TPanel;
    sbtnEntrar: TSpeedButton;
    lblLogin: TLabel;
    lblCpf: TLabel;
    procedure sbtnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TEditCPFKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Login: TForm_Login;
  NomeUsuarioLogado: String;

implementation

{$R *.dfm}
uses Unit_cadastro, Unit_data_module, Unit_functions;

//Procedures necessárias para o evento OnCreate, para inicializar uma outra procedure de formatação do campo CPF assim que o form é gerado
//Procedures necessary for the OnCreate event, to initialize another procedure for formatting the CPF field as soon as the form is generated
procedure TForm_Login.FormCreate(Sender: TObject);
begin
  edtCpf.OnKeyPress := TEditCPFKeyPress;
end;

procedure TForm_Login.TEditCPFKeyPress(Sender: TObject; var Key: Char);
begin
  Unit_functions.HandleEditCPFKeyPress(Sender, Key);
end;

//Procedure do evento OnClick do SpeedButton para validação do login
//Procedure of the SpeedButton's OnClick event to validate the login
procedure TForm_Login.sbtnEntrarClick(Sender: TObject);
begin
  Unit_functions.ValidarCamposLogin(Self, edtLogin, edtCpf);
end;

end.
