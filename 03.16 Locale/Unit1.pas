unit Unit1;

interface

uses
  System.SysUtils, System.Classes, WEBLib.Graphics, WEBLib.Forms, WEBLib.Dialogs,
  Vcl.StdCtrls, WEBLib.StdCtrls, Vcl.Controls;

type
  TForm1 = class(TWebForm)
    WebEdit1: TWebEdit;
    WebButton1: TWebButton;
    WebEdit2: TWebEdit;
    WebEdit3: TWebEdit;
    WebEdit4: TWebEdit;
    lbMonths: TWebListBox;
    lbWeekdays: TWebListBox;
    WebLabel1: TWebLabel;
    WebLabel2: TWebLabel;
    WebLabel3: TWebLabel;
    WebLabel4: TWebLabel;
    WebLabel5: TWebLabel;
    WebLabel6: TWebLabel;
    procedure WebButton1Click(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation
uses WEBLib.WebTools;

{$R *.dfm}

procedure TForm1.WebButton1Click(Sender: TObject);
var
  LWeekday,
  LMonth: String;

  i: Integer;
begin
  WebEdit1.Text := FormatSettings.ShortDateFormat;
  WebEdit2.Text := FormatSettings.LongDateFormat;

  WebEdit3.Text := FormatSettings.ShortTimeFormat;
  WebEdit4.Text := FormatSettings.LongTimeFormat;

  for i := Low(FormatSettings.LongMonthNames) to
           High(FormatSettings.LongMonthNames)  do
  begin
    LMonth := FormatSettings.LongMonthNames[i];
    lbMonths.Items.Add(LMonth);
  end;


  for i := Low(FormatSettings.LongDayNames) to
           High(FormatSettings.LongDayNames) do
  begin
    LWeekday := FormatSettings.LongDayNames[i];
    lbWeekdays.Items.Add(LWeekday);
  end;
end;

end.
