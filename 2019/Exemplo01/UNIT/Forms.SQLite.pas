unit Forms.SQLite;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.AppEvnts;

type
  TfrmSQlite = class(TForm)
    ApplicationEvents: TApplicationEvents;
    dtsCliente: TDataSource;
    grdCliente: TDBGrid;
    pnlBottom: TPanel;
    lblRecordCount: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
  private
    { Private declarations }
    FFormActive : Boolean;
  public
    { Public declarations }
    property FormActive : Boolean read FFormActive write FFormActive;
  end;

var
  frmSQlite: TfrmSQlite;

implementation

{$R *.dfm}

uses
  DataModule.Principal;

procedure TfrmSQlite.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin
  if not FormActive then
  begin
    FormActive := True;
    dmPrincipal.qrySQLCliente.Open;
    dmPrincipal.qrySQLCliente.DisableControls;
    dmPrincipal.qrySQLCliente.Last;
    lblRecordCount.Caption := 'Total de Registros: ' + dmPrincipal.qrySQLCliente.RecordCount.ToString;
    dmPrincipal.qrySQLCliente.First;
    dmPrincipal.qrySQLCliente.EnableControls;
  end;
end;

procedure TfrmSQlite.FormCreate(Sender: TObject);
begin
  FFormActive := False;
end;

end.
