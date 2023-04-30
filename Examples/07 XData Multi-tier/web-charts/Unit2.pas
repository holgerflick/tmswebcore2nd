unit Unit2;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, XData.Web.Client, XData.Web.Connection, Vcl.Controls, Vcl.StdCtrls,
  WEBLib.StdCtrls, WEBLib.GoogleChart;

type
  TForm2 = class(TWebForm)
    Connection: TXDataWebConnection;
    Client: TXDataWebClient;
    Chart: TWebGoogleChart;
    procedure ChartSelect(Sender: TObject; Event: TGoogleChartSelectEventArgs);
    procedure ConnectionConnect(Sender: TObject);
  end;

var
  Form2: TForm2;

implementation
uses uFrmSchools;

{$R *.dfm}

procedure TForm2.ChartSelect(Sender: TObject; Event:
    TGoogleChartSelectEventArgs);

var
  LPIdx,
  LSIdx : Integer;
  LZip: String;

  LFrm: TFrmSchools;

  procedure AfterShowModal(AValue: TModalResult);
  begin

  end;

  // async called OnCreate
  procedure AfterCreate(AForm: TObject);
  var
   LFrm : TFrmSchools;
  begin
    LFrm := (AForm as TFrmSchools);
    LFrm.DataSet.QueryString := '$filter=zip eq ' + LZip;
    LFrm.Connection.Connected := True;
  end;

begin
  LPIdx := Event.PointIndex;
  LSIdx := Event.SeriesIndex;

  LZip := Chart.Series[LSIdx].Values[LPIdx].DataPoint.Title;

  LFrm := TFrmSchools.CreateNew(@AfterCreate);
  LFrm.Popup := true;
  LFrm.ShowModal(@AfterShowModal);

end;

procedure TForm2.ConnectionConnect(Sender: TObject);

  procedure OnResult( Response: TXDataClientResponse );
  var
    i: Integer;

    LArray : TJSArray;
    LItem: TJSObject;

    LRatio: Double;
    LZip: String;

    LSeries: TGoogleChartSeriesItem;

  begin
    Chart.Series.Clear;
    Chart.Title := 'Students per School (grouped by ZIP code)';

    LSeries := Chart.Series.Add;
    LSeries.ChartType := TGoogleChartType.gctBar;
    LSeries.Title := 'Students/School';

    LArray := TJSArray( TJSObject( Response.Result  )  ['value']  );

    for i := 0 to LArray.Length - 1 do
    begin
      LItem := TJSObject( LArray[i] );
      LZip := string( LItem['Zip'] );
      LRatio := double( LItem['Ratio'] );

      LSeries.Values.AddSinglePoint(LRatio, LZip);
    end;
  end;

begin
  Client.RawInvoke(
    'IChartService.GetTotalStudentsZip',
    nil,
    @OnResult);
end;

end.
