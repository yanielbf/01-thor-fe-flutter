import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

class SaleOrder {
  SaleOrder({
    @required this.id,
    @required this.reference,
    @required this.date,
    @required this.title,
    @required this.pdf,
    @required this.totalAmount,
    @required this.totalItems,
    @required this.status,
  });

  int id;
  String reference;
  String date;
  String title;
  String pdf;
  String totalAmount;
  String status;
  int totalItems;

  factory SaleOrder.fromJson(Map<String, dynamic> json) {
    return SaleOrder(
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
      status: json["documentState"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "reference": reference,
        "title": title,
        "pdf": pdf,
        "totalAmount": totalAmount,
        "totalItems": totalItems,
        "status": status
      };
}
