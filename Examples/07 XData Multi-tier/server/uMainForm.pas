unit uMainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, uServerContainer, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.BaseImageCollection,
  Vcl.ImageCollection, System.ImageList, Vcl.ImgList, Vcl.VirtualImageList;

type
  TMainForm = class(TForm)
    mmInfo: TMemo;
    btStart: TButton;
    btStop: TButton;
    Image1: TImage;
    imgStatus: TImage;
    ImageCollection: TImageCollection;
    procedure Bevel1Gesture(Sender: TObject; const EventInfo: TGestureEventInfo;
        var Handled: Boolean);
    procedure btStartClick(ASender: TObject);
    procedure btStopClick(ASender: TObject);
    procedure FormCreate(ASender: TObject);
  strict private
    procedure UpdateGUI;
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

resourcestring
  SServerStopped = 'Server stopped';
  SServerStartedAt = 'Server started at endpoint ';

procedure TMainForm.Bevel1Gesture(Sender: TObject; const EventInfo:
    TGestureEventInfo; var Handled: Boolean);
begin

end;

{ TMainForm }

procedure TMainForm.btStartClick(ASender: TObject);
begin
  ServerContainer.SparkleHttpSysDispatcher.Start;
  UpdateGUI;
end;

procedure TMainForm.btStopClick(ASender: TObject);
begin
  ServerContainer.SparkleHttpSysDispatcher.Stop;
  UpdateGUI;
end;

procedure TMainForm.FormCreate(ASender: TObject);
begin


  UpdateGUI;
end;

procedure TMainForm.UpdateGUI;
const
  cHttp = 'http://+';
  cHttpLocalhost = 'http://localhost';
var
  LIndex : Integer;
begin


  btStart.Enabled := not ServerContainer.SparkleHttpSysDispatcher.Active;
  btStop.Enabled := not btStart.Enabled;

  if btStart.Enabled then
  begin
    LIndex := 0;
  end
  else
  begin
    LIndex := 1;
  end;

  imgStatus.Picture.Assign( ImageCollection.GetBitmap( LIndex, 128, 128 ) );

  if ServerContainer.SparkleHttpSysDispatcher.Active then
    mmInfo.Lines.Add(
      '[' + DateTimeToStr( Now ) + '] ' +
      SServerStartedAt + StringReplace(
      ServerContainer.XDataServer.BaseUrl,
      cHttp, cHttpLocalhost, [rfIgnoreCase]))
  else
  begin
    mmInfo.Lines.Add(
     '[' + DateTimeToStr( Now ) + '] ' +
     SServerStopped
     );

  end;
end;

end.
