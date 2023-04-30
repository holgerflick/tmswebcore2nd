unit uMain;

interface

uses
  WEBLib.UnitTesting.Classes;

type
{$M+}
  // Example of a class containing methods with unit tests.
  // Mark it with [TestFixture] custom attribute and register with
  // TTMSWEBUnitTestingRunner as shown below.
  [TestFixture]
  TMyTestClassUnit1 = class(TObject)
  published
    // Example method that contains a unit test. Annotate it with [Test]
    [Test]
    procedure TestSumOfDigits;

    [Test]
    procedure TestEasterSunday;

  end;
{$M-}

implementation

uses
  uExamples,

  SysUtils;

{ TMyTestClassUnit1 }

{ TMyTestClassUnit1 }

procedure TMyTestClassUnit1.TestEasterSunday;
var
  LDate: TDate;

begin
  LDate := EncodeDate( 2022, 4, 9 );
  Assert.AreEqualDate( LDate, TExamples.CalculateEasterSunday(2022), 'Easter Sunday 2022');

  LDate := EncodeDate( 2023, 4, 9 );
  Assert.AreEqualDate( LDate, TExamples.CalculateEasterSunday(2023), 'Easter Sunday 2023');
end;

procedure TMyTestClassUnit1.TestSumOfDigits;
begin
  Assert.AreEqual( 19, TExamples.SumOfDigits( 412561 ), 'for 412561' );
  Assert.AreEqual( 19, TExamples.SumOfDigits( 561412 ), 'for 561412' );

  Assert.AreNotEqual( 20, TExamples.SumOfDigits( 561413 ), 'Example! This needs to fail.' );
end;

initialization
  //Registration of the test classes.
  TTMSWEBUnitTestingRunner.RegisterClass(TMyTestClassUnit1);

end.
