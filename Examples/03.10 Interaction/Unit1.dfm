object Form1: TForm1
  Left = 0
  Top = 0
  Width = 287
  Height = 254
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TabOrder = 1
  OnCreate = WebFormCreate
  OnShow = WebFormShow
  object Edit: TWebEdit
    Left = 8
    Top = 24
    Width = 150
    Height = 21
    TabOrder = 0
    Text = 'Edit'
    OnExit = EditExit
  end
  object Spin: TWebSpinEdit
    Left = 8
    Top = 68
    Width = 150
    Height = 22
    AutoSize = False
    BorderStyle = bsSingle
    Color = clWhite
    Increment = 1
    MaxValue = 100
    MinValue = 0
    TabOrder = 1
    Value = 0
    OnChange = SpinChange
  end
  object Track: TWebTrackBar
    Left = 8
    Top = 120
    Width = 150
    Height = 20
    Max = 10
    Min = 0
    Position = 0
    TabOrder = 2
    OnChange = TrackChange
  end
  object Progress: TWebProgressBar
    Left = 8
    Top = 168
    Width = 150
    Height = 24
  end
end
