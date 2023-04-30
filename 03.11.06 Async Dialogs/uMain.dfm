object Form1: TForm1
  Width = 640
  Height = 480
  CSSLibrary = cssBootstrap
  ElementFont = efCSS
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  object WebButton1: TWebButton
    Left = 120
    Top = 120
    Width = 185
    Height = 41
    Caption = 'WebButton1'
    ElementClassName = 'btn btn-light'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = WebButton1Click
  end
  object TextFile: TWebLocalTextFile
    Filter = <>
    Left = 160
    Top = 200
  end
end
