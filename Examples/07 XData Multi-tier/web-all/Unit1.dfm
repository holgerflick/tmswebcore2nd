object Form1: TForm1
  Left = 0
  Top = 0
  Width = 963
  Height = 480
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TabOrder = 1
  object WebDBGrid1: TWebDBGrid
    Left = 0
    Top = 0
    Width = 963
    Height = 480
    Align = alClient
    Columns = <
      item
        DataField = 'NAME'
        Title = 'NAME'
        Width = 150
      end
      item
        DataField = 'ADDRESS'
        Title = 'ADDRESS'
        Width = 150
      end
      item
        DataField = 'CITY'
        Title = 'CITY'
        Width = 100
      end
      item
        DataField = 'ZIP'
        Title = 'ZIP'
      end
      item
        DataField = 'YEARBUILT'
        Title = 'YEARBUILT'
      end
      item
        DataField = 'STUDENTS'
        Title = 'STUDENTS'
      end
      item
        DataField = 'YEARESTABLISHED'
        Title = 'YEARESTABLISHED'
      end>
    DefaultRowHeight = 24
    DataSource = WebDataSource1
    FixedCols = 0
    TabOrder = 0
    WidthStyle = ssAuto
    ExplicitWidth = 640
    ColWidths = (
      150
      150
      100
      64
      64
      64
      64)
  end
  object XDataWebConnection1: TXDataWebConnection
    URL = 'http://localhost/flix'
    Connected = True
    OnConnect = XDataWebConnection1Connect
    Left = 64
    Top = 368
  end
  object XDataWebDataSet1: TXDataWebDataSet
    EntitySetName = 'Schools'
    Connection = XDataWebConnection1
    Left = 200
    Top = 360
    object XDataWebDataSet1NAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object XDataWebDataSet1ADDRESS: TStringField
      FieldName = 'ADDRESS'
      Required = True
      Size = 50
    end
    object XDataWebDataSet1CITY: TStringField
      FieldName = 'CITY'
      Required = True
      Size = 50
    end
    object XDataWebDataSet1ZIP: TIntegerField
      FieldName = 'ZIP'
    end
    object XDataWebDataSet1YEARBUILT: TIntegerField
      FieldName = 'YEARBUILT'
    end
    object XDataWebDataSet1STUDENTS: TIntegerField
      FieldName = 'STUDENTS'
    end
    object XDataWebDataSet1YEARESTABLISHED: TIntegerField
      FieldName = 'YEARESTABLISHED'
    end
  end
  object WebDataSource1: TWebDataSource
    DataSet = XDataWebDataSet1
    Left = 328
    Top = 352
  end
end
