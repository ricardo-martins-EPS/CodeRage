unit Forms.DBUnion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.AppEvnts,
  DataModule.MemoryDB;

type
  TGridHelper = class helper for TDBGrid
    function ColumnByName(const AName : string): TColumn;
  end;

  TfrmDBUnion = class(TForm)
    pnlOptions: TPanel;
    rgpOptions: TRadioGroup;
    pnlBottom: TPanel;
    grdData: TDBGrid;
    dtsData: TDataSource;
    ApplicationEvents: TApplicationEvents;
    lblRecordCount: TLabel;
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure rgpOptionsClick(Sender: TObject);
  private
    { Private declarations }
    FFormActive : Boolean;
    FMemoryDB   : TdmMemoryDB;
  public
    { Public declarations }
    property FormActive : Boolean read FFormActive write FFormActive;
  end;
var
  frmDBUnion: TfrmDBUnion;

implementation

{$R *.dfm}

uses
  DataModule.Principal;

procedure TfrmDBUnion.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin
  if not FormActive then
  begin
    FormActive := True;

    if not dmPrincipal.qryFBCliente.Active then
    begin
      dmPrincipal.qryFBCliente.Open;
    end;

    if not dmPrincipal.qrySQLCliente.Active then
    begin
      dmPrincipal.qrySQLCliente.Open;
    end;

    if not dmPrincipal.mtbXML.Active then
    begin
      dmPrincipal.mtbXML.Open;
    end;

    if not dmPrincipal.lsqlMemory.Active then
    begin
      dmPrincipal.lsqlMemory.Active := True;
    end;

    dmPrincipal.qryCliente.Close;
    dmPrincipal.qryCliente.Open;

    FMemoryDB.lsqlMemoryDB.DataSets.Add(dmPrincipal.qryCliente, '', 'tbCliente');
    FMemoryDB.lsqlMemoryDB.Active := True;
    FMemoryDB.sqlfValidarDocumento.Active := True;
  end;
end;

{ TGridHelper }

function TGridHelper.ColumnByName(const AName: string): TColumn;
var
  lColumn : Integer;
  lContinue : Boolean;
begin

  Result := nil;

  lColumn := 0;

  lContinue := True;

  while lContinue and (lColumn <= (Columns.Count - 1)) do
  begin
    if (Columns[lColumn].Field <> Nil) and (CompareText(Columns[lColumn].FieldName, AName) = 0) then
    begin
      Result := Columns[lColumn];
    end;
    Inc(lColumn);
  end;
end;

procedure TfrmDBUnion.FormCreate(Sender: TObject);
begin
  FFormActive := False;
  FMemoryDB := TdmMemoryDB.Create(nil);
  dtsData.DataSet := FMemoryDB.qryDisplay;
end;

procedure TfrmDBUnion.FormDestroy(Sender: TObject);
begin
  if Assigned(FMemoryDB) then
  begin
    FMemoryDB.qryDisplay.Close;
    FMemoryDB.lsqlMemoryDB.Active := False;
    FMemoryDB.connMemoryDB.Connected := False;
    FreeAndNil(FMemoryDB);
  end;
end;

procedure TfrmDBUnion.rgpOptionsClick(Sender: TObject);
var
  lColumn : TColumn;
begin
  FMemoryDB.qryDisplay.Close;
  FMemoryDB.qryDisplay.SQL.Text := EmptyStr;

  lblRecordCount.Caption := EmptyStr;

  case rgpOptions.ItemIndex of
    0 :
      begin
        FMemoryDB.qryDisplay.SQL.Text := 'SELECT * FROM tbCliente';
      end;

    1 :
      begin
        FMemoryDB.qryDisplay.SQL.Add('SELECT tb1.*');
        FMemoryDB.qryDisplay.SQL.Add('FROM tbCliente tb1');
        FMemoryDB.qryDisplay.SQL.Add('JOIN (SELECT DOCUMENTO, COUNT(DOCUMENTO) AS OCORRENCIA');
        FMemoryDB.qryDisplay.SQL.Add('FROM tbCliente');
        FMemoryDB.qryDisplay.SQL.Add('GROUP BY DOCUMENTO) tb2 ON tb2.DOCUMENTO = tb1.DOCUMENTO');
        FMemoryDB.qryDisplay.SQL.Add('WHERE tb2.OCORRENCIA > 1');
        FMemoryDB.qryDisplay.SQL.Add('ORDER BY tb1.DOCUMENTO');
      end;

    2 :
      begin
        FMemoryDB.qryDisplay.SQL.Add('SELECT tb1.*');
        FMemoryDB.qryDisplay.SQL.Add('FROM tbCliente tb1');
        FMemoryDB.qryDisplay.SQL.Add('JOIN (SELECT DOCUMENTO, COUNT(DOCUMENTO) AS OCORRENCIA');
        FMemoryDB.qryDisplay.SQL.Add('FROM tbCliente');
        FMemoryDB.qryDisplay.SQL.Add('GROUP BY DOCUMENTO) tb2 ON tb2.DOCUMENTO = tb1.DOCUMENTO');
        FMemoryDB.qryDisplay.SQL.Add('WHERE tb2.OCORRENCIA = 1');
        FMemoryDB.qryDisplay.SQL.Add('ORDER BY tb1.DOCUMENTO');
      end;

    3 :
      begin
        FMemoryDB.qryDisplay.SQL.Add('SELECT *');
        FMemoryDB.qryDisplay.SQL.Add('FROM tbCliente');
        FMemoryDB.qryDisplay.SQL.Add('WHERE DocumentoValido(DOCUMENTO) = 1');
        FMemoryDB.qryDisplay.SQL.Add('ORDER BY DOCUMENTO');
      end;

    4 :
      begin
        FMemoryDB.qryDisplay.SQL.Add('SELECT *');
        FMemoryDB.qryDisplay.SQL.Add('FROM tbCliente');
        FMemoryDB.qryDisplay.SQL.Add('WHERE DocumentoValido(DOCUMENTO) = 0');
        FMemoryDB.qryDisplay.SQL.Add('ORDER BY DOCUMENTO');
      end;
  end;

  if FMemoryDB.qryDisplay.SQL.Text <> EmptyStr then
  begin
    FMemoryDB.qryDisplay.Open;
    lColumn := grdData.ColumnByName('NOME');

    if Assigned(lColumn) then
    begin
      lColumn.Width := 400;
    end;

    FMemoryDB.qryDisplay.DisableControls;
    FMemoryDB.qryDisplay.Last;
    lblRecordCount.Caption := 'Total de Registros: ' + FMemoryDB.qryDisplay.RecordCount.ToString;
    FMemoryDB.qryDisplay.First;
    FMemoryDB.qryDisplay.EnableControls;
  end;
end;

end.
