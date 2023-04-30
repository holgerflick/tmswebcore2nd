object Form1: TForm1
  Left = 0
  Top = 0
  Width = 934
  Height = 763
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TabOrder = 1
  object Maps: TWebGoogleMaps
    Left = 8
    Top = 8
    Width = 561
    Height = 441
    ElementID = 'idMap'
    APIKey = '--REMOVED--'
    OnMapLoaded = MapsMapLoaded
  end
  object Connection: TXDataWebConnection
    URL = 'http://localhost/flix'
    OnConnect = ConnectionConnect
    Left = 176
    Top = 392
  end
  object dsSchools: TXDataWebDataSet
    AfterOpen = dsSchoolsAfterOpen
    EntitySetName = 'Schools'
    Connection = Connection
    Left = 48
    Top = 392
    object dsSchoolsName: TStringField
      FieldName = 'Name'
      Required = True
      Size = 100
    end
    object dsSchoolsX: TFloatField
      FieldName = 'X'
      Required = True
    end
    object dsSchoolsY: TFloatField
      FieldName = 'Y'
      Required = True
    end
  end
end
