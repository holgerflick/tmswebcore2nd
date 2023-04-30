program WebCharting;

uses
  Vcl.Forms,
  WEBLib.Forms,
  Unit2 in 'Unit2.pas' {Form2: TWebForm} {*.html},
  uFrmSchools in 'uFrmSchools.pas' {FrmSchools: TWebForm} {*.html};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
