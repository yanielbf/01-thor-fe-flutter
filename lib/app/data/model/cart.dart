import 'package:meta/meta.dart';

class Cart {
  Cart({
    @required this.tax,
    @required this.subtotalPrice,
    @required this.totalPrice,
    @required this.total,
    @required this.items,
  });

  String tax;
  String subtotalPrice;
  String totalPrice;
  int total;
  List<CartItem> items;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        tax: json["tax"],
        subtotalPrice: json["subtotalPrice"],
        totalPrice: json["totalPrice"],
        total: json["total"],
        items:
            List<CartItem>.from(json["items"].map((x) => CartItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tax": tax,
        "subtotalPrice": subtotalPrice,
        "totalPrice": totalPrice,
        "total": total,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class CartItem {
  CartItem(
      {this.rowId,
      @required this.id,
      @required this.name,
      this.price,
      @required this.qty,
      this.options});

  String rowId;
  int id;
  String name;
  double price;
  int qty;
  Map<String, dynamic> options;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        rowId: json["rowId"],
        id: json["id"],
        name: json["name"],
        price: json["price"],
        qty: json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "rowId": rowId,
        "id": id,
        "name": name,
        "price": price,
        "qty": qty,
      };
}
