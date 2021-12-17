import 'package:flutter/material.dart';
import 'screens/titlescreen.dart';
import 'classes/settings.dart';

late UserSettings userSettings;
void main() => runApp(const MyApp());

void initSettings()
{
  userSettings = UserSettings(username: "err_def_username", connection: ConnectionSettings());
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