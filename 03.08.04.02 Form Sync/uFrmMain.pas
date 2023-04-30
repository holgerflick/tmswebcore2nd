unit uFrmMain;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.StdCtrls, WEBLib.StdCtrls, Vcl.Controls;

type
  TFrmMain = class(TWebForm)
    txtSubject: TWebEdit;
    txtEmail: TWebEdit;
    txtName: TWebEdit;
    btnSend: TWebButton;
    txtBody: TWebMemo;
    procedure WebFormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InitForm;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.InitForm;
begin
  txtSubject.Text := '';
  txtEmail.Text := '';
  txtName.Text := '';
  txtBody.Lines.Clear;
  btnSend.Caption := '';
end;

procedure TFrmMain.WebFormCreate(Sender: TObject);
begin
  InitForm;
end;

end.
