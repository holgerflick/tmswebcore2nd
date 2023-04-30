unit uFrmSchools;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, Vcl.Grids, WEBLib.DBCtrls, Vcl.StdCtrls,
  WEBLib.StdCtrls, Data.DB, WEBLib.DB, XData.Web.JsonDataset, XData.Web.Dataset,
  XData.Web.Connection;

type
  TFrmSchools = class(TWebForm)
    btnClose: TWebButton;
    Grid: TWebDBGrid;
    Connection: TXDataWebConnection;
    DataSet: TXDataWebDataSet;
    DataSetNAME: TStringField;
    DataSetADDRESS: TStringField;
    DataSetCITY: TStringField;
    DataSetSTUDENTS: TIntegerField;
    DataSource: TWebDataSource;
    procedure ConnectionConnect(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  end;

var
  FrmSchools: TFrmSchools;

implementation

{$R *.dfm}

procedure TFrmSchools.btnCloseClick(Sender: TObject);
begin
  self.Close;
end;

procedure TFrmSchools.ConnectionConnect(Sender: TObject);
begin
  DataSet.Load;
end;

end.