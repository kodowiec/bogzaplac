import 'package:flutter/material.dart';
import 'screens/titlescreen.dart';
import 'settings.dart';

ConnectionSettings connectionSettings = ConnectionSettings();
String appSetUser = "flutterTest"; //TODO: user specified
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bóg Zapłać',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TitleScreen(),
    );
  }
}