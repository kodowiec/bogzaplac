import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:bogzaplac/classes/apimodels.dart';
import 'package:bogzaplac/main.dart';

class PushedEntryScreen extends StatefulWidget {
  const PushedEntryScreen({Key? key, required this.pubItem}) : super(key: key);
  final SubmitItem pubItem;
  @override
  State<PushedEntryScreen> createState() => _PushedEntryScreenState();
}

class _PushedEntryScreenState extends State<PushedEntryScreen> {
  Future<int> PostItem() async
  {
    FormData data = FormData.fromMap({
      "Username": widget.pubItem.username,
      "Cost": widget.pubItem.cost,
      "Image": ((widget.pubItem.image != null)? await MultipartFile.fromFile(widget.pubItem.image!.path) : null)
    });

    Response response = await Dio().post(userSettings.connection.url + '/history', data: data);
    return response.data;
  }

  Widget pushedStatus(AsyncSnapshot snapshot)
  {
    if (snapshot.hasData)
    {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.done, color: Colors.green, size: 100,),
            const Text("\nWysłano pomyślnie!\n",style: TextStyle(fontSize: 25), textAlign: TextAlign.center),
            ElevatedButton(onPressed: () { Navigator.pop(context); }, child: const Text("powrót")),
          ],),
      );
    }
    else if (snapshot.hasError)
    {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 100,),
            (kDebugMode)? SizedBox(height: 400, child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Text("${snapshot.error}"),
            ),) : const Text("\nWystąpił błąd podczas przetwarzania!\n", style: TextStyle(fontSize: 25), textAlign: TextAlign.center,),
            ElevatedButton(onPressed: () { Navigator.pop(context); }, child: const Text("powrót")),
          ],
        ),
      );
    }
    else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            Text("\n\nPrzetwarzanie...")
          ]),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
        FutureBuilder<int> (
          future: PostItem(),
          builder: (context, snapshot) => pushedStatus(snapshot),
        ),
      ));
  }
}