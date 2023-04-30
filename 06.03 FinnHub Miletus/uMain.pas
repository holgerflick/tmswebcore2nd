unit uMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Data.DB, WEBLib.CDS, WEBLib.REST, Vcl.StdCtrls,
  WEBLib.StdCtrls, Vcl.Controls, WEBLib.Miletus, WEBLib.WebSocketClient,
  WEBLib.Storage;

type
  TFrmMain = class(TMiletusForm)
    txtSymbol: TWebEdit;
    Socket: TWebSocketClient;
    btnSubscribe: TWebButton;
    dsTrade: TWebClientDataSet;
    dsTradet: TIntegerField;
    dsTradep: TFloatField;
    dsTradev: TFloatField;
    dsTradedatetime: TDateTimeField;
    procedure btnSubscribeClick(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);

    procedure dsQuoteCalcFields(DataSet: TDataSet);
    procedure SocketConnect(Sender: TObject);
    procedure SocketDataReceived(Sender: TObject; Origin: string; SocketData:
        TJSObjectRecord);
    procedure SocketDisconnect(Sender: TObject);
    procedure txtSymbolKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FHeaderRow: TJSElement;
    FBodyRow: TJSElement;

    function GetSymbol: String;
    procedure SetSymbol(const Value: String);

    procedure IndicateInvSymbol;

    procedure ToggleSubscription;

    [async]
    procedure RestoreSymbol;

    [async]
    procedure SaveSymbol;

    procedure UpdateTable( ADataset: TDataset );
    procedure UpdateSubscriptionButton;

    procedure SendSubscription;

    procedure VisResult( IsVisible: Boolean );
    function GetIniFileName: String;

    property Symbol: String read GetSymbol write SetSymbol;
    property IniFileName: String read GetIniFileName;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}


uses
  DateUtils,
  WEBLib.WebTools
  ;


resourcestring
  SECRET = '--REMOVED--';
  SKEY = 'StockSymbol';
  SToken = 's';
  DEF_SECTION = 'Defaults';
  DEF_IDENT_SYMBOL = 'Symbol';

procedure TFrmMain.btnSubscribeClick(Sender: TObject);
begin
  ToggleSubscription;
end;

procedure TFrmMain.WebFormCreate(Sender: TObject);
begin
  VisResult(False);

  ClientWidth := 1024;
  ClientHeight := 768;

  FHeaderRow := nil;

  RestoreSymbol;

  UpdateSubscriptionButton;
end;

procedure TFrmMain.dsQuoteCalcFields(DataSet: TDataSet);
var
  LZulu: TDateTime;

begin
  // web service returns UTC
  LZulu := UnixToDateTime(
    DataSet.FieldByName('t').AsInteger DIV 1000);

  // convert to local time
  DataSet.FieldByName('datetime').AsDateTime :=
    TTimeZone.Local.ToLocalTime(LZulu);
end;

function TFrmMain.GetIniFileName: String;
begin
  Result := ParamStr(0) + '.ini';
end;

function TFrmMain.GetSymbol: String;
begin
  Result := UpperCase( txtSymbol.Text );
end;

procedure TFrmMain.IndicateInvSymbol;
begin
  Symbol := '';
  txtSymbol.ElementHandle.classList.add('is-invalid');
end;

procedure TFrmMain.RestoreSymbol;
var
  LValue: String;
  LIni: TMiletusIniFile;

begin
  // check query token first
  if HasQueryParam( SToken, LValue ) then
  begin
    Symbol := LValue;
  end
  else
  begin
    LIni := TMiletusIniFile.Create( IniFileName );
    try
      Symbol := await( string,
        LIni.ReadString( DEF_SECTION, DEF_IDENT_SYMBOL, '' )
        );
    finally
      LIni.Free;
    end;
  end;
end;

procedure TFrmMain.SaveSymbol;
var
  LIni: TMiletusIniFile;

begin
  if not Symbol.IsEmpty then
  begin
    LIni := TMiletusIniFile.Create( IniFileName );
    try
      await( LIni.WriteString( DEF_SECTION, DEF_IDENT_SYMBOL, Symbol ) );
    finally
      LIni.Free;
    end;
  end;
end;

procedure TFrmMain.SendSubscription;
begin
  // BINANCE:BTCUSDT
  Socket.Send( '{"type":"subscribe", "symbol": "' + Symbol + '"}' );

  document.getElementById('outSymbol').innerText := Symbol;
