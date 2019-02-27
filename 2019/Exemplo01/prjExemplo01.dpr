program prjExemplo01;

uses
  Vcl.Forms,
  Forms.Principal in 'UNIT\Forms.Principal.pas' {frmPrincipal},
  Forms.Firebird in 'UNIT\Forms.Firebird.pas' {frmFirebird},
  DataModule.Principal in 'UNIT\DataModule.Principal.pas' {dmPrincipal: TDataModule},
  Forms.SQLite in 'UNIT\Forms.SQLite.pas' {frmSQlite},
  Forms.XML in 'UNIT\Forms.XML.pas' {frmXML},
  Forms.DBUnion in 'UNIT\Forms.DBUnion.pas' {frmDBUnion},
  DataModule.MemoryDB in 'UNIT\DataModule.MemoryDB.pas' {dmMemoryDB: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmPrincipal, dmPrincipal);
  Application.Run;
end.
