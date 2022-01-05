import 'package:flutter/material.dart';
import 'package:bogzaplac/main.dart';

class SetupScreen extends StatefulWidget {
  const SetupScreen({Key? key}) : super(key: key);

  @override
  State<SetupScreen> createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen>
{
  late String _host, _port, _username;
  late bool _isHttps = false;

  void saveSettings()
  {
    prefs.setString("username", _username);
    prefs.setString("hostname", _host);
    prefs.setString("port", _port);
    prefs.setBool("serverHttps", _isHttps);
    prefs.setBool("isFirstRun", false);

    //populateSettings();
    if(!populateSettings())
    {
      runApp(MyApp(key: UniqueKey()));
      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyApp(key: UniqueKey(),),)); // << this was bugging out and sending requests 10 times lmao
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("adres serwera: "),
          SizedBox(
              width: 300,
              child:  TextFormField(
                onChanged: (text) => _host = text,
                autocorrect: false,
                enableIMEPersonalizedLearning: false,
                enableSuggestions: false,
                textAlign: TextAlign.center,
                initialValue: (userSettings.connection.host != "localhost")? userSettings.connection.host : null,
              ),
            ),
          const Text("\n\nport serwera: "),
          SizedBox(
              width: 300,
              child:  TextFormField(
                onChanged: (text) => _port = text,
                autocorrect: false,
                enableIMEPersonalizedLearning: false,
                enableInteractiveSelection: false,
                enableSuggestions: false,
                textAlign: TextAlign.center,
                keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
                initialValue: userSettings.connection.port,
              ),
            ),
          userSettings.isFirstRun? const Text("\n\nnazwa uzytkownika: ") : const SizedBox(height: 0,),
          userSettings.isFirstRun? SizedBox(
              width: 300,
              child:  TextFormField(
                onChanged: (text) => _username = text,
                textAlign: TextAlign.center,
              ),
            ) : const SizedBox(height: 0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Czy serwer obsługuje https?"),
              Checkbox(value: _isHttps, onChanged: (value) => setState(() {
                _isHttps = value!;
              }))
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
                  onPressed: saveSettings,
                  child: const Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                      child: Text("zapisz ustawienia", style: TextStyle(fontSize: 15)))),
        ],
      ),),
    );
  }

}
