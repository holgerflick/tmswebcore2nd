unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, Vcl.Grids, WEBLib.DBCtrls, Data.DB, WEBLib.DB,
  XData.Web.JsonDataset, XData.Web.Dataset, XData.Web.Connection;

type
  TForm1 = class(TWebForm)
    XDataWebConnection1: TXDataWebConnection;
    XDataWebDataSet1: TXDataWebDataSet;
    WebDataSource1: TWebDataSource;
    WebDBGrid1: TWebDBGrid;
    XDataWebDataSet1NAME: TStringField;
    XDataWebDataSet1ADDRESS: TStringField;
    XDataWebDataSet1CITY: TStringField;
    XDataWebDataSet1ZIP: TIntegerField;
    XDataWebDataSet1YEARBUILT: TIntegerField;
    XDataWebDataSet1STUDENTS: TIntegerField;
    XDataWebDataSet1YEARESTABLISHED: TIntegerField;
    procedure XDataWebConnection1Connect(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.XDataWebConnection1Connect(Sender: TObject);
begin
  XDataWebDataSet1.Load;
end;

end.