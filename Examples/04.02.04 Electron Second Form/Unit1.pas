unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Electron, WEBLib.Dialogs, Vcl.Controls, Vcl.StdCtrls, WEBLib.StdCtrls;

type
  TForm1 = class(TElectronForm)
    WebLabel1: TWebLabel;
    SecondWindow: TElectronBrowserWindow;
    WebButton1: TWebButton;
    procedure ElectronFormCreate(Sender: TObject);
    procedure WebButton1Click(Sender: TObject);
    procedure SecondWindowActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses Unit2;

{$R *.dfm}

procedure TForm1.ElectronFormCreate(Sender: TObject);
begin
  SecondWindow.FormClass := TForm2;
end;

procedure TForm1.SecondWindowActivate(Sender: TObject);
begin
  SecondWindow.SendMessage(DateTimeToStr(Now));
end;

procedure TForm1.WebButton1Click(Sender: TObject);
begin
  SecondWindow.ShowModal;
end;

end.