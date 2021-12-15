import 'package:bogzaplac/main.dart';
import 'package:bogzaplac/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HistoryItem 
{
  final int id;
  final String username;
  final String date;
  final String cost;
  final int? receiptID;

  HistoryItem({
      required this.id,
      required this.username,
      required this.date,
      required this.cost,
      this.receiptID
  });

  factory HistoryItem.fromJson(Map<String, dynamic> json) => HistoryItem(
        id: json['ID'],
        username: json['Username'],
        date: json['Date'],
        cost: json['Cost'],
        receiptID: json['ReceiptID'],
      );
}

class HistoryScreen extends StatefulWidget 
{
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> 
{
  late Future<List<HistoryItem>> _items;

  Future<List<HistoryItem>> getList() async
  {
    Response response = await Dio().get((connectionSettings.isHttps? "https" : "http") + '://${connectionSettings.host}:${connectionSettings.port}/history');
    return (response.data as List).map((e) => HistoryItem.fromJson(e)).toList();
  }

  Future<void> _pullRefresh() async 
  {
    Future<List<HistoryItem>> retrieved = getList();
    setState(() { _items = retrieved; });
    await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void initState()
  {
    super.initState();
    _items = getList();
  }

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "historia",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: FutureBuilder<List<HistoryItem>>(
                future: _items,
                builder: (context, snapshot) {
                  return RefreshIndicator(child: (snapshot.hasData) ? GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisExtent: 95,
                          childAspectRatio: 5 / 1,
                          crossAxisSpacing: 100,
                          mainAxisSpacing: 5),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        HistoryItem element = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ElevatedButton(
                          key: Key(element.id.toString()),
                          onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(item: element))); },
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            primary: Colors.indigoAccent,
                            padding: const EdgeInsets.fromLTRB(20, 30, 00, 30)
                          ),
                          child: Row(children: [
                            Expanded(
                              flex: 3,
                              child: Column(children: [
                                  Row(children: [
                                    Text(element.username,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0)),
                                  ]),
                                  Row(children: [
                                    Text(element.date)
                                  ]),
                                ]),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(element.cost + " zł  ",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ),
                          ]),
                        ),
                        );
                      })
                  : const Center(child: CircularProgressIndicator()),
                   onRefresh: _pullRefresh);
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),child:
                    ElevatedButton(
                        onPressed: () {
                          setState(() { _items = getList(); });
                        },
                        child: const Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Text("odśwież",
                                style: TextStyle(fontSize: 15)))),),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Padding(
                            padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                            child: Text("powrót",
                                style: TextStyle(fontSize: 15)))),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}