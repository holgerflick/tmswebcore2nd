unit uReturnTypes;

interface
uses Bcl.Json.Attributes;

type
  TTotalStudentsZip = class
  private
    FZip: Integer;
    FTotal: Integer;
    FNoSchools: Integer;

    function GetStudentsPerSchool: Double;


  published
    property Zip: Integer read FZip write FZip;
    property NoSchools: Integer read FNoSchools write FNoSchools;
    property Total: Integer read FTotal write FTotal;

    [JsonProperty]
    property StudentsPerSchool: Double read GetStudentsPerSchool;
  end;


implementation

{ TTotalStudentsZip }




{ TTotalStudentsZip }

function TTotalStudentsZip.GetStudentsPerSchool: Double;
begin
  Result := self.Total / self.NoSchools;
end;

end.
