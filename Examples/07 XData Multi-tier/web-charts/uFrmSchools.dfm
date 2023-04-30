object FrmSchools: TFrmSchools
  Left = 0
  Top = 0
  Width = 517
  Height = 245
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TabOrder = 1
  object Grid: TWebDBGrid
    Left = 0
    Top = 25
    Width = 517
    Height = 220
    Align = alClient
    TabOrder = 0
    Columns = <
      item
        DataField = 'NAME'
        Title = 'Name'
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
      end
      item
        DataField = 'STUDENTS'
        Title = 'Students'
      end>
    DefaultRowHeight = 24
    DataSource = WebDataSource1
    ColWidths = (
      64
      150
      150
      64
      64)
  end
  object WebButton1: TWebButton
    Left = 0
    Top = 0
    Width = 517
    Height = 25
    Align = alTop
    Caption = 'Close'
    OnClick = WebButton1Click
  end
  object Connection: TXDataWebConnection
    URL = 'http://localhost/flix'
    OnConnect = ConnectionConnect
    Left = 24
    Top = 24
  end
  object DataSet: TXDataWebDataSet
    EntitySetName = 'Schools'
    Connection = Connection
    QueryString = '$where=zip eq 33928'
    Left = 144
    Top = 24
    object DataSetADDRESS: TStringField
      FieldName = 'ADDRESS'
      Required = True
      Size = 50
    end
    object DataSetCITY: TStringField
      FieldName = 'CITY'
      Required = True
      Size = 50
    end
    object DataSetNAME: TStringField
      FieldName = 'NAME'
      Required = True
      Size = 100
    end
    object DataSetSTUDENTS: TIntegerField
      FieldName = 'STUDENTS'
    end
  end
  object WebDataSource1: TWebDataSource
    DataSet = DataSet
    Left = 352
    Top = 8
  end
end
