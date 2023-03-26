program XDataLinuxEx;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Sparkle.Uri {ServerContainer: TDataModule},
  uConsoleController in 'uConsoleController.pas',
  uExampleService in 'uExampleService.pas',
  uExampleServiceImpl in 'uExampleServiceImpl.pas',
  uLinuxServerContainer in 'uLinuxServerContainer.pas';

var
  LServer: TServerContainer;
  LConsole: TConsoleController;
  LStop: Boolean;


begin
  ReportMemoryLeaksOnShutdown := True;

  LConsole := TConsoleController.Create;
  try
    try
      if ( ParamCount = 0 ) then
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
        WriteLn( '>> Server is in infinite loop. Kill process to STOP service.');
        while true do
        begin
          sleep(10000)
        end;
      end;
    except
      on E: Exception do
        Writeln(E.ClassName, ': ', E.Message);
    end;

  finally
    LConsole.Free;
  end;
end.
