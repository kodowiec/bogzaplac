import 'package:flutter/material.dart';
import 'titlescreen.dart';
import 'settings.dart';

ConnectionSettings connectionSettings = ConnectionSettings();
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