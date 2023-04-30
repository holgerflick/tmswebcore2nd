object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Width = 640
  Height = 631
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
    Height = 631
    ElementID = 'idChart'
    HeightStyle = ssAuto
    WidthStyle = ssAuto
    Align = alClient
    Series = <>
    OnSelect = ChartSelect
    ExplicitWidth = 521
    ExplicitHeight = 321
  end
  object Connection: TXDataWebConnection
    URL = 'http://localhost:80/flix'
    Connected = True
    OnConnect = ConnectionConnect
    Left = 64
    Top = 376
  end
  object Client: TXDataWebClient
    Connection = Connection
    Left = 144
    Top = 376
  end
end
