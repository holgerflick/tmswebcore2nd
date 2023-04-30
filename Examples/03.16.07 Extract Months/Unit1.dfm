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
  object WebListBox1: TWebListBox
    Left = 48
    Top = 17
    Width = 121
    Height = 177
    ItemHeight = 13
    ItemIndex = -1
  end
  object WebButton1: TWebButton
    Left = 48
    Top = 200
    Width = 121
    Height = 25
    Caption = 'WebButton1'
    OnClick = WebButton1Click
  end
end
