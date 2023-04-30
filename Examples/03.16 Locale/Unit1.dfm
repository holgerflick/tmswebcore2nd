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
  object WebLabel1: TWebLabel
    Left = 72
    Top = 21
    Width = 89
    Height = 13
    Caption = 'Short Date Format'
  end
  object WebLabel2: TWebLabel
    Left = 208
    Top = 21
    Width = 86
    Height = 13
    Caption = 'Long Date Format'
  end
  object WebLabel3: TWebLabel
    Left = 72
    Top = 69
    Width = 88
    Height = 13
    Caption = 'Short Time Format'
  end
  object WebLabel4: TWebLabel
    Left = 208
    Top = 69
    Width = 85
    Height = 13
    Caption = 'Long Time Format'
  end
  object WebLabel5: TWebLabel
    Left = 72
    Top = 117
    Width = 35
    Height = 13
    Caption = 'Months'
  end
  object WebLabel6: TWebLabel
    Left = 208
    Top = 117
    Width = 50
    Height = 13
    Caption = 'Weekdays'
  end
  object WebEdit1: TWebEdit
    Left = 72
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'WebEdit1'
  end
  object WebButton1: TWebButton
    Left = 72
    Top = 344
    Width = 257
    Height = 25
    Caption = 'Retrieve Locale Data'
    TabOrder = 1
    OnClick = WebButton1Click
  end
  object WebEdit2: TWebEdit
    Left = 208
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'WebEdit2'
  end
  object WebEdit3: TWebEdit
    Left = 72
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'WebEdit3'
  end
  object WebEdit4: TWebEdit
    Left = 208
    Top = 88
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'WebEdit4'
  end
  object lbMonths: TWebListBox
    Left = 72
    Top = 136
    Width = 121
    Height = 177
    ItemHeight = 13
    ItemIndex = -1
    TabOrder = 5
  end
  object lbWeekdays: TWebListBox
    Left = 208
    Top = 136
    Width = 121
    Height = 177
    ItemHeight = 13
    ItemIndex = -1
    TabOrder = 6
  end
end
