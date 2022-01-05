import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'history.dart';
import 'newentry.dart';
import 'package:bogzaplac/main.dart';
import 'package:bogzaplac/screens/setup.dart';

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(flex: 2, child: Text("")),
              Expanded(
                flex: 4,
                child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 5 / 1,
                    mainAxisExtent: 50,
                  ),
                  children: [
                    const Text("codename BogZaplac", style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
                    ElevatedButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => NewEntryScreen(appSetUser: userSettings.username))); }, child: const Text("dodaj")),
                    ElevatedButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen())); }, child: const Text("historia")),
                    ElevatedButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const SetupScreen())); }, child: const Text("zmien ustawienia serwera"))
                  ],
                ),
              ),
              const Expanded(flex: 1, child: Text("")),
              (kDebugMode)? Text("bz_client  debug build\nserver: ${userSettings.connection.url}\nusername: ${userSettings.username} ") : const SizedBox(height: 0,),
            ],
          ),
        ),
      ),
    );
  }
}
