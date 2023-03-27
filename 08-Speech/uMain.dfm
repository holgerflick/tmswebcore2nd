object Form1: TForm1
  Width = 601
  Height = 480
  CSSLibrary = cssBootstrap
  ElementFont = efCSS
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  object btnSpeak: TWebButton
    Left = 32
    Top = 89
    Width = 529
    Height = 49
    Caption = 'Talk'
    ElementClassName = 'btn btn-light'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnSpeakClick
  end
  object lbVoices: TWebListBox
    Left = 32
    Top = 159
    Width = 529
    Height = 313
    ElementClassName = 'form-control'
    ElementFont = efCSS
    HeightPercent = 100.000000000000000000
    ItemHeight = 18
    WidthPercent = 100.000000000000000000
    OnClick = lbVoicesClick
    ItemIndex = -1
  end
  object txtPhrase: TWebEdit
    Left = 32
    Top = 40
    Width = 529
    Height = 22
    ChildOrder = 2
    ElementClassName = 'form-control'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    Text = 'Who builds the best frameworks?'
    WidthPercent = 100.000000000000000000
  end
  object Speech: TWebSpeechSynthesis
    OnVoicesReady = SpeechVoicesReady
    Left = 144
    Top = 216
  end
end
