unit Forms.XML;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.AppEvnts;

type
  TfrmXML = class(TForm)
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
  frmXML: TfrmXML;

implementation

{$R *.dfm}

uses
  DataModule.Principal;

procedure TfrmXML.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin
  if not FormActive then
  begin
    FormActive := True;
    dmPrincipal.XMLLoaded := False;
    dmPrincipal.mtbXML.Open;
    dmPrincipal.mtbXML.DisableControls;
    dmPrincipal.mtbXML.Last;
    lblRecordCount.Caption := 'Total de Registros: ' + dmPrincipal.mtbXML.RecordCount.ToString;
    dmPrincipal.mtbXML.First;
    dmPrincipal.mtbXML.EnableControls;
  end;
end;

procedure TfrmXML.FormCreate(Sender: TObject);
begin
  FFormActive := False;
end;

end.
