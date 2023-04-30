unit uCountryCodeService;

interface

uses
  XData.Service.Common;

type
  [ServiceContract]
  ICountryCodeService = interface(IInvokable)
    ['{76F5103A-A6E0-4E5F-A2C2-4CD2CF31DB08}']

    [HttpGet]
    function GetCountry( ACode: String ): String;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(ICountryCodeService));

end.
