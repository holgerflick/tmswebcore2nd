object Form1: TForm1
  Width = 640
  Height = 497
  CSSLibrary = cssBootstrap
  ElementFont = efCSS
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  OnDestroy = WebFormDestroy
  object Image: TWebImageControl
    Left = 8
    Top = 109
    Width = 300
    Height = 339
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    ChildOrder = 2
    OnLoaded = ImageLoaded
  end
  object WebButton1: TWebButton
    Left = 56
    Top = 24
    Width = 209
    Height = 49
    Caption = 'Download image.'
    ElementClassName = 'btn btn-light'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton1Click
  end
  object Progress: TWebProgressBar
    Left = 8
    Top = 79
    Width = 300
    Height = 24
    ElementClassName = 'progress'
    ChildOrder = 1
    ElementBarClassName = 'progress-bar'
    Style = pbstDiv
  end
  object Request: TWebHttpRequest
    ResponseType = rtBlob
    OnProgress = RequestProgress
    Left = 216
    Top = 192
  end
end
