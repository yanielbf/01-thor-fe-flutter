import 'package:meta/meta.dart';

class Cart {
  Cart({
    @required this.tax,
    @required this.subtotalPrice,
    @required this.discount,
    @required this.totalPrice,
    @required this.total,
    @required this.items,
  });

  String tax;
  String subtotalPrice;
  String totalPrice;
  String discount;
  int total;
  List<CartItem> items;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        tax: json["tax"],
        subtotalPrice: json["subtotalPrice"],
        discount: json["discount"],
        totalPrice: json["totalPrice"],
        total: json["total"],
        items:
            List<CartItem>.from(json["items"].map((x) => CartItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "tax": tax,
        "subtotalPrice": subtotalPrice,
        "totalPrice": totalPrice,
        "discount": discount,
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
      this.pricePromotional,
      @required this.qty,
      this.image,
      this.options});

  String rowId;
  int id;
  String name;
  double price;
  double pricePromotional;
  int qty;
  String image;
  Map<String, dynamic> options;

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
      rowId: json["row_id"],
      id: json["id"],
      name: json["name"],
      price: json["price"].toDouble(),
      qty: json["qty"],
      image: json["image"],
      pricePromotional: json["price_promotional"].toDouble());

  Map<String, dynamic> toJson() => {
        "row_id": rowId,
        "id": id,
        "name": name,
        "price": price,
        "qty": qty,
        "price_promotional": pricePromotional,
      };
}
