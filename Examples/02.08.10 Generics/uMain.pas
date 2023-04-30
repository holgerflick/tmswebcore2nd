unit uMain;

interface

uses
  System.SysUtils,
  System.Classes,

  // non generic:
  //System.Contnrs,

  // generic
  System.Generics.Collections,

  JS,
  Web,
  WEBLib.Graphics,
  WEBLib.Controls,
  WEBLib.Forms,
  WEBLib.Dialogs,
  WEBLib.StdCtrls,

  Vcl.Controls,
  Vcl.StdCtrls

  ;

type
  TAnimal = class
  private
    FName: String;
  public
    property Name: String read FName write FName;
  end;

  TCat = class(TAnimal);

  TDog = class(TAnimal);


  TFrmMain = class(TWebForm)
    Listbox: TWebListBox;
    btnAdd: TWebButton;
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
    procedure DoAdd;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.btnAddClick(Sender: TObject);
begin
  DoAdd;
end;

procedure TFrmMain.DoAdd;
var
//  LNonGenDogs: TObjectList;
  LDogs: TObjectList<TDog>;

begin
//  LNonGenDogs := TObjectList.Create;
//  try
//    LNonGenDogs.Add( TDog.Create );
//    LNonGenDogs.Add( TCat.Create );
//  finally
//    LNonGenDogs.Free;
//  end;

  LDogs := TObjectList<TDog>.Create;
  try
    LDogs.Add( TDog.Create );
//    LDogs.Add( TCat.Create );
  finally
    LDogs.Free;
  end;
end;

end.
