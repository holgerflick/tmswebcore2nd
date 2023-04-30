unit Unit1;

interface

uses
  System.SysUtils, System.Classes, WEBLib.Graphics, WEBLib.Controls, WEBLib.Forms, WEBLib.Dialogs,
  WEBLib.ExtCtrls, Vcl.Controls, WEBLib.StdCtrls, Vcl.StdCtrls, WEBLib.ComCtrls;

type
  TForm1 = class(TWebForm)
    Edit: TWebEdit;
    Spin: TWebSpinEdit;
    Track: TWebTrackBar;
    Progress: TWebProgressBar;
    procedure WebFormShow(Sender: TObject);
    procedure WebFormCreate(Sender: TObject);
    procedure SpinChange(Sender: TObject);
    procedure TrackChange(Sender: TObject);
    procedure EditExit(Sender: TObject);
  private
    // value of all controls
    FValue: Integer;

    // update all controls with value
    procedure UpdateGui;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.EditExit(Sender: TObject);
var
  LValue: Integer;

begin
  // edit value is changed when user leaves
  // edit control

  // try to convert
  // - invalid value will set value to 0
  try
    LValue := StrToInt( Edit.Text );
  except on E: EConvertError do
    LValue := 0;
  end;

  if (LValue >= 0 ) and ( LValue <= 100 ) then
  begin
    FValue := LValue;
    UpdateGui;
  end;
end;

procedure TForm1.SpinChange(Sender: TObject);
begin
  FValue := Spin.Value;
  UpdateGui;
end;

procedure TForm1.TrackChange(Sender: TObject);
begin
  FValue := Track.Position;
  UpdateGui;
end;

procedure TForm1.UpdateGui;
begin
  Spin.Value := FValue;
  Track.Position := FValue;
  Edit.Text := IntToStr( FValue );

  // also update Progress Bar
  Progress.Position := FValue;
end;

procedure TForm1.WebFormCreate(Sender: TObject);
begin
  // initialize value
  FValue := 0;

  // set range for track bar
  Track.Min := 0;
  Track.Max := 100;

  // set range for spin edit
  Spin.MinValue := 0;
  Spin.MaxValue := 100;

  // set range for Progress Bar
  Progress.Min := 0;
  Progress.Max := 100;
end;

procedure TForm1.WebFormShow(Sender: TObject);
begin
  // init gui when form is shown
  UpdateGui;
end;

end.