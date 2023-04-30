object FrmMain: TFrmMain
  Width = 488
  Height = 112
  CSSLibrary = cssBootstrap
  ElementFont = efCSS
  OnCreate = WebFormCreate
  OnShow = WebFormShow
  object txtCode: TWebEdit
    Left = 48
    Top = 8
    Width = 217
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    ElementClassName = 'form-control'
    ElementID = 'search'
    ElementFont = efCSS
    Enabled = False
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    MaxLength = 2
    WidthPercent = 100.000000000000000000
  end
  object btnSearch: TWebButton
    Left = 271
    Top = 8
    Width = 96
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Search'
    ChildOrder = 1
    ElementClassName = 'btn btn-success'
    ElementID = 'buttonSearch'
    ElementFont = efCSS
    Enabled = False
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnSearchClick
  end
  object txtCountry: TWebEdit
    Left = 48
    Top = 56
    Width = 319
    Height = 22
    Anchors = [akLeft, akTop, akRight]
    ChildOrder = 2
    ElementClassName = 'form-control'
    ElementID = 'country'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    ReadOnly = True
    WidthPercent = 100.000000000000000000
  end
  object Connection: TXDataWebConnection
    OnConnect = ConnectionConnect
    OnError = ConnectionError
    Left = 400
    Top = 56
  end
  object Client: TXDataWebClient
    Connection = Connection
    Left = 400
    Top = 8
  end
end
