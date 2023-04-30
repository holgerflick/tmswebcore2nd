program Project1;

{$R *.dres}

uses
  Vcl.Forms,
  WEBLib.Forms,
  Weblib.WebTools,
  Unit1 in 'Unit1.pas' {Form1: TElectronForm} {*.html},
  Unit2 in 'Unit2.pas' {Form2: TElectronForm} {*.html};

{$R *.res}

var
  s: String;

begin
  Application.Initialize;
  Application.AutoFormRoute := True;
  Application.MainFormOnTaskbar := True;

  if HasQueryParam('form', s) then
    Application.RouteForm(s)
  else
    Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
