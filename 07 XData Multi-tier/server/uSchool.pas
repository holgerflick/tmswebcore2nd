unit uSchool;

interface

uses
  SysUtils, 
  Generics.Collections, 
  Aurelius.Mapping.Attributes, 
  Aurelius.Types.Blob, 
  Aurelius.Types.DynamicProperties, 
  Aurelius.Types.Nullable, 
  Aurelius.Types.Proxy, 
  Aurelius.Criteria.Dictionary;

type
  TSCHOOLS = class;
  TSCHOOLSTableDictionary = class;
  
  [Entity]
  [Table('SCHOOLS')]
  [Id('FOBJECTID', TIdGenerator.None)]
  TSCHOOLS = class
  private
    [Column('OBJECTID', [TColumnProp.Required])]
    FOBJECTID: Integer;
    
    [Column('FAC_TYPE', [TColumnProp.Required], 50)]
    FFAC_TYPE: string;
    
    [Column('L_FAC_TYPE', [TColumnProp.Required], 50)]
    FL_FAC_TYPE: string;
    
    [Column('NAME', [TColumnProp.Required], 100)]
    FNAME: string;
    
    [Column('ADDRESS', [TColumnProp.Required], 50)]
    FADDRESS: string;
    
    [Column('CITY', [TColumnProp.Required], 50)]
    FCITY: string;
    
    [Column('ZIP', [])]
    FZIP: Nullable<Integer>;
    
    [Column('STRAP', [TColumnProp.Required], 50)]
    FSTRAP: string;
    
    [Column('MISC1', [], 50)]
    FMISC1: Nullable<string>;
    
    [Column('MISC2', [], 50)]
    FMISC2: Nullable<string>;
    
    [Column('PHONE', [], 50)]
    FPHONE: Nullable<string>;
    
    [Column('SOURCE', [], 50)]
    FSOURCE: Nullable<string>;
    
    [Column('X', [TColumnProp.Required])]
    FX: Double;
    
    [Column('Y', [TColumnProp.Required])]
    FY: Double;
    
    [Column('USNG', [TColumnProp.Required], 50)]
    FUSNG: string;
    
    [Column('EDITOR_NAME', [TColumnProp.Required], 50)]
    FEDITOR_NAME: string;
    
    [Column('EDIT_DATE', [TColumnProp.Required])]
    FEDIT_DATE: string;
    
    [Column('SCHOOLZONE', [], 50)]
    FSCHOOLZONE: Nullable<string>;
    
    [Column('YEARBUILT', [])]
    FYEARBUILT: Nullable<Integer>;
    
    [Column('STORIES', [])]
    FSTORIES: Nullable<Integer>;
    
    [Column('STUDENTS', [])]
    FSTUDENTS: Nullable<Integer>;
    
    [Column('YEARESTABLISHED', [])]
    FYEARESTABLISHED: Nullable<Integer>;
  public
    property OBJECTID: Integer read FOBJECTID write FOBJECTID;
    property FAC_TYPE: string read FFAC_TYPE write FFAC_TYPE;
    property L_FAC_TYPE: string read FL_FAC_TYPE write FL_FAC_TYPE;
    property NAME: string read FNAME write FNAME;
    property ADDRESS: string read FADDRESS write FADDRESS;
    property CITY: string read FCITY write FCITY;
    property ZIP: Nullable<Integer> read FZIP write FZIP;
    property STRAP: string read FSTRAP write FSTRAP;
    property MISC1: Nullable<string> read FMISC1 write FMISC1;
    property MISC2: Nullable<string> read FMISC2 write FMISC2;
    property PHONE: Nullable<string> read FPHONE write FPHONE;
    property SOURCE: Nullable<string> read FSOURCE write FSOURCE;
    property X: Double read FX write FX;
    property Y: Double read FY write FY;
    property USNG: string read FUSNG write FUSNG;
    property EDITOR_NAME: string read FEDITOR_NAME write FEDITOR_NAME;
    property EDIT_DATE: string read FEDIT_DATE write FEDIT_DATE;
    property SCHOOLZONE: Nullable<string> read FSCHOOLZONE write FSCHOOLZONE;
    property YEARBUILT: Nullable<Integer> read FYEARBUILT write FYEARBUILT;
    property STORIES: Nullable<Integer> read FSTORIES write FSTORIES;
    property STUDENTS: Nullable<Integer> read FSTUDENTS write FSTUDENTS;
    property YEARESTABLISHED: Nullable<Integer> read FYEARESTABLISHED write FYEARESTABLISHED;
  end;
  
  TDicDictionary = class
  private
    FSCHOOLS: TSCHOOLSTableDictionary;
    function GetSCHOOLS: TSCHOOLSTableDictionary;
  public
    destructor Destroy; override;
    property SCHOOLS: TSCHOOLSTableDictionary read GetSCHOOLS;
  end;
  
  TSCHOOLSTableDictionary = class
  private
    FOBJECTID: TDictionaryAttribute;
    FFAC_TYPE: TDictionaryAttribute;
    FL_FAC_TYPE: TDictionaryAttribute;
    FNAME: TDictionaryAttribute;
    FADDRESS: TDictionaryAttribute;
    FCITY: TDictionaryAttribute;
    FZIP: TDictionaryAttribute;
    FSTRAP: TDictionaryAttribute;
    FMISC1: TDictionaryAttribute;
    FMISC2: TDictionaryAttribute;
    FPHONE: TDictionaryAttribute;
    FSOURCE: TDictionaryAttribute;
    FX: TDictionaryAttribute;
    FY: TDictionaryAttribute;
    FUSNG: TDictionaryAttribute;
    FEDITOR_NAME: TDictionaryAttribute;
    FEDIT_DATE: TDictionaryAttribute;
    FSCHOOLZONE: TDictionaryAttribute;
    FYEARBUILT: TDictionaryAttribute;
    FSTORIES: TDictionaryAttribute;
    FSTUDENTS: TDictionaryAttribute;
    FYEARESTABLISHED: TDictionaryAttribute;
  public
    constructor Create;
    property OBJECTID: TDictionaryAttribute read FOBJECTID;
    property FAC_TYPE: TDictionaryAttribute read FFAC_TYPE;
    property L_FAC_TYPE: TDictionaryAttribute read FL_FAC_TYPE;
    property NAME: TDictionaryAttribute read FNAME;
    property ADDRESS: TDictionaryAttribute read FADDRESS;
    property CITY: TDictionaryAttribute read FCITY;
    property ZIP: TDictionaryAttribute read FZIP;
    property STRAP: TDictionaryAttribute read FSTRAP;
    property MISC1: TDictionaryAttribute read FMISC1;
    property MISC2: TDictionaryAttribute read FMISC2;
    property PHONE: TDictionaryAttribute read FPHONE;
    property SOURCE: TDictionaryAttribute read FSOURCE;
    property X: TDictionaryAttribute read FX;
    property Y: TDictionaryAttribute read FY;
    property USNG: TDictionaryAttribute read FUSNG;
    property EDITOR_NAME: TDictionaryAttribute read FEDITOR_NAME;
    property EDIT_DATE: TDictionaryAttribute read FEDIT_DATE;
    property SCHOOLZONE: TDictionaryAttribute read FSCHOOLZONE;
    property YEARBUILT: TDictionaryAttribute read FYEARBUILT;
    property STORIES: TDictionaryAttribute read FSTORIES;
    property STUDENTS: TDictionaryAttribute read FSTUDENTS;
    property YEARESTABLISHED: TDictionaryAttribute read FYEARESTABLISHED;
  end;
  
