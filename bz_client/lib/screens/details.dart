import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:bogzaplac/classes/apimodels.dart';
import 'package:bogzaplac/main.dart';

class DetailsScreen extends StatefulWidget
{
  const DetailsScreen({Key? key, required this.item}) : super(key: key);

  final HistoryItem item;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
{
  late Future<Receipt> currRec;

  Future<Receipt> getImage(HistoryItem item) async
  {
    Response response = await Dio().get(userSettings.connection.url + '/receipt/${item.receiptID}');
    return Receipt.fromJson(response.data);
  }

  @override
  void initState()
  {
    super.initState();
    if (widget.item.receiptID != null) currRec = getImage(widget.item);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
            [
              const SizedBox(height: 100),
              Text(widget.item.date.toString()),
              Text(widget.item.username.toString(), style: const TextStyle(fontSize: 30)),
              const Text("dodał kwotę", style: TextStyle(fontSize: 18)),
              Text(widget.item.cost.toString() + " zł\n", style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
              (widget.item.receiptID != null)
                  ? FutureBuilder<Receipt>(
                      future: currRec,
                      builder: (context, snapshot) {
                        return (snapshot.hasData)
                            ? Image.memory(base64Decode(snapshot.data!.image))
                            : const Center(child: CircularProgressIndicator());
                      })
                  : const SizedBox(height: 1),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () { Navigator.pop(context); },
                  child: const Padding(
                      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                      child: Text("powrót", style: TextStyle(fontSize: 15)))),
              const SizedBox(height: 100),
            ]),
          ),
        ),
      );
  }
}
