object WebModule1: TWebModule1
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 230
  Width = 415
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=mssql;Persist Security Info=True;' +
      'User ID=IISLOGIN;Initial Catalog=CustomerDB;Data Source=DESKTOP-' +
      'V80B928\SQLEXPRESS;Initial File Name="";Trust Server Certificate' +
      '=True;Server SPN="";Authentication="";Access Token=""'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 176
    Top = 80
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=mssql;Persist Security Info=True;' +
      'User ID=IISLOGIN;Initial Catalog=CustomerDB;Data Source=DESKTOP-' +
      'V80B928\SQLEXPRESS;Initial File Name="";Trust Server Certificate' +
      '=True;Server SPN="";Authentication="";Access Token=""'
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM customers;')
    Left = 272
    Top = 152
  end
end
