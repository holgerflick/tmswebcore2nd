object FrmMain: TFrmMain
  Width = 577
  Height = 634
  Caption = 'Holger'#39's Quick Stock Lookup'
  CSSLibrary = cssBootstrap
  ElementFont = efCSS
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  OnCreate = WebFormCreate
  ClientHeight = 596
  ClientWidth = 565
  object txtSymbol: TWebEdit
    Left = 24
    Top = 88
    Width = 121
    Height = 22
    ChildOrder = 1
    ElementID = 'txtSymbol'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnKeyPress = txtSymbolKeyPress
  end
  object btnSubscribe: TWebButton
    Left = 24
    Top = 24
    Width = 121
    Height = 41
    Caption = 'Subscribe'
    ChildOrder = 2
    ElementID = 'btnSubscribe'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnSubscribeClick
  end
  object Socket: TWebSocketClient
    UseSSL = True
    Port = 443
    HostName = 'ws.finnhub.io'
    PathName = '/?token=REMOVED'
    OnConnect = SocketConnect
    OnDisconnect = SocketDisconnect
    OnDataReceived = SocketDataReceived
    Left = 176
    Top = 24
  end
  object dsTrade: TWebClientDataSet
    OnCalcFields = dsQuoteCalcFields
    Params = <>
    Left = 232
    Top = 24
    object dsTradet: TIntegerField
      Tag = 1
      FieldName = 't'
    end
    object dsTradedatetime: TDateTimeField
      DisplayLabel = 'Timestamp'
      FieldKind = fkCalculated
      FieldName = 'datetime'
      Calculated = True
    end
    object dsTradep: TFloatField
      DisplayLabel = 'Price'
      FieldName = 'p'
    end
    object dsTradev: TFloatField
      DisplayLabel = 'Volume'
      FieldName = 'v'
    end
  end
end
