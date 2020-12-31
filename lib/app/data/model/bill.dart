import 'package:meta/meta.dart';

class Bill {
  Bill({
    @required this.id,
    @required this.date,
    @required this.title,
    @required this.pdf,
    @required this.totalAmount,
    @required this.totalItems,
  });

  int id;
  String date;
  String title;
  String pdf;
  String totalAmount;
  int totalItems;

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
        id: json["id"],
        date: json["date"],
        title: json["title"],
        pdf: json["pdf"],
        totalAmount: json["totalAmount"],
        totalItems: json["totalItems"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "title": title,
        "pdf": pdf,
        "totalAmount": totalAmount,
        "totalItems": totalItems,
      };
}
