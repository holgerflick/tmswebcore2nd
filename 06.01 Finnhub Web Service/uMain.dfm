object FrmMain: TFrmMain
  Width = 378
  Height = 177
  Caption = 'Holger'#39's Quick Stock Lookup'
  CSSLibrary = cssBootstrap
  ElementFont = efCSS
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  OnCreate = WebFormCreate
  object btnUpdate: TWebButton
    Left = 24
    Top = 24
    Width = 121
    Height = 41
    Caption = 'Update'
    ElementID = 'btnUpdate'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnClick = btnUpdateClick
  end
  object txtSymbol: TWebEdit
    Left = 24
    Top = 88
    Width = 121
    Height = 22
    ChildOrder = 1
    ElementID = 'txtSymbol'
    ElementFont = efCSS
    HeightStyle = ssAuto
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    OnKeyPress = txtSymbolKeyPress
  end
  object dsStock: TWebClientDataSet
    OnCalcFields = dsStockCalcFields
    Params = <>
    Left = 176
    Top = 24
    object dsStocko: TFloatField
      DisplayLabel = 'Open:'
      FieldName = 'o'
    end
    object dsStockh: TFloatField
      DisplayLabel = 'High:'
      FieldName = 'h'
    end
    object dsStockl: TFloatField
      DisplayLabel = 'Low:'
      FieldName = 'l'
    end
    object dsStockc: TFloatField
      DisplayLabel = 'Current:'
      FieldName = 'c'
    end
    object dsStockd: TFloatField
      DisplayLabel = 'Change:'
      FieldName = 'd'
    end
    object dsStockdp: TFloatField
      DisplayLabel = 'Change %:'
      FieldName = 'dp'
    end
    object dsStockpc: TFloatField
      DisplayLabel = 'Prev. Close:'
      FieldName = 'pc'
    end
    object dsStockdatetime: TDateTimeField
      Tag = 1
      FieldKind = fkCalculated
      FieldName = 'datetime'
      Calculated = True
    end
    object dsStockt: TIntegerField
      Tag = 1
      FieldName = 't'
    end
  end
  object Request: TWebHttpRequest
    ResponseType = rtJSON
    Left = 248
    Top = 24
  end
  object Storage: TWebLocalStorage
    Left = 176
    Top = 88
  end
end
