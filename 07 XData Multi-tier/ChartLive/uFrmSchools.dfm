object FrmSchools: TFrmSchools
  Left = 0
  Top = 0
  Width = 516
  Height = 316
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TabOrder = 1
  object btnClose: TWebButton
    Left = 0
    Top = 0
    Width = 516
    Height = 25
    Align = alTop
    Caption = 'Close window'
    OnClick = btnCloseClick
  end
  object Grid: TWebDBGrid
    Left = 0
    Top = 25
    Width = 516
    Height = 291
    Align = alClient
    TabOrder = 1
    Columns = <
      item
        DataField = 'NAME'
        Title = 'NAME'
        Width = 200
      end
      item
        DataField = 'ADDRESS'
        Title = 'ADDRESS'
        Width = 100
      end
      item
        DataField = 'CITY'
        Title = 'CITY'
      end
      item
        DataField = 'STUDENTS'
        Title = 'STUDENTS'
      end>
    DefaultRowHeight = 24
    DataSource = DataSource
    ColWidths = (
      64
      200
      100
      64
      64)
  end
  object Connection: TXDataWebConnection
    URL = 'http://localhost:80/flix'
    OnConnect = ConnectionConnect
    Left = 72
    Top = 216
  end
  object DataSet: TXDataWebDataSet
    EntitySetName = 'SCHOOLS'
    Connection = Connection
    Left = 200
    Top = 216
    object DataSetNAME: TStringField
      DisplayWidth = 250
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object DataSetADDRESS: TStringField
      DisplayWidth = 150
      FieldName = 'ADDRESS'
      Required = True
      Size = 50
    end
    object DataSetCITY: TStringField
      FieldName = 'CITY'
      Required = True
      Size = 50
    end
    object DataSetSTUDENTS: TIntegerField
      DisplayWidth = 50
      FieldName = 'STUDENTS'
    end
  end
  object DataSource: TWebDataSource
    DataSet = DataSet
    Left = 288
    Top = 216
  end
end
