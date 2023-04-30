unit uExamples;

interface

type
  TExamples = class
    class function SumOfDigits( ANumber: Integer ): Integer;
    class function CalculateEasterSunday( AYear: Word ): TDate;
  end;

implementation

uses
  SysUtils
  ;

{ TExamples }

class function TExamples.CalculateEasterSunday(AYear: word): TDate;
var
  A, B, C, D, E, F, G, H, I, K, L, M: Integer;
  LMonth, LDay: word;
begin
  A := AYear mod 19;
  B := AYear div 100;
  C := AYear mod 100;
  D := B div 4;
  E := B mod 4;
  F := (B + 8) div 25;
  G := (B - F + 1) div 3;
  H := (19 * A + B - D - G + 15) mod 30;
  I := C div 4;
  K := C mod 4;
  L := (32 + 2 * E + 2 * I - H - K) mod 7;
  M := (A + 11 * H + 22 * L) div 451;
  LMonth := (H + L - 7 * M + 114) div 31;
  LDay := (H + L - 7 * M + 114) mod 31 + 1;
  Result := EncodeDate(AYear, LMonth, LDay);
end;

class function TExamples.SumOfDigits(ANumber: Integer): Integer;
var
  i: Integer;
  s: String;
begin
  s := IntToStr(ANumber);
  Result := 0;
  for i := 1 to Length(s) do
  begin
    Result := Result + StrToInt(s[i]);
  end;
end;

end.
