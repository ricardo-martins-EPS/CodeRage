unit DataModule.Principal;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.FBDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLite, Vcl.Forms, FireDAC.Stan.StorageXML, FireDAC.Phys.SQLiteVDataSet;

type
  TdmPrincipal = class(TDataModule)
    plkFirebird: TFDPhysFBDriverLink;
    connFirebird: TFDConnection;
    qryFBCliente: TFDQuery;
    qryFBClienteID: TIntegerField;
    qryFBClienteNOME: TStringField;
    qryFBClienteDOCUMENTO: TStringField;
    qryFBClienteDATA_INCLUSAO: TSQLTimeStampField;
    qryFBClienteDATA_ULTIMA_COMPRA: TSQLTimeStampField;
    plkSQLite: TFDPhysSQLiteDriverLink;
    connSQLite: TFDConnection;
    qrySQLCliente: TFDQuery;
    plkXML: TFDStanStorageXMLLink;
    mtbXML: TFDMemTable;
    mtbXMLID: TIntegerField;
    mtbXMLNOME: TStringField;
    mtbXMLDOCUMENTO: TStringField;
    mtbXMLSTATUS: TStringField;
    mtbXMLDATA_INCLUSAO: TDateTimeField;
    mtbXMLDATA_ULTIMA_COMPRA: TDateTimeField;
    connMemory: TFDConnection;
    lsqlMemory: TFDLocalSQL;
    qryCliente: TFDQuery;
    procedure qryFBClienteBeforeOpen(DataSet: TDataSet);
    procedure qrySQLClienteBeforeOpen(DataSet: TDataSet);
    procedure mtbXMLAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    FXMLLoaded : Boolean;
  public
    { Public declarations }
    property XMLLoaded : Boolean read FXMLLoaded write FXMLLoaded;
  end;

var
  dmPrincipal: TdmPrincipal;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPrincipal.mtbXMLAfterOpen(DataSet: TDataSet);
begin
  if not XMLLoaded then
  begin
    XMLLoaded := True;
    mtbXML.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Data\XML\Exemplo01.xml', sfXML);
  end;
end;

procedure TdmPrincipal.qryFBClienteBeforeOpen(DataSet: TDataSet);
begin
  connFirebird.Params.Database := ExtractFilePath(Application.ExeName) + 'Data\Firebird\Exemplo01.fdb';
end;

procedure TdmPrincipal.qrySQLClienteBeforeOpen(DataSet: TDataSet);
begin
  connSQLite.Params.Database := ExtractFilePath(Application.ExeName) + 'Data\SQlite\Exemplo01.db3';
end;

end.
