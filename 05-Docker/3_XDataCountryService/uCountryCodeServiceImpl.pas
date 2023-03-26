unit uCountryCodeServiceImpl;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  uCountryCodeService;

type
  [ServiceImplementation]
  TCountryCodeService = class(TInterfacedObject, ICountryCodeService)
    function GetCountry( ACode: String ): String;
  end;

implementation

uses
  uDbController;

{ TCountryCodeService }

function TCountryCodeService.GetCountry(ACode: String): String;
begin
  Result := TDbController.Shared.GetCountryName(ACode);
end;

initialization
  RegisterServiceType(TCountryCodeService);

end.
