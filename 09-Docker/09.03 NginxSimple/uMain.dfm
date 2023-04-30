object FrmMain: TFrmMain
  Width = 640
  Height = 480
  Caption = 'Nginx Example'
  CSSLibrary = cssBootstrap
  ElementFont = efCSS
  object WebLabel1: TWebLabel
    Left = 16
    Top = 48
    Width = 167
    Height = 13
    Caption = 'This is a TMS WEB Core Application'
    ElementFont = efCSS
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
  end
  object WebEdit1: TWebEdit
    Left = 16
    Top = 104
    Width = 177
    Height = 22
    ChildOrder = 1
    ElementClassName = 'form-control'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    ReadOnly = True
    Text = 'WebEdit1'
    WidthPercent = 100.000000000000000000
  end
  object WebTimer1: TWebTimer
    Enabled = True
    OnTimer = WebTimer1Timer
    Left = 32
    Top = 152
  end
end