end;

procedure TFrmMain.SetSymbol(const Value: String);
begin
  txtSymbol.Text := Value;
end;

procedure TFrmMain.SocketConnect(Sender: TObject);
begin
  txtSymbol.Enabled := False;
  console.log('Connected.');

  SendSubscription;

  UpdateSubscriptionButton;
end;

procedure TFrmMain.SocketDataReceived(Sender: TObject; Origin: string;
    SocketData: TJSObjectRecord);
var
  LValue: TJSObject;
  LData: TJSArray;
  LObj: TJSObject;
  LType: String;

begin
  LObj := SocketData.jsobject;

  LValue := TJSObject( TJSJSON.parse( LObj.toString ) );

  console.log( LValue );

  LType :=  js.toString( LValue['type'] );
  if LType = 'trade' then
  begin
    SaveSymbol;

    LData := TJSArray( LValue['data'] );

    dsTrade.Close;
    dsTrade.Rows := LData;
    dsTrade.Open;

    UpdateTable( dsTrade );
    VisResult(True);
  end;
end;

procedure TFrmMain.SocketDisconnect(Sender: TObject);
begin
  txtSymbol.Enabled := True;

  UpdateSubscriptionButton;

  console.log('Disconnected.');
end;

procedure TFrmMain.ToggleSubscription;
begin
  if not Socket.Active then
  begin
    Socket.PathName := '/?token=' + SECRET;
  end;

  Socket.Active := not Socket.Active;
end;

procedure TFrmMain.txtSymbolKeyPress(Sender: TObject; var Key: Char);
begin
  // Esc
  if Key = #27 then
  begin
    Symbol := '';
  end;
end;

procedure TFrmMain.UpdateSubscriptionButton;
begin
  if Socket.Active then
  begin
    btnSubscribe.ElementHandle.classList.remove('btn-success');
    btnSubscribe.ElementHandle.classList.add('btn-danger');
    btnSubscribe.ElementHandle.innerHTML := '<i class="bi bi-stop-fill"></i> Stop';
  end
  else
  begin
    btnSubscribe.ElementHandle.classList.remove('btn-danger');
    btnSubscribe.ElementHandle.classList.add('btn-success');
    btnSubscribe.ElementHandle.innerHTML := '<i class="bi bi-play-fill"></i> Start';
  end;
end;

procedure TFrmMain.UpdateTable( ADataset: TDataset );
var
  LTbl: TJSHTMLElement;
  LRow: TJSElement;
  LCell: TJSElement;
  f: Integer;
  LField: TField;

begin
  // get table
  LTbl := document.getHTMLElementById('outValues');

  // create header
  if not Assigned( FHeaderRow ) then
  begin
    FHeaderRow := document.createElement('thead');
    LTbl.append(FHeaderRow);
    LRow:= document.createElement('tr');
    FHeaderRow.append(LRow);

    FBodyRow := document.createElement('tbody');
    LTbl.append(FBodyRow);

    for f := 0 to ADataset.FieldCount-1 do
    begin
      LField := ADataset.Fields[f];

      if LField.Tag = 0 then
      begin
        LCell := document.createElement('th');
        LCell.className := 'fw-bold';
        LCell.innerText := LField.DisplayLabel;
        LRow.appendChild(LCell);
      end;
    end;
  end;

  ADataset.First;
  while not ADataset.eof do
  begin
    // add values to row in case field is not marked with Tag = 1

    // add a row
    LRow := document.createElement('tr');

    if not Assigned( FBodyRow.firstElementChild ) then
    begin
      FBodyRow.appendChild( LRow )
    end
    else
    begin
      FBodyRow.insertBefore( LRow, FBodyRow.firstChild );
    end;

    // clear out rows at the end
    while FBodyRow.childElementCount > 20 do
    begin
      FBodyRow.lastElementChild.remove;
    end;

    for f := 0 to ADataset.FieldCount -1 do
    begin
      LField := ADataset.Fields[f];

      if LField.Tag = 0 then
      begin
        // value
        LCell := document.createElement('td');
        LCell.className := 'font-monospace';
        LCell.innerText := LField.AsString;

        LRow.append(LCell);
      end;
    end;

    ADataset.Next;
  end;
end;

procedure TFrmMain.VisResult(IsVisible: Boolean);
begin
  document.getHtmlElementById('divResult').hidden := not IsVisible;
end;

initialization
  RegisterClass( TFrmMain );

end.
