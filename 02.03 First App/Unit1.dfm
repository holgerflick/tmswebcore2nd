object Form1: TForm1
  Left = 0
  Top = 0
  Width = 640
  Height = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TabOrder = 1
  object WebButton1: TWebButton
    Left = 24
    Top = 8
    Width = 121
    Height = 25
    Caption = 'WebButton1'
    OnClick = WebButton1Click
    TabOrder = 0
  end
  object WebEdit1: TWebEdit
    Left = 24
    Top = 39
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'WebEdit1'
  end
  object WebEdit2: TWebEdit
    Left = 24
    Top = 66
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'WebEdit2'
  end
  object WebTimer1: TWebTimer
    Left = 144
    Top = 120
    Width = 24
    Height = 24
    Enabled = False
    OnTimer = WebTimer1Timer
  end
  object btnTimerStart: TWebButton
    Left = 24
    Top = 120
    Width = 96
    Height = 25
    Caption = 'Start'
    OnClick = btnTimerStartClick
    TabOrder = 4
  end
  object btnTimerStop: TWebButton
    Left = 24
    Top = 151
    Width = 96
    Height = 25
    Caption = 'Stop'
    OnClick = btnTimerStopClick
    TabOrder = 5
  end
end
