unit uMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.StdCtrls, WEBLib.StdCtrls, Vcl.Controls,
  WEBLib.WebCtrls;

type
  TForm1 = class(TWebForm)
    btnSpeak: TWebButton;
    lbVoices: TWebListBox;
    txtPhrase: TWebEdit;
    Speech: TWebSpeechSynthesis;
    procedure btnSpeakClick(Sender: TObject);
    procedure lbVoicesClick(Sender: TObject);
    procedure SpeechVoicesReady(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSpeakClick(Sender: TObject);
begin
  Speech.Speak(txtPhrase.Text);
end;

procedure TForm1.lbVoicesClick(Sender: TObject);
begin
  Speech.Voice := lbVoices.Items[ lbVoices.ItemIndex ];
end;

procedure TForm1.SpeechVoicesReady(Sender: TObject);
var
  i: Integer;

begin
  lbVoices.Items.Clear;
  for i := 0 to Speech.Voices.Count - 1 do
  begin
    lbVoices.Items.Add( Speech.Voices[i] );
  end;
end;

end.
