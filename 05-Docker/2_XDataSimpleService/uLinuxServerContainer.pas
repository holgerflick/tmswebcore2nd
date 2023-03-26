unit uLinuxServerContainer;

interface
uses
  System.SysUtils,
  System.Classes,

  Sparkle.HttpServer.Module,
  Sparkle.HttpServer.Context,
  Sparkle.Indy.Server,
  Sparkle.Uri,
  Sparkle.Middleware.Cors,
  Sparkle.Comp.Server,

  XData.Server.Module,
  XData.Comp.Server,
  XData.Model.Classes,
  XData.OpenAPI.Service,
  XData.SwaggerUI.Service

  ;
type
  TServerContainer = class
  strict private
    class var
      FShared: TServerContainer;

  private
    { Private declarations }
    FHttpServer: TIndySparkleHTTPServer;
    FURL: TUri;

    function GetIsRunning: Boolean;
  public
    { Public declarations }
    class function Shared: TServerContainer;
    class destructor Destroy;

    constructor Create;
    destructor Destroy; override;

    procedure Start;
    procedure Stop;

    property IsRunning: Boolean read GetIsRunning;

    property BaseUrl: TUri read FURL write FURL;
  end;

implementation
{ TServerContainer }

constructor TServerContainer.Create;
begin
  FHttpServer := TIndySparkleHTTPServer.Create;
end;

destructor TServerContainer.Destroy;
begin
  FHttpServer.Free;
end;

class destructor TServerContainer.Destroy;
begin
  FShared.Free;
end;

function TServerContainer.GetIsRunning: Boolean;
begin
  Result := FHttpServer.Active;
end;

class function TServerContainer.Shared: TServerContainer;
begin
  if not Assigned( FShared ) then
  begin
    FShared := TServerContainer.Create;
  end;

  Result := FShared;
end;

procedure TServerContainer.Start;
var
  LXDataModule: TXDataServerModule;
  LCors: TCorsMiddleware;

begin
  if FHttpServer.Active then
  begin
    raise EInvalidOperation.Create('Server is already running.');
  end;

  // create the server module
  LXDataModule := TXDataServerModule.Create( BaseUrl.OriginalUri );

  // enable Swagger
  RegisterOpenApiService;

  // enable SwaggerUI
  RegisterSwaggerUIService;

  // add middleware as needed
  LCors := TCorsMiddleware.Create;      // this will allow any request!
  LXDataModule.AddMiddleware( LCors );

  // limit it to your domain...
  // LCors := TCorsMiddleware.Create( 'www.flixengineering.com' );

  // set port in HTTP server as well
  FHttpServer.DefaultPort := BaseUrl.Port;
  FHttpServer.Dispatcher.AddModule(
    LXDataModule
    );
  FHttpServer.Active := True;

  Writeln( 'Started service at endpoint ' + BaseUrl.OriginalUri + '.' );
end;

procedure TServerContainer.Stop;
begin
  if not FHttpServer.Active then
  begin
    raise EInvalidOperation.Create('Server is not running.');
  end;

  FHttpServer.Active := False;
  FHttpServer.Dispatcher.ClearModules;
  Writeln( 'Stopped service.' );
end;

end.
