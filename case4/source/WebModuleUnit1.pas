unit WebModuleUnit1;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, Data.DB, Data.Win.ADODB;

type
  TWebModule1 = class(TWebModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
    procedure LogToFile(const Msg: string);
    procedure ConnectToDatabase;
    function GetDatabaseDataAsHTML: string;
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  HTML: string;
begin
//  Response.Content :=
//    '<html>' +
//    '<head><title>Web Server Application</title></head>' +
//    '<body>Hello world!</body>' +
//    '</html>';

    ConnectToDatabase;

    HTML := GetDatabaseDataAsHTML;

//    LogToFile('Success!');

    Response.Content := HTML;
    Response.ContentType := 'text/html';
end;

procedure TWebModule1.LogToFile(const Msg: string);
var
  LogFile: TextFile;
begin
  AssignFile(LogFile, 'C:\TestIIS\myapp\logfile.txt');
  if FileExists('C:\TestIIS\myapp\logfile.txt') then
    Append(LogFile)
  else
    Rewrite(LogFile);
  try
    Writeln(LogFile, DateTimeToStr(Now) + ': ' + Msg);
  finally
    CloseFile(LogFile);
  end;
end;

procedure TWebModule1.ConnectToDatabase;
begin
  try
    // Проверяем, открыто ли соединение
    if ADOConnection1.Connected then
      ADOConnection1.Connected := False;  // Закрываем открытое соединение

    // Открываем соединение
    ADOConnection1.Connected := True;

    // Открываем запрос и загружаем данные
    ADOQuery1.SQL.Text := 'SELECT CustomerID, FirstName, LastName FROM Customers';
    ADOQuery1.Open;

    LogToFile('Query executed successfully.');

  except
    on E: Exception do
      LogToFile('Error connecting to database: ' + E.Message);
  end;
end;

function TWebModule1.GetDatabaseDataAsHTML: string;
begin
  try
    Result := '<html><body>';
    Result := Result + '<h1>Data from Database</h1>';
    while not ADOQuery1.Eof do
    begin
      Result := Result + '<p>Customer ID: ' + ADOQuery1.FieldByName('CustomerID').AsString +
                ', Name: ' + ADOQuery1.FieldByName('FirstName').AsString +
                ' ' + ADOQuery1.FieldByName('LastName').AsString + '</p>';
      ADOQuery1.Next;
    end;
    Result := Result + '</body></html>';
  except
    on E: Exception do
      LogToFile('Error when forming HTML: ' + E.Message);
  end;
end;

end.
