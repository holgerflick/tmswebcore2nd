unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, XData.Web.Client, XData.Web.Connection, Data.DB,
  XData.Web.JsonDataset, XData.Web.Dataset, Vcl.Controls, WEBLib.WebCtrls, WEBLib.ExtCtrls,
  VCL.TMSFNCTypes, VCL.TMSFNCUtils, VCL.TMSFNCGraphics, VCL.TMSFNCGraphicsTypes,
  VCL.TMSFNCCustomControl, VCL.TMSFNCImage, Vcl.Imaging.jpeg, Vcl.StdCtrls, WEBLib.StdCtrls;

type
  TForm1 = class(TWebForm)
    Connection: TXDataWebConnection;
    dsSchools: TXDataWebDataSet;
    dsSchoolsName: TStringField;
    dsSchoolsX: TFloatField;
    dsSchoolsY: TFloatField;
    Maps: TWebGoogleMaps;
    procedure ConnectionConnect(Sender: TObject);
    procedure dsSchoolsAfterOpen(DataSet: TDataSet);
    procedure MapsMapLoaded(Sender: TObject);
  private
    FMapLoaded,
    FDatasetLoaded: Boolean;

    procedure AddMarkers;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.AddMarkers;
var
 i : Integer;
begin
   Maps.ClearMarkers;

   Maps.SetCenter(26.616667, -81.833333);
   Maps.SetZoom(13);

   dsSchools.First;

   while not dsSchools.Eof do
   begin
      Maps.AddMarker(
        dsSchoolsY.AsFloat,
        dsSchoolsX.AsFloat,
        'briefcase-24.png',
        dsSchoolsName.AsString );

      dsSchools.Next;
   end;
end;

procedure TForm1.ConnectionConnect(Sender: TObject);
begin
  dsSchools.Load;
end;

procedure TForm1.dsSchoolsAfterOpen(DataSet: TDataSet);
begin
  AddMarkers;
end;

procedure TForm1.MapsMapLoaded(Sender: TObject);
begin
  Connection.Connected := true;

end;

end.
