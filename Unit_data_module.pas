unit Unit_data_module;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Menus, Datasnap.Provider, Datasnap.DBClient;

type
  TDataModule3 = class(TDataModule)
    FD_Connection: TFDConnection;
    FDQuery_Cidades: TFDQuery;
    DataSource_Cidades: TDataSource;
    FDQuery_Usuarios: TFDQuery;
    DataSource_Usuarios: TDataSource;
    FDQuery_Estados: TFDQuery;
    DataSource_Estados: TDataSource;
    FDQuery_Instituicoes: TFDQuery;
    DataSource_Instituicoes: TDataSource;
    FDQuery_Itens: TFDQuery;
    DataSource_Itens: TDataSource;
    DataSource_tipos_de_itens: TDataSource;
    FDQuery_tipos_de_itens: TFDQuery;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule3: TDataModule3;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
