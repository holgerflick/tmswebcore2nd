object ServerContainer: TServerContainer
  OldCreateOrder = False
  Height = 210
  Width = 431
  object SparkleHttpSysDispatcher: TSparkleHttpSysDispatcher
    Active = True
    Left = 72
    Top = 16
  end
  object XDataServer: TXDataServer
    BaseUrl = 'http://+:80/flix'
    Dispatcher = SparkleHttpSysDispatcher
    Pool = XDataConnectionPool
    DefaultEntitySetPermissions = [List]
    EntitySetPermissions = <>
    Left = 216
    Top = 16
    object XDataServerCORS: TSparkleCorsMiddleware
    end
    object XDataServerLogging: TSparkleLoggingMiddleware
      FormatString = ':method :url :statuscode - :responsetime ms'
      ExceptionFormatString = '(%1:s) %0:s - %2:s'
    end
  end
  object XDataConnectionPool: TXDataConnectionPool
    Connection = AureliusConnection
    Left = 216
    Top = 72
  end
  object AureliusConnection: TAureliusConnection
    DriverName = 'SQLite'
    Params.Strings = (
      'Database=D:\data\schools.db')
    Left = 216
    Top = 128
  end
end
