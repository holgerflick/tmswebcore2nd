unit uDbController;

interface

uses
  System.SysUtils,
  System.Classes,

  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Phys,
  FireDAC.Comp.Client,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Stan.Param,
  FireDAC.DApt,
  FireDAC.Phys.MySQLDef,
  FireDAC.Phys.MySQL,

  XData.Sys.Exceptions
  ;

type
  TDbController = class(TDataModule)
    Manager: TFDManager;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  strict private
    class var
      FShared: TDbController;

  private
    function GetConnection: TFDConnection;

  public
    { Public declarations }
    class destructor Destroy;
    class function Shared: TDbController;

    function GetCountryName( ACode: String ): String;
  end;

var
  DbController: TDbController;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

const
  DB_DEF = 'postal_linux';

procedure TDbController.DataModuleCreate(Sender: TObject);
begin
  Manager.Active := True;
end;

class destructor TDbController.Destroy;
begin
  FShared.Free;
end;

function TDbController.GetConnection: TFDConnection;
var
  LParams: TStringList;

begin
  if Manager.ConnectionDefs.FindConnectionDef(DB_DEF) = nil then
  begin
    LParams := TStringList.Create;
    try
      // this can be hard coded because these settings are
      // set in the Docker container
      LParams.Add('Database=postcodes');
      LParams.Add('Server=db');
      LParams.Add('User_Name=root');
      LParams.Add('Password=masterkey');
      LParams.Add('Pooled=True');
      LParams.Add('CharacterSet=utf8');
      Manager.AddConnectionDef( DB_DEF, 'Maria', LParams, False );
    finally
      LParams.Free;
    end;
  end;

  Result := TFDConnection.Create(nil);
  Result.ConnectionDefName := DB_DEF;
end;

function TDbController.GetCountryName(ACode: String): String;
var
  LQu: TFDQuery;
  LCon: TFDConnection;

begin
  LCon := GetConnection;
  LQu := TFDQUery.Create(nil);
  try
    LQu.Connection := LCon;
    LQu.SQL.Text := 'SELECT Name FROM countrycodes WHERE Code = :Code';
    LQu.ParamByName('Code').AsString := ACode;
    LQu.Open;

    if not LQu.Eof then
    begin
      Result := LQu.FieldByName('Name').AsString;
    end
    else
    begin
      raise EXDataHttpException.Create( 404, 'Country code not found.' );
    end;

  finally
    LQu.Free;
    LCon.Free;
  end;
end;

class function TDbController.Shared: TDbController;
begin
  if not Assigned( FShared ) then
  begin
    FShared := TDbController.Create(nil);
  end;

  Result := FShared;
end;

end.
