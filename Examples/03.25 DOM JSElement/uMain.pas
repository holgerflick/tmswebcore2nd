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
    procedure InvalidateText;
    procedure AddClickEvent;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.AddClickEvent;
var
  LButton: TJSHTMLElement;

begin
  LButton := document.getHTMLElementById('btnOne');

  LButton.onclick :=
    function(aEvent: TJSMouseEvent) : Boolean
    begin
      ShowMessage('Click!');
    end;
end;

procedure TFrmMain.InvalidateText;
var
  LElement: TJSHTMLElement;

begin
  LElement := document.getHTMLElementById('txtText');

  LElement.classList.add('is-invalid');
    LElement.classList.add('is-invalid');
      LElement.classList.add('is-invalid');

      LElement.classList.remove('is-invalid');
end;

procedure TFrmMain.LogBody;
var
  LElement : TJSHTMLElement;

  LContainer : TJSHTMLElement;
begin
  LContainer := document.getElementById('container') as TJSHTMLElement;

  console.log( LContainer.hidden );

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

  AddClickEvent;
end;

end.
