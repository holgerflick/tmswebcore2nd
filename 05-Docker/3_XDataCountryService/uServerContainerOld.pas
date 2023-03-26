unit uServerContainerOld;

interface

uses
  System.SysUtils, System.Classes, Sparkle.HttpServer.Module,
  Sparkle.HttpServer.Context, XData.Server.Module, Sparkle.Comp.Server,
  XData.Comp.Server,
  Sparkle.Indy.Server,
  Sparkle.Uri,
  Sparkle.Middleware.Cors,
  XData.Model.Classes;

type
  TServerContainer = class(TDataModule)
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FHttpServer: TIndySparkleHTTPServer;

    class var FInstance: TServerContainer;
    function GetIsRunning: Boolean;
    var
    FURL: TUri;


  public
    { Public declarations }
    class function Instance: TServerContainer;
    class destructor Destroy;

    procedure Start;
    procedure Stop;

    property IsRunning: Boolean read GetIsRunning;

    property URL: TUri read FURL write FURL;
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TServerContainer }

procedure TServerContainer.DataModuleCreate(Sender: TObject);
begin
  FHttpServer := TIndySparkleHTTPServer.Create(nil);
end;

procedure TServerContainer.DataModuleDestroy(Sender: TObject);
begin
  FHttpServer.Free;
end;

class destructor TServerContainer.Destroy;
begin
  FInstance.Free;
end;

function TServerContainer.GetIsRunning: Boolean;
begin
  Result := FHttpServer.Active;
end;

class function TServerContainer.Instance: TServerContainer;
begin
  if not Assigned( FInstance ) then
  begin
    FInstance := TServerContainer.Create(nil);
  end;

  Result := FInstance;
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

  // create model if needed...
  //  LModel := TXDataModel.Create;

  // create the server module
  LXDataModule := TXDataServerModule.Create( URL.OriginalUri );

  // add middleware as needed
  LCors := TCorsMiddleware.Create( '*', '*' );
  LXDataModule.AddMiddleware( LCors );

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
