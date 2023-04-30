object Form1: TForm1
  Left = 0
  Top = 0
  Width = 640
  Height = 480
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TabOrder = 1
  OnCreate = ElectronFormCreate
  object WebLabel1: TWebLabel
    Left = 32
    Top = 40
    Width = 96
    Height = 13
    Caption = 'Main Window Form1'
  end
  object WebButton1: TWebButton
    Left = 32
    Top = 96
    Width = 153
    Height = 25
    Color = clNone
    Caption = 'Open 2nd form'
    ChildOrder = 1
    OnClick = WebButton1Click
  end
  object SecondWindow: TElectronBrowserWindow
    MaxHeight = 0
    MaxWidth = 0
    OnActivate = SecondWindowActivate
    Left = 96
    Top = 392
  end
end
