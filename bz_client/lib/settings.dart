class ConnectionSettings {
  String host;
  String port;
  bool isHttps;

  ConnectionSettings({
    this.host = "localhost",
    this.port = "2137",
    this.isHttps = false
  });
}