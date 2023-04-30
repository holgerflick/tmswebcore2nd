program XDataSchoolsServer;

uses
  Vcl.Forms,
  uServerContainer in 'uServerContainer.pas' {ServerContainer: TDataModule},
  uMainForm in 'uMainForm.pas' {MainForm},
  Vcl.Themes,
  Vcl.Styles,
  uSchool in 'uSchool.pas',
  uChartService in 'uChartService.pas',
  uChartServiceImpl in 'uChartServiceImpl.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TServerContainer, ServerContainer);
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
