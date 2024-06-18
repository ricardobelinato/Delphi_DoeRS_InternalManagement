unit Unit_login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TForm_Login = class(TForm)
    TEditName: TEdit;
    TEditCPF: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    FD_Connection: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    Label3: TLabel;
    Label4: TLabel;
    procedure SpeedButton1MouseEnter(Sender: TObject);
    procedure SpeedButton1MouseLeave(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
//    procedure TEditCPFExit(Sender: TObject);
  private
    { Private declarations }
//    procedure AplicarMascaraCPF(edt: TEdit);
  public
    { Public declarations }
  end;

var
  Form_Login: TForm_Login;
  NomeUsuarioLogado: String;
//  DataModule1: TDataModule1;

implementation

{$R *.dfm}

uses Unit_cadastros, Unit_data_module, Unit_mascaras;




//procedure TForm1.Button1Click(Sender: TObject);
//  var
//    Query: TFDQuery;
//    NomeCompleto, CPF: string;
//  begin
//    NomeCompleto := Edit1.Text;
//    CPF := Edit2.Text;
//
//  Query := TFDQuery.Create(nil);
//
//  try
//    Query.Connection := FDConnection1;
//    Query.SQL.Text := 'SELECT COUNT(*) FROM usuario WHERE nome_completo = :NomeCompleto AND cpf = :CPF';
//    Query.Params.ParamByName('NomeCompleto').AsString := NomeCompleto;
//    Query.Params.ParamByName('CPF').AsString := CPF;
//    Query.Open;
//
//    if Query.Fields[0].AsInteger > 0 then
//    begin
//      Form1.Hide;
//      Form3.Show
//    end
//    else
//    begin
//      ShowMessage('Nome ou CPF incorretos.');
//    end;
//  finally
//    Query.Free;
//  end;
//end;

procedure TForm_Login.SpeedButton1Click(Sender: TObject);
var
  Query: TFDQuery;
  NomeCompleto, CPF: string;
begin

  if TEditName.Text=('') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher o campo nome.');
    Exit;
  end;

  if TEditCPF.Text=('') then
  begin
    ShowMessage('Ops! Parece que você esqueceu de preencher o campo CPF.');
    Exit;
  end;

  NomeCompleto := TEditName.Text;
  CPF := TEditCPF.Text;

Query := TFDQuery.Create(nil);

  try
    Query.Connection := FD_Connection;
    Query.SQL.Text := 'SELECT COUNT(*) FROM usuario WHERE nome_completo = :NomeCompleto AND cpf = :CPF';
    Query.Params.ParamByName('NomeCompleto').AsString := NomeCompleto;
    Query.Params.ParamByName('CPF').AsString := CPF;
    Query.Open;

    if Query.Fields[0].AsInteger > 0 then
    begin
      Form_login.Hide;
      Form3.Show
    end
    else
    begin
      ShowMessage('Houve um erro nos campos nome e/ou CPF. Por favor, verifique novamente.');
    end;
  finally
    Query.Free;
  end;
end;

procedure TForm_Login.SpeedButton1MouseEnter(Sender: TObject);
begin
  Panel1.Color := clMenuHighlight;
end;

procedure TForm_Login.SpeedButton1MouseLeave(Sender: TObject);
begin
  Panel1.Color := clHotLight;
end;

//procedure TForm1.AplicarMascaraCPF(edt: TEdit);
//begin
//  Formatar(edt, TFormato.CPF);
//end;
//
//procedure TForm1.TEditCPFExit(Sender: TObject);
//begin
//  AplicarMascaraCPF(TEditCPF);
//end;

end.
