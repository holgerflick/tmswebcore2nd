unit uConsoleController;

interface

uses
  Sparkle.Uri
  ;

const
  DEFAULT_URL = 'http://localhost:2011';

type
  TConsoleController = class
  private
    FURL: TURI;
  public
    constructor Create;

    function IsRunning: Boolean;
    procedure ShowMenu;
    function GetKey: String;
    function SetEndpoint: TURI;
    procedure StartService;
    procedure StopService;
    function SelectFromMenu: Boolean;

    property URL: TURI read FURL write FURL;
  end;

implementation
uses
  uLinuxServerContainer;

constructor TConsoleController.Create;
begin
  FURL := TURI.Create( DEFAULT_URL );
end;

function TConsoleController.GetKey: String;
begin
  Writeln;
  Write( '> ' );
  ReadLn( Result );
end;

function TConsoleController.IsRunning: Boolean;
begin
  Result := TServerContainer.Shared.IsRunning;
end;

procedure TConsoleController.StartService;
begin
  if NOT IsRunning then
  begin
    TServerContainer.Shared.BaseUrl := URL;
    TServerContainer.Shared.Start;
  end;
end;

procedure TConsoleController.StopService;
begin
  if IsRunning then
  begin
    TServerContainer.Shared.Stop;
  end;
end;

function TConsoleController.SelectFromMenu: Boolean;
var
  LKey: String;

begin
  LKey := GetKey;

  for var i := 0 to 5 do
  begin
    Writeln;
  end;

  if LKey = '1' then
  begin
    StartService;
  end;

  if LKey = '2' then
  begin
    StopService;
  end;

  if LKey = '3' then
  begin
    SetEndpoint;
  end;

  Result := LKey = 'X';
end;

function TConsoleController.SetEndpoint: TURI;
var
  LURL: String;

begin
  Write('New URL: > ' );
  Readln( LURL );

  if LURL <> '' then
  begin
    Result := TURI.Create(LURL);
  end
  else
  begin
    Result := TURI.Create( DEFAULT_URL );
  end;
end;

procedure TConsoleController.ShowMenu;
begin
  Writeln('-----------------------------------------------------------------');
  if IsRunning then
  begin
    Writeln( ' +++ SERVICE ONLINE +++' );
    Writeln;
  end
  else
  begin
    Writeln( 'Welcome to XData Services on Linux' );
    Writeln;
  end;

  Writeln( 'Current service endpoint: ' + URL.OriginalUri );

  Writeln;
  if not IsRunning then
    Writeln( '1 - Start service' );

  if IsRunning then
    Writeln( '2 - Stop service' );

  if not IsRunning then
    Writeln( '3 - Set service endpoint' );

  Writeln;
  Writeln( 'X - Exit' );
end;


end.
