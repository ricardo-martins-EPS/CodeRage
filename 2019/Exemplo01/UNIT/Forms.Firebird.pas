unit Forms.Firebird;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.AppEvnts;

type
  TfrmFirebird = class(TForm)
    pnlBottom: TPanel;
    lblRecordCount: TLabel;
    grdCliente: TDBGrid;
    dtsCliente: TDataSource;
    ApplicationEvents: TApplicationEvents;
    procedure ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FFormActive : Boolean;
  public
    { Public declarations }
    property FormActive : Boolean read FFormActive write FFormActive;
  end;

var
  frmFirebird: TfrmFirebird;

implementation

{$R *.dfm}

uses
  DataModule.Principal;

procedure TfrmFirebird.ApplicationEventsIdle(Sender: TObject; var Done: Boolean);
begin
  if not FormActive then
  begin
    FormActive := True;
    dmPrincipal.qryFBCliente.Open;
    dmPrincipal.qryFBCliente.DisableControls;
    dmPrincipal.qryFBCliente.Last;
    lblRecordCount.Caption := 'Total de Registros: ' + dmPrincipal.qryFBCliente.RecordCount.ToString;
    dmPrincipal.qryFBCliente.First;
    dmPrincipal.qryFBCliente.EnableControls;
  end;
end;

procedure TfrmFirebird.FormCreate(Sender: TObject);
begin
  FFormActive := False;
end;

end.
