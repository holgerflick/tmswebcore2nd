unit uMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs;

type
  TFrmMain = class(TWebForm)
    procedure WebFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LogDoc;
    procedure LogBody;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.LogBody;
var
  LElement : TJSHTMLElement;

begin
  LElement := document.body as TJSHTMLElement;

  // <body>...</body>
  console.log( LElement.outerHTML );

  // all content inside body
  console.log( LElement.innerHTML );

  // remove HTML tags
  console.log( LElement.textContent );

end;

procedure TFrmMain.LogDoc;
var
  LElement : TJSHTMLElement;
  i: Integer;
begin
  LElement := document.documentElement as TJSHTMLElement;

  // iterate all elements
  for i := 0 to LElement.children.length -1 do
  begin
    console.log(LElement.children[i] );
  end;
end;

procedure TFrmMain.WebFormCreate(Sender: TObject);
begin
  //LogDoc;

  LogBody;
end;

end.
