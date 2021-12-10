import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bóg Zapłać',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TitleScreen(),
    );
  }
}

class TitleScreen extends StatefulWidget {
  const TitleScreen({Key? key}) : super(key: key);

  @override
  State<TitleScreen> createState() => _TitleScreenState();
}

class _TitleScreenState extends State<TitleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              const Expanded(flex: 1, child: Text("")),
              Expanded(
                flex: 1,
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 5 / 1,
                    mainAxisExtent: 50,
                  ),
                  children: [
                    const Text("codename BogZaplac", style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
                    ElevatedButton(onPressed: () {}, child: const Text("dodaj")),
                    ElevatedButton(onPressed: () {}, child: const Text("historia")),
                  ],
                ),
              ),
              const Expanded(flex: 1, child: Text("")),
            ],
          ),
        ),
      ),
    );
  }
}
