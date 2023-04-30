unit uExampleService;

interface

uses
  XData.Service.Common

  ;

type
  [ServiceContract]
  [Route('')]
  IExampleService = interface(IInvokable)
    ['{445E25B1-C21E-4237-B53A-87CE31DE5C81}']

    [HttpGet]
    [Route('DaysSince/{ADate}')]
    function DaysSince( ADate: TDateTime ): Integer;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(IExampleService));

end.
