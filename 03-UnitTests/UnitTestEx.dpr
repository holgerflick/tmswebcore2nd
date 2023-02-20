program UnitTestEx;

uses
  Vcl.Forms,
  WEBLib.Forms,
  uMain in 'uMain.pas',
  uExamples in 'uExamples.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Run;
end.
