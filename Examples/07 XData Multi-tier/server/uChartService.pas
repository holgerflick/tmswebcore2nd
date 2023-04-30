unit uChartService;

interface

uses
  XData.Service.Common,
  Aurelius.Criteria.Base,
  System.Generics.Collections;

type
  [ServiceContract]
  IChartService = interface(IInvokable)
    ['{5607ADB5-5A25-4498-BB95-8912E3D6F274}']

    [HttpGet]
    function GetTotalStudentsZip: TObjectList<TCriteriaResult>;
  end;

implementation

initialization
  RegisterServiceType(TypeInfo(IChartService));

end.
