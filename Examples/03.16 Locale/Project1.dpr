program Project1;

uses
  Vcl.Forms,
  WEBLib.Runner,
  Unit1 in 'Unit1.pas' {Form1: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
  TTMSWebRunner.Execute('http://localhost:8000/$(ProjectName)', tbnDefault);
end.
