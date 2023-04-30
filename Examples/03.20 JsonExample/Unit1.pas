unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.StdCtrls, WEBLib.StdCtrls, Vcl.Controls;

type
  TForm1 = class(TWebForm)
    WebMemo1: TWebMemo;
    WebButton1: TWebButton;
    procedure WebButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses
 WebLib.JSON;

procedure TForm1.WebButton1Click(Sender: TObject);
var
  LContact: TJSONObject;
  LAddress : TJSONObject;

  LArray: array of TJSONObject;

  LCell,
  LHome: TJSONObject;
  LPhones: TJSONArray;

begin
  SetLength( LArray, 2 );

  LCell := TJSONObject.Create();
  LCell.AddPair('Type', 'Cell');
  LCell.AddPair('Number', '555-235-1548');

  LHome := TJSONObject.Create();
  LHome.AddPair('Type', 'Home');
  LHome.AddPair('Number', '555-234-4748');

  LPhones := TJSONArray.Create;
  LPhones.AddPair( LCell );


  LAddress := TJSONObject.Create();
  LAddress.AddPair('Street', '4711 Downtown St');
  LAddress.AddPair('Zip', TJSONNumber.Create( 99888 ) );

  LContact := TJSONObject.Create();
  LContact.AddPair('FirstName', 'Holger');
  LContact.AddPair('LastName', 'Flick');
  LContact.AddPair( 'Address', LAddress);
  LContact.AddPair( 'Phones', TJSONArray.Create(LPhones) );

  WebMemo1.Lines.Text := LContact.ToJSON;

  LAddress.Free;
  LCell.Free;
  LHome.Free;
  LContact.Free;

end;

end.