import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'pushentry.dart';

class NewEntryScreen extends StatefulWidget {
  const NewEntryScreen({Key? key, required this.appSetUser}) : super(key: key);
  final String appSetUser;

  @override
  State<NewEntryScreen> createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  String _cost = "";
  late XFile? image = null;
  final ImagePicker _picker = ImagePicker();

  void getImage(bool fromCamera) async
  {
    image = await _picker.pickImage(source: ((fromCamera)? ImageSource.camera : ImageSource.gallery));
    setState(() {});
  }

  Future<void> getLostData() async
  {
    final LostDataResponse response = await _picker.retrieveLostData();

    if (response.isEmpty)
    {
      return;
    }
    if (response.file != null)
    {
      setState(() {
        image = response.file;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) getLostData(); //this apparently only needs to happen on android according to image_picker plugin's page
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Podaj kwotę: "),
            SizedBox(
              width: 100,
              child:  TextFormField(
                onChanged: (text) => _cost = text,
                autocorrect: false,
                enableIMEPersonalizedLearning: false,
                enableInteractiveSelection: false,
                enableSuggestions: false,
                textAlign: TextAlign.center,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: false),
              ),
            ),
            (image == null)? ElevatedButton(onPressed: () { getImage(false); }, child: const Text("dodaj zdjęcie z galerii"))     : const SizedBox(height: 0),
            (image == null)? ElevatedButton(onPressed: () { getImage(true);  }, child: const Text("zrób zdjęcie aparatem teraz")) : const Text("\nzdjęcie jest załączone\nwróć do menu aby je usunąć\n"),
            ElevatedButton(
              onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PushedEntryScreen(pubItem: SubmitItem(username: widget.appSetUser, cost: _cost, image: image))) ); },
              child: const Text("dodaj")),
            ElevatedButton(onPressed: () { Navigator.pop(context); }, child: const Text("powrót")),
          ],
        ),
      ));
  }
}