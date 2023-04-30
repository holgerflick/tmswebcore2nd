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
  object WebMemo1: TWebMemo
    Left = 16
    Top = 8
    Width = 593
    Height = 169
    AutoSize = False
    Lines.Strings = (
      'WebMemo1')
    SelLength = 0
    SelStart = 0
  end
  object WebButton1: TWebButton
    Left = 24
    Top = 208
    Width = 96
    Height = 25
    Caption = 'WebButton1'
    ChildOrder = 1
    OnClick = WebButton1Click
  end
end
