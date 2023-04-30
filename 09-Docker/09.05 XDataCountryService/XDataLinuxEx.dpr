program XDataLinuxEx;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uServerContainer in 'uServerContainer.pas' {ServerContainer: TDataModule},
  Sparkle.Uri {ServerContainer: TDataModule},
  uConsoleController in 'uConsoleController.pas',
  uExampleService in 'uExampleService.pas',
  uExampleServiceImpl in 'uExampleServiceImpl.pas';

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
        sleep(10000)
      end;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
