program XDataLinuxDbEx;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Sparkle.Uri {ServerContainer: TDataModule},
  uConsoleController in 'uConsoleController.pas',
  uDbController in 'uDbController.pas' {DbController: TDataModule},
  uCountryCodeService in 'uCountryCodeService.pas',
  uCountryCodeServiceImpl in 'uCountryCodeServiceImpl.pas',
  uServerContainer in 'uServerContainer.pas';

var
  LServer: TServerContainer;
  LConsole: TConsoleController;
  LStop: Boolean;


begin
  try
    LConsole := TConsoleController.Instance;
    if ParamCount = 0 then
    begin
      repeat
        LConsole.ShowMenu;

        LStop := LConsole.SelectFromMenu;
      until (LStop);

      if LConsole.IsRunning then
      begin
        LConsole.StopService;
      end;
    end
    else
    begin
      // just start server with given URL
      LConsole.URL := TURI.Create(ParamStr(1));
      LConsole.StartService;
      Writeln( '>> Stop container to STOP service. <<');
      while true do
      begin
        sleep(5000)
      end;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
