unit uMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Data.DB, WEBLib.CDS, WEBLib.REST, Vcl.StdCtrls,
  WEBLib.StdCtrls, Vcl.Controls, WEBLib.Storage;

type
  TFrmMain = class(TWebForm)
    dsStock: TWebClientDataSet;
    dsStockc: TFloatField;
    dsStockd: TFloatField;
    dsStockdp: TFloatField;
    dsStockh: TFloatField;
    dsStockl: TFloatField;
    dsStocko: TFloatField;
    dsStockpc: TFloatField;
    dsStockdatetime: TDateTimeField;
    dsStockt: TIntegerField;
    Request: TWebHttpRequest;
    btnUpdate: TWebButton;
    txtSymbol: TWebEdit;
    Storage: TWebLocalStorage;
    procedure WebFormCreate(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure dsStockCalcFields(DataSet: TDataSet);
    procedure txtSymbolKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function GetSymbol: String;
    procedure SetSymbol(const Value: String);

    function IsValidSymbol: Boolean;
    procedure IndicateInvSymbol;

    procedure RestoreSymbol;
    procedure SaveSymbol;

    [async]
    procedure RequestSymbol( ASymbol: String );
    procedure UpdateTable( ADataset: TDataset );

    procedure VisResult( IsVisible: Boolean );

    property Symbol: String read GetSymbol write SetSymbol;


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
  SECRET = '***REMOVED***';
  REQ_URL = 'https://finnhub.io/api/v1/quote?symbol=%s&token=%s';
  SKEY = 'StockSymbol';
  SToken = 's';

procedure TFrmMain.WebFormCreate(Sender: TObject);
begin
  VisResult(False);

  RestoreSymbol;
end;

procedure TFrmMain.btnUpdateClick(Sender: TObject);
begin
  RequestSymbol( Symbol );
end;

procedure TFrmMain.dsStockCalcFields(DataSet: TDataSet);
var
  LZulu: TDateTime;

begin
  // web service returns UTC
  LZulu := UnixToDateTime(
    DataSet.FieldByName('t').AsInteger );

  // convert to local time
  DataSet.FieldByName('datetime').AsDateTime :=
    TTimeZone.Local.ToLocalTime(LZulu);
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

function TFrmMain.IsValidSymbol: Boolean;
begin
  Result := ( dsStock.FieldByName('c').AsInteger <> 0 ) ;
end;

procedure TFrmMain.RequestSymbol( ASymbol: String );
var
  LReq: TJSXMLHttpRequest;
  LArray: TJSArray;
  LElement: TJSHTMLElement;

begin
  VisResult(False);

  txtSymbol.ElementHandle.classList.remove('is-invalid');
  Request.ResponseType := rtJSON;
  Request.URL := Format( REQ_URL, [ASymbol, SECRET] );

  LReq := await( TJSXMLHttpRequest, Request.Perform );

  if LReq.Status = 200 then
  begin
    LArray := TJSArray.new( LReq.response );

    dsStock.Close;
    dsStock.Rows := LArray;
    dsStock.Open;

    if IsValidSymbol then
    begin
      LElement := document.getHTMLElementById('outSymbol');
      LElement.innerText := ASymbol;

      UpdateTable(dsStock);
      SaveSymbol;
      VisResult(True);
    end
    else
    begin
      IndicateInvSymbol;
    end;
  end;
end;

procedure TFrmMain.RestoreSymbol;
var
  LValue: String;
begin
  // check query token first
  if HasQueryParam( SToken, LValue ) then
  begin
    Symbol := LValue;
  end
  else
  begin
    Symbol := Storage.GetValue( SKEY );
  end;
end;

procedure TFrmMain.SaveSymbol;
begin
  Storage.SetValue( SKEY, Symbol );
end;

procedure TFrmMain.SetSymbol(const Value: String);
begin
  txtSymbol.Text := Value;
end;

procedure TFrmMain.txtSymbolKeyPress(Sender: TObject; var Key: Char);
begin
  // Enter
  if Key = #13 then
  begin
    RequestSymbol(Symbol);
  end;

  // Esc
  if Key = #27 then
  begin
    Symbol := '';
  end;
end;

procedure TFrmMain.UpdateTable( ADataset: TDataset );
var
  LDate: TJSHTMLElement;
  LTbl: TJSHTMLElement;
  LRow: TJSElement;
  LCell: TJSElement;
  f: Integer;
  LField: TField;

begin
  // get table
  LTbl := document.getHTMLElementById('outValues');

  // clear existing rows - this should only be one
  while LTbl.childElementCount > 0 do
  begin
    LTbl.firstElementChild.remove;
  end;

  // add values to row in case field is not marked with Tag = 1
  for f := 0 to ADataset.FieldCount -1 do
  begin
    LField := ADataset.Fields[f];

    if LField.Tag = 0 then
    begin
      // add a row
      LRow := document.createElement('tr');
      LTbl.append(LRow);

      // description
      LCell := document.createElement('td');
      LCell.className := 'fw-bold';
      LCell.innerText := LField.DisplayLabel;
      LRow.append(LCell);

      // price
      LCell := document.createElement('td');
      LCell.className := 'font-monospace text-end';
      LCell.innerText := Format( '%.2f', [ LField.AsFloat ]);
      LRow.append(LCell);
    end;
  end;

  // write date
  LDate := document.getHTMLElementById('outDt');
  LDate.innerText := '(last update: ' +
    ADataset.FieldByName('datetime').AsString + ')';
end;

procedure TFrmMain.VisResult(IsVisible: Boolean);
begin
  document.getHtmlElementById('divResult').hidden := not IsVisible;
end;

end.
