unit uMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, WEBLib.ExtCtrls, Vcl.Controls, Vcl.StdCtrls,
  WEBLib.StdCtrls;

type
  TFrmMain = class(TWebForm)
    WebLabel1: TWebLabel;
    WebEdit1: TWebEdit;
    WebTimer1: TWebTimer;
    procedure WebTimer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.WebTimer1Timer(Sender: TObject);
begin
  WebEdit1.Text := TimeToStr( Now );
end;

end.