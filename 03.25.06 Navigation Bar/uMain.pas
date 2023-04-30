unit uMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.WebCtrls;

type
  TFrmMain = class(TWebForm)
    procedure WebFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InitMenu;

    function OnPricingClick(aEvent: TJSMouseEvent) : Boolean;

    function OnActionClick(aEvent: TJSMouseEvent): Boolean;

  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.InitMenu;
var
  LElement: TJSHTMLElement;

  LRoot: TJSElement;

  LNode: TJSNode;
  i,j: Integer;

  LLi,
  LLink: TJSElement;
  LReq: TJSXMLHttpRequest;
  LTable: TJSElement;
  LRow,
  LCol: TJSElement;

  LHead,
  LBody: TJSElement;
begin
  LElement := document.getHTMLElementById('navbarDropdownMenuLink');
  LElement.innerText := 'Actions';

  LElement := document.getElementById('menPricing') as TJSHTMLElement;
  LElement.onclick := OnPricingClick;

  LRoot := document.getElementById('rootDropDown');

  for i := 1 to 10 do
  begin
    LLi := document.createElement('li');
    LLink := document.createElement('a');
    LLink.className := 'dropdown-item';
    LLink.innerHTML := 'Item ' + IntToStr( i );
    TJSHTMLElement(LLink).onclick :=
      function(aEvent: TJSMouseEvent) : Boolean
      begin
        ShowMessage( 'Clicked' );

        console.log( aEvent.targetElement.attributes['no'] );
      end;

    LLink.setAttribute('no', IntToStr(i) );
    LLi.appendChild(LLink);

    LRoot.appendChild(LLi);
  end;

//  LHead := document.getElementById('gridHead');
//  LBody := document.getElementById('gridBody');
//
//  for i := 0 to 5 do
//  begin
//    LRow := document.createElement('tr');
//    LRow.setAttribute('data', IntToStr(i) );
//    TJSHTMLElement( LRow ).onclick :=
//      function ( AEvent: TJSMouseEvent ):Boolean
//      begin
//
//        ShowMessage( AEvent.targetElement.parentElement.getAttribute('data') );
//      end;
//    for j := 0 to 5 do
//    begin
//      if i = 0 then
//      begin
//        LCol := document.createElement('th');
//        LCol.innerText := 'Header ' + IntToStr(j);
//      end
//      else
//      begin
//        LCol := document.createElement('td');
//        LCol.className := 'text-muted';
//        LCol.innerText := Format( '%d, %d', [ j, i ] );
//      end;
//      LRow.appendChild(LCol);
//    end;
//    if i=0 then
//    begin
//      LHead.appendChild(LRow);
//    end
//    else
//    begin
//      LBody.appendChild(LRow);
//    end;
//  end;
end;

function TFrmMain.OnActionClick(aEvent: TJSMouseEvent): Boolean;
var
  LElement: TJSElement;

begin
  LElement := aEvent.targetElement;
  console.log( LElement );
  ShowMessage( 'Select item ' + LElement.getAttribute('no') );
end;

function TFrmMain.OnPricingClick(aEvent: TJSMouseEvent): Boolean;
begin
  ShowMessage('Pricing clicked');
end;

procedure TFrmMain.WebFormCreate(Sender: TObject);
begin
  InitMenu;

end;

end.
