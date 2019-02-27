unit Forms.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TSelectedForm = (sfNone, sfFirebird, sfSQLite, sfXML, sfDBUnion);

  TfrmPrincipal = class(TForm)
    pnlTop: TPanel;
    btnFirebird: TButton;
    btnSQLite: TButton;
    btnXML: TButton;
    btnUnion: TButton;
    pnlBody: TPanel;
    lblSelection: TLabel;
    pnlButton: TPanel;
    pnlLabel: TPanel;
    procedure btnFirebirdClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnSQLiteClick(Sender: TObject);
    procedure btnXMLClick(Sender: TObject);
    procedure btnUnionClick(Sender: TObject);
  private
    { Private declarations }
    FSelectedForm : TSelectedForm;
    procedure SetSelectedForm(const Value: TSelectedForm);
    procedure CloseAllForms;
  public
    { Public declarations }
    property SelectedForm : TSelectedForm read FSelectedForm write SetSelectedForm;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  Forms.Firebird,
  Forms.SQLite,
  Forms.XML,
  Forms.DBUnion;

{ TfrmPrincipal }

procedure TfrmPrincipal.btnFirebirdClick(Sender: TObject);
begin
  SelectedForm := sfFirebird;
end;

procedure TfrmPrincipal.btnSQLiteClick(Sender: TObject);
begin
  SelectedForm := sfSQLite;
end;

procedure TfrmPrincipal.btnUnionClick(Sender: TObject);
begin
  SelectedForm := sfDBUnion;
end;

procedure TfrmPrincipal.btnXMLClick(Sender: TObject);
begin
  SelectedForm := sfXML;
end;

procedure TfrmPrincipal.CloseAllForms;
begin
  if Assigned(frmFirebird) then
  begin
    FreeAndNil(frmFirebird);
  end;

  if Assigned(frmSQlite) then
  begin
    FreeAndNil(frmSQlite);
  end;

  if Assigned(frmXML) then
  begin
    FreeAndNil(frmXML);
  end;

  if Assigned(frmDBUnion) then
  begin
    FreeAndNil(frmDBUnion);
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseAllForms;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  SelectedForm := sfNone;
end;

procedure TfrmPrincipal.FormResize(Sender: TObject);
begin
  lblSelection.Left := (pnlLabel.Width - lblSelection.Width) div 2;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Self.WindowState := wsMaximized;
end;

procedure TfrmPrincipal.SetSelectedForm(const Value: TSelectedForm);
begin
  FSelectedForm := Value;

  case SelectedForm of
    sfNone:
      begin
        CloseAllForms;
        lblSelection.Caption := '';
      end;
    sfFirebird:
      begin
        CloseAllForms;
        if not Assigned(frmFirebird) then
        begin
          frmFirebird := TfrmFirebird.Create(Application);
          frmFirebird.BorderStyle := bsNone;
          frmFirebird.Align       := alClient;
          frmFirebird.Parent      := pnlBody;
          frmFirebird.Visible     := True;
        end;
        lblSelection.Caption := 'Firebird';
      end;
    sfSQLite:
      begin
        CloseAllForms;
        if not Assigned(frmSQlite) then
        begin
          frmSQlite := TfrmSQlite.Create(Application);
          frmSQlite.BorderStyle := bsNone;
          frmSQlite.Align       := alClient;
          frmSQlite.Parent      := pnlBody;
          frmSQlite.Visible     := True;
        end;
        lblSelection.Caption := 'SQlite';
      end;
    sfXML:
      begin
        CloseAllForms;
        if not Assigned(frmXML) then
        begin
          frmXML := TfrmXML.Create(Application);
          frmXML.BorderStyle := bsNone;
          frmXML.Align       := alClient;
          frmXML.Parent      := pnlBody;
          frmXML.Visible     := True;
        end;
        lblSelection.Caption := 'XML';
      end;
    sfDBUnion:
      begin
        frmDBUnion := TfrmDBUnion.Create(Application);
        frmDBUnion.BorderStyle := bsNone;
        frmDBUnion.Align       := alClient;
        frmDBUnion.Parent      := pnlBody;
        frmDBUnion.Visible     := True;
        lblSelection.Caption := 'Dados Agrupados';
      end;
  end;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
