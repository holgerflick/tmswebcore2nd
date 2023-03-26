unit uFrmMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.StdCtrls, WEBLib.StdCtrls, Vcl.Controls,
  XData.Web.Client, XData.Web.Connection;

type
  TFrmMain = class(TWebForm)
    txtCode: TWebEdit;
    btnSearch: TWebButton;
    txtCountry: TWebEdit;
    Connection: TXDataWebConnection;
    Client: TXDataWebClient;
    procedure WebFormShow(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure ConnectionConnect(Sender: TObject);
    procedure ConnectionError(Error: TXDataWebConnectionError);
    procedure btnSearchClick(Sender: TObject);
  private
    { Private declarations }
    procedure ProcessResult( AValue: JSValue );

    procedure EnableInterface;

    [async]
    procedure SearchCode( ACode: String );
  public
    { Public declarations }

  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.btnSearchClick(Sender: TObject);
begin
  SearchCode(UpperCase( txtCode.Text ));
end;

procedure TFrmMain.ConnectionConnect(Sender: TObject);
begin
  EnableInterface;
end;

procedure TFrmMain.ConnectionError(Error: TXDataWebConnectionError);
begin
  ShowMessage( 'Cannot connect to Web services.' );
end;

procedure TFrmMain.EnableInterface;
begin
  btnSearch.Enabled := True;
  txtCode.Enabled := True;
end;

procedure TFrmMain.ProcessResult(AValue: JSValue);
var
  LValueObj: TJSObject;
begin
  LValueObj := TJSObject( AValue );

  txtCountry.Text := string( LValueObj['value'] );
end;

procedure TFrmMain.SearchCode(ACode: String);
var
  LRes: TXDataClientResponse;

begin
  // wait for response!
  LRes := await (
    Client.RawInvokeAsync('ICountryCodeService.GetCountry', [ ACode ] )
    );

  if LRes.StatusCode = 200 then
  begin
    ProcessResult( LRes.Result );
  end;
end;

procedure TFrmMain.WebFormCreate(Sender: TObject);
begin
  // replace with IP of computer running Docker container
  Connection.URL := 'https://beta2.flixengineering.com';
  Connection.Connected := True;
end;

procedure TFrmMain.WebFormShow(Sender: TObject);
begin
  txtCode.SetFocus;
end;

end.
