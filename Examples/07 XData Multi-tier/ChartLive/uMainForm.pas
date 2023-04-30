unit uMainForm;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.GoogleChart, XData.Web.Client,
  XData.Web.Connection, Vcl.StdCtrls, WEBLib.StdCtrls;

type
  TFrmMain = class(TWebForm)
    Chart: TWebGoogleChart;
    Connection: TXDataWebConnection;
    Client: TXDataWebClient;
    procedure ConnectionConnect(Sender: TObject);
    procedure ChartSelect(Sender: TObject; Event: TGoogleChartSelectEventArgs);
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

uses
  uFrmSchools;

procedure TFrmMain.ChartSelect(Sender: TObject; Event: TGoogleChartSelectEventArgs);
var
  LFrm : TFrmSchools;

  LPIdx,
  LSIdx : Integer;

  LZip: String;

  procedure AfterCreate( AForm: TObject );
  var
    LForm : TFrmSchools;

  begin
    LForm := (AForm as TFrmSchools);

    LForm.DataSet.QueryString := '$filter=zip eq ' + LZip;
    LForm.Connection.Connected := true;
  end;

  procedure AfterShowModal( AValue : TModalResult );
  begin

  end;

begin
  LPIdx := Event.PointIndex;
  LSIdx := Event.SeriesIndex;

  LZip := Chart.Series[LSIdx].Values[ LPIdx ].DataPoint.Title;

  LFrm := TFrmSchools.CreateNew( @AfterCreate );
  LFrm.Popup := true;
  LFrm.ShowModal( @AfterShowModal );
end;

procedure TFrmMain.ConnectionConnect(Sender: TObject);
  procedure OnResult( Response: TXDataClientResponse );
  var
    LSeries : TGoogleChartSeriesItem;
    LArray : TJSArray;
    LItem : TJSObject;

    LRatio : Double;
    LZip : String;

    i : Integer;

  begin
    // check StatusCode...

    Chart.Series.Clear;
    Chart.Title := 'Students per School (grouped by ZIP code)';

    LSeries := Chart.Series.Add;
    LSeries.ChartType := TGoogleChartType.gctBar;
    LSeries.Title := 'Students/ZIP';

    LArray := TJSArray( TJSObject( Response.Result )['value'] );

    for i := 0 to LArray.Length - 1 do
    begin
      LItem := TJSObject( LArray[i] );

      LZip := string( LItem['Zip'] );
      LRatio := double( LItem['Ratio'] );

      LSeries.Values.AddSinglePoint( LRatio, LZip );
    end;
  end;


begin
  Client.RawInvoke(
    'IChartService.GetTotalStudentsZip',
    nil,
    @OnResult
  );


end;

end.