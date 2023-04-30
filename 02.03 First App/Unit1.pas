unit Unit1;

interface

uses
  System.SysUtils, System.Classes, WEBLib.Graphics, WEBLib.Forms, Vcl.Controls,
  Vcl.StdCtrls, WEBLib.StdCtrls, WEBLib.ExtCtrls, Vcl.Menus, WEBLib.Menus;

type
  TForm1 = class(TWebForm)
    WebButton1: TWebButton;
    WebEdit1: TWebEdit;
    WebEdit2: TWebEdit;
    WebTimer1: TWebTimer;
    btnTimerStart: TWebButton;
    btnTimerStop: TWebButton;
    procedure WebButton1Click(Sender: TObject);
    procedure btnTimerStartClick(Sender: TObject);
    procedure btnTimerStopClick(Sender: TObject);
    procedure WebTimer1Timer(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnTimerStartClick(Sender: TObject);
begin
  WebTimer1.Enabled := true;
end;

procedure TForm1.btnTimerStopClick(Sender: TObject);
begin
  WebTimer1.Enabled := false;
end;

procedure TForm1.WebTimer1Timer(Sender: TObject);
begin
  WebEdit2.Text := TimeToStr( Now );
end;

procedure TForm1.WebButton1Click(Sender: TObject);
begin
  WebEdit1.Text := 'Hello World.';
  WebEdit2.Text := DateTimeToStr(Now);
end;


end.
