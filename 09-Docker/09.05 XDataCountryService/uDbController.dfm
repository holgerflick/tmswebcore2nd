object DbController: TDbController
  OnCreate = DataModuleCreate
  Height = 157
  Width = 283
  object Manager: TFDManager
    ConnectionDefFileAutoLoad = False
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Left = 56
    Top = 56
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    DriverID = 'Maria'
    VendorLib = '/usr/lib/x86_64-linux-gnu/libmariadb.so'
    Left = 168
    Top = 56
  end
end
