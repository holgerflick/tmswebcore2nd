unit uExampleServiceImpl;

interface

uses
  XData.Server.Module,
  XData.Service.Common,

  uExampleService
  ;

type
  [ServiceImplementation]
  TExampleService = class(TInterfacedObject, IExampleService)
    function DaysSince( ADate: TDateTime ): Integer;
  end;

implementation

uses
  System.DateUtils;

{ TExampleService }

function TExampleService.DaysSince(ADate: TDateTime): Integer;
begin
  Result := DaysBetween( TDateTime.NowUtc, ADate );

  if TDateTime.NowUtc < ADate then
  begin
    Result := Result * -1;
  end;
end;

initialization
  RegisterServiceType(TExampleService);

end.
