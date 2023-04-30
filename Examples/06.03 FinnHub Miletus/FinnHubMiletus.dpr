program FinnHubMiletus;

{$R *.dres}

uses
  Vcl.Forms,
  WEBLib.Forms,
  uMain in 'uMain.pas' {FrmMain: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.AutoFormRoute := True;
  Application.MainFormOnTaskbar := True;
  if not Application.NeedsFormRouting then
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
