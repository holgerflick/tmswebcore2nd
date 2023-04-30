unit uMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, Vcl.Controls, Vcl.StdCtrls, WEBLib.StdCtrls, WEBLib.Dialogs,
  WEBLib.LocalFiles;

type
  TForm1 = class(TWebForm)
    WebButton1: TWebButton;
    TextFile: TWebLocalTextFile;
    procedure WebButton1Click(Sender: TObject);
  private
    [async]
    procedure DoConfirm;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.DoConfirm;
var
  LResult : TModalResult;
  LWeek: String;
begin
//  LResult := await(
//    TModalResult,
//    MessageDlgAsync( 'Do you want to continue?', mtConfirmation, [mbYes,mbNo] )
//  );

//  if LResult = mrYes then
//  begin
//    ShowMessage( 'Clicked YES' );
//  end
//  else
//  begin
//    ShowMessage( 'Clicked NO' );
//  end;

  LResult := await ( TModalResult,
    InputMessageDlgAsync( 'Pool closure', mtConfirmation, [mbOK, mbCancel], LWeek, itWeek )
  );

//  ShowMessage( LName );
end;

procedure TForm1.WebButton1Click(Sender: TObject);
begin
  DoConfirm;
end;

end.
