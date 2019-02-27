unit DataModule.MemoryDB;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.SQLiteVDataSet,
  FireDAC.Phys.SQLiteWrapper, System.Character, System.StrUtils;

type
  TdmMemoryDB = class(TDataModule)
    sqlfValidarDocumento: TFDSQLiteFunction;
    connMemoryDB: TFDConnection;
    lsqlMemoryDB: TFDLocalSQL;
    qryDisplay: TFDQuery;
    plkSQlite: TFDPhysSQLiteDriverLink;
    procedure sqlfValidarDocumentoCalculate(AFunc: TSQLiteFunctionInstance; AInputs: TSQLiteInputs;
      AOutput: TSQLiteOutput; var AUserData: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMemoryDB: TdmMemoryDB;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmMemoryDB.sqlfValidarDocumentoCalculate(AFunc: TSQLiteFunctionInstance; AInputs: TSQLiteInputs;
  AOutput: TSQLiteOutput; var AUserData: TObject);
var
  lDocumento   : string;
  lDigito      : array[0..7] of Integer;
  lVerificador : string;
  lPos         : Integer;
  lSoma        : Integer;
begin
  AOutput.AsInteger := 0;

  lDocumento := EmptyStr;

  for var i := Low(Ainputs[0].AsString) to High(Ainputs[0].AsString) do
  begin
    if Ainputs[0].AsString[i].IsDigit then
    begin
      lDocumento := lDocumento + Ainputs[0].AsString[i];
    end;
  end;

  if Length(lDocumento) = 10 then
  begin
    lVerificador := RightStr(lDocumento, 2);
    lDocumento  := LeftStr(lDocumento, 8);

    lPos := 0;

    for var i := Low(lDocumento) to High(lDocumento) do
    begin
      lDigito[lPos] := StrToInt(lDocumento[i]);
      Inc(lPos);
    end;

    lSoma := 0;

    for var i := 0 to 7 do
    begin
      lSoma := lSoma + lDigito[i];
    end;

    if lSoma = StrToInt(lVerificador) then
    begin
      AOutput.AsInteger := 1;
    end;
  end;
end;

end.