function Dic: TDicDictionary;

implementation

var
  __Dic: TDicDictionary;

function Dic: TDicDictionary;
begin
  if __Dic = nil then __Dic := TDicDictionary.Create;
  result := __Dic
end;

{ TDicDictionary }

destructor TDicDictionary.Destroy;
begin
  if FSCHOOLS <> nil then FSCHOOLS.Free;
  inherited;
end;

function TDicDictionary.GetSCHOOLS: TSCHOOLSTableDictionary;
begin
  if FSCHOOLS = nil then FSCHOOLS := TSCHOOLSTableDictionary.Create;
  result := FSCHOOLS;
end;

{ TSCHOOLSTableDictionary }

constructor TSCHOOLSTableDictionary.Create;
begin
  inherited;
  FOBJECTID := TDictionaryAttribute.Create('OBJECTID');
  FFAC_TYPE := TDictionaryAttribute.Create('FAC_TYPE');
  FL_FAC_TYPE := TDictionaryAttribute.Create('L_FAC_TYPE');
  FNAME := TDictionaryAttribute.Create('NAME');
  FADDRESS := TDictionaryAttribute.Create('ADDRESS');
  FCITY := TDictionaryAttribute.Create('CITY');
  FZIP := TDictionaryAttribute.Create('ZIP');
  FSTRAP := TDictionaryAttribute.Create('STRAP');
  FMISC1 := TDictionaryAttribute.Create('MISC1');
  FMISC2 := TDictionaryAttribute.Create('MISC2');
  FPHONE := TDictionaryAttribute.Create('PHONE');
  FSOURCE := TDictionaryAttribute.Create('SOURCE');
  FX := TDictionaryAttribute.Create('X');
  FY := TDictionaryAttribute.Create('Y');
  FUSNG := TDictionaryAttribute.Create('USNG');
  FEDITOR_NAME := TDictionaryAttribute.Create('EDITOR_NAME');
  FEDIT_DATE := TDictionaryAttribute.Create('EDIT_DATE');
  FSCHOOLZONE := TDictionaryAttribute.Create('SCHOOLZONE');
  FYEARBUILT := TDictionaryAttribute.Create('YEARBUILT');
  FSTORIES := TDictionaryAttribute.Create('STORIES');
  FSTUDENTS := TDictionaryAttribute.Create('STUDENTS');
  FYEARESTABLISHED := TDictionaryAttribute.Create('YEARESTABLISHED');
end;

initialization
  RegisterEntity(TSCHOOLS);

finalization
  if __Dic <> nil then __Dic.Free

end.
