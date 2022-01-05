class ConnectionSettings
{
  String host;
  String port;
  bool isHttps;
  String url = "";

  ConnectionSettings({
    this.host = "localhost",
    this.port = "2137",
    this.isHttps = false
  });

  void buildUrl() => url = (isHttps ? "https" : "http") +'://$host:$port';
}

class UserSettings
{
  String username;
  bool isFirstRun = true;
  ConnectionSettings connection;

  UserSettings({
    required this.username,
    required this.connection
  });
}