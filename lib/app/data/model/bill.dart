import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class Bill {
  Bill({
    @required this.id,
    @required this.reference,
    @required this.date,
    @required this.title,
    @required this.pdf,
    @required this.totalAmount,
    @required this.totalItems,
  });

  int id;
  String reference;
  String date;
  String title;
  String pdf;
  String totalAmount;
  int totalItems;

  factory Bill.fromJson(Map<String, dynamic> json) => Bill(
        id: json["id"],
        reference: json["reference"],
        date: json["date"] != null
            ? DateFormat('dd-MM-yyyy')
                .format(DateFormat('yyyy-MM-dd').parse(json["date"]))
            : null,
        title: json["title"],
        pdf: json["pdf"],
        totalAmount: json["totalAmount"],
        totalItems: json["totalItems"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reference": reference,
        "date": date,
        "title": title,
        "pdf": pdf,
        "totalAmount": totalAmount,
        "totalItems": totalItems,
      };
}
