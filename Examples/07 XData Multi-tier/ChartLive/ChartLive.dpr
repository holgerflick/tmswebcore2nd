program ChartLive;

{$R *.dres}

uses
  Vcl.Forms,
  WEBLib.Forms,
  uMainForm in 'uMainForm.pas' {FrmMain: TWebForm} {*.html},
  uFrmSchools in 'uFrmSchools.pas' {FrmSchools: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
