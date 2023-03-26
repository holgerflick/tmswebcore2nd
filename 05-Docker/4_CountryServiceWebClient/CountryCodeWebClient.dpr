program CountryCodeWebClient;

uses
  Vcl.Forms,
  WEBLib.Forms,
  uFrmMain in 'uFrmMain.pas' {FrmMain: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
