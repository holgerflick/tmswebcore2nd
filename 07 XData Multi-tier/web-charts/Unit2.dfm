object Form2: TForm2
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
  object Chart: TWebGoogleChart
    Left = 0
    Top = 0
    Width = 640
    Height = 480
    Align = alClient
    Series = <>
    OnSelect = ChartSelect
  end
  object Connection: TXDataWebConnection
    URL = 'http://localhost/flix'
    Connected = True
    OnConnect = ConnectionConnect
    Left = 48
    Top = 408
  end
  object Client: TXDataWebClient
    Connection = Connection
    Left = 160
    Top = 408
  end
end
