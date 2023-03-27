program NavigatorBootEx;

uses
  Vcl.Forms,
  WEBLib.Forms,
  uMain in 'uMain.pas' {FrmMain: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
