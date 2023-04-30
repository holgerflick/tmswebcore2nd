unit uMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, WEBLib.REST, Vcl.Controls, Vcl.StdCtrls,
  WEBLib.StdCtrls, WEBLib.ComCtrls, WEBLib.ExtCtrls, WEBLib.WebCtrls;

type
  TForm1 = class(TWebForm)
    Request: TWebHttpRequest;
    WebButton1: TWebButton;
    Progress: TWebProgressBar;
    Image: TWebImageControl;
    procedure ImageLoaded(Sender: TObject);
    procedure WebFormDestroy(Sender: TObject);
    procedure RequestProgress(Sender: TObject; Position, Total: Int64);
    procedure WebButton1Click(Sender: TObject);
  private
    { Private declarations }
    FURL : String;

    [async]
    procedure DoDownload;
  public
    { Public declarations }

  end;

var
  Form1: TForm1;

implementation

const
  SImageUrl = 'https://images.pexels.com/photos/2091161/pexels-photo-2091161.jpeg?cs=srgb&dl=pexels-matthis-volquardsen-2091161.jpg&fm=jpg&w=6000&h=4000';

{$R *.dfm}

procedure TForm1.WebFormDestroy(Sender: TObject);
begin
  if FURL.Length > 0 then
  begin
    TJSURL.revokeObjectURL(FURL);
  end;
end;

procedure TForm1.DoDownload;
var
  LData: TJSXMLHttpRequest;
  LValue: TJSEvent;

begin
  // assign URL
  Request.URL := SImageURL;

  // assign response type
  Request.ResponseType := rtBlob;

  // configure progress bar
  Progress.Max := await( Integer, Request.GetSize );

  // retrieve size for max of progress bar
  LData := await( TJSXMLHttpRequest, Request.Perform );

  // only go ahead if data has been received
  if LData.Status = 200 then
  begin
    // release old Data URL
    if FURL.Length > 0 then
    begin
      TJSUrl.revokeObjectURL( FURL );
    end;

    // reserve new Data URL
    FURL := TJSUrl.createObjectURL( LData.response );

    // assign Data URL to image control
    Image.URL := FURL;
  end;
end;

procedure TForm1.ImageLoaded(Sender: TObject);
begin
  WebButton1.Caption := 'Loaded.';
end;

procedure TForm1.RequestProgress(Sender: TObject; Position, Total: Int64);
begin
  Progress.Position := Position;
end;

procedure TForm1.WebButton1Click(Sender: TObject);
begin
  DoDownload;
end;

end.
