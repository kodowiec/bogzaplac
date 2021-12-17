// things used while contacting with api
// it's easier to store it in one file
// and those are not too complicated so it's good to store them in this one file for now
import 'package:image_picker/image_picker.dart';

class SubmitItem
{
  final String username, cost;
  final String? date;
  final XFile? image;

  SubmitItem({
      required this.username,
      this.date,
      required this.cost,
      this.image
  });
}

class Receipt
{
  final int id;
  final String image;

  Receipt({required this.id, required this.image});

  factory Receipt.fromJson(Map<String, dynamic> json) => Receipt(id: json['ID'], image: json['image']);
}

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

