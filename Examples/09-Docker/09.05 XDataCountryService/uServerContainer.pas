unit uServerContainer;

interface
uses
  System.SysUtils,
  System.Classes,

  Sparkle.HttpServer.Module,
  Sparkle.HttpServer.Context,
  Sparkle.Comp.Server,
  Sparkle.Indy.Server,
  Sparkle.Uri,
  Sparkle.Middleware.Cors,

  XData.Server.Module,
  XData.Comp.Server,
  XData.Model.Classes,
  XData.OpenApi.Service,
  XData.SwaggerUI.Service
  ;

type
  TServerContainer = class
  strict private
    class var
     FShared: TServerContainer;

  private
    FHttpServer: TIndySparkleHTTPServer;
    FURL: TUri;

    function GetIsRunning: Boolean;
    

  public
    class function Shared: TServerContainer;
    class destructor Destroy;

    constructor Create;
    destructor Destroy; override;

    procedure Start;
    procedure Stop;

    property IsRunning: Boolean read GetIsRunning;

    property URL: TUri read FURL write FURL;
  end;

implementation

{ TServerContainer }


constructor TServerContainer.Create;
begin
  FHttpServer := TIndySparkleHTTPServer.Create(nil);

  RegisterOpenApiService;
  RegisterSwaggerUIService;
end;

destructor TServerContainer.Destroy;
begin
  FHttpServer.Free;

  inherited;
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
    raise EInvalidOperation.Create('Server is running.');
  end;

  // create the server module
  LXDataModule := TXDataServerModule.Create( URL.OriginalUri );

  // add middleware as needed
  LCors := TCorsMiddleware.Create;
  LXDataModule.AddMiddleware( LCors );

  // add Swagger UI


  // set port in HTTP server as well!
  FHttpServer.DefaultPort := URL.Port;
  FHttpServer.Dispatcher.AddModule(
    LXDataModule
    );
  FHttpServer.Active := True;

  Writeln( 'Started service at ' + URL.OriginalUri );
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
