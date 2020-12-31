import 'package:meta/meta.dart';

class SaleOrder {
  SaleOrder({
    @required this.id,
    @required this.date,
    @required this.title,
    @required this.pdf,
    @required this.totalAmount,
    @required this.totalItems,
    @required this.status,
  });

  int id;
  String date;
  String title;
  String pdf;
  String totalAmount;
  String status;
  int totalItems;

  factory SaleOrder.fromJson(Map<String, dynamic> json) => SaleOrder(
        id: json["id"],
        date: json["date"],
        title: json["title"],
        pdf: json["pdf"],
        totalAmount: json["totalAmount"],
        totalItems: json["totalItems"],
        status: json["documentState"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "title": title,
        "pdf": pdf,
        "totalAmount": totalAmount,
        "totalItems": totalItems,
        "status": status
      };
}
