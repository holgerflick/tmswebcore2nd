unit uChartServiceImpl;

interface

uses
  XData.Server.Module,
  XData.Service.Common,
  uChartService,
  Aurelius.Criteria.Base,
  System.Generics.Collections;

type
  [ServiceImplementation]
  TChartService = class(TInterfacedObject, IChartService)
    public
      function GetTotalStudentsZip: TObjectList<TCriteriaResult>;
  end;

implementation
uses uSchool, Variants,
  Aurelius.Criteria.Linq,
  Aurelius.Criteria.Projections;


{ TChartService }

function TChartService.GetTotalStudentsZip: TObjectList<TCriteriaResult>;
begin
  Result := TXDataOperationContext.Current.GetManager.
    Find<TSchools>.Select(
      TProjections.ProjectionList
        .Add( TProjections.Group('Zip').As_('Zip') )
        .Add( TProjections.Sum('Students').As_('Total') )
        .Add( TProjections.Count('Zip').As_('NoSchools') )
        .Add( ( Linq['Students'].Sum / Linq['Zip'].Count ).As_('Ratio') )
        )
      .OrderBy('Zip')
      .ListValues;
end;

initialization
  RegisterServiceType(TChartService);

end.
