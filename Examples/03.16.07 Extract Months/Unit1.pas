unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.StdCtrls, WEBLib.StdCtrls, Vcl.Controls;

type
  TForm1 = class(TWebForm)
    WebListBox1: TWebListBox;
    WebButton1: TWebButton;
    procedure WebButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses WEBLib.WebTools;

{$R *.dfm}

procedure TForm1.WebButton1Click(Sender: TObject);
var
  m: Integer;
begin
 for m := 1 to 12 do
 begin
   WebListbox1.Items.Add(
    IntToStr(m) + ' - ' +
    GetLocaleShortMonthName(m) +
    '-' +
     GetLocaleLongMonthName(m)
    );

 end;
end;


end.