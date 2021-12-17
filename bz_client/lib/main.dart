import 'package:flutter/material.dart';
import 'screens/titlescreen.dart';
import 'classes/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

late UserSettings userSettings;
late SharedPreferences prefs;
void main() async
{
  // i think this is kinda dirty way of handling this
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

void initSettings()
{
  userSettings = UserSettings(username: "err_def_username", connection: ConnectionSettings());
  userSettings.username           = prefs.getString("username")   ?? "err_def_username";
  userSettings.connection.host    = prefs.getString("hostname")   ?? "localhost";
  userSettings.connection.port    = prefs.getString("port")       ?? "2137";
  userSettings.connection.isHttps = prefs.getBool("serverHttps")  ?? false;
  userSettings.isFirstRun         = prefs.getBool("isFirstRun")   ?? true;
  userSettings.connection.buildUrl();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initSettings();
    return MaterialApp(
      title: 'Bóg Zapłać',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TitleScreen(),
    );
  }
}