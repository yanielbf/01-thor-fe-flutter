import 'package:meta/meta.dart';

class Dish {
  Dish({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.price,
    @required this.quantity,
    @required this.type,
    @required this.related,
  });

  int id;
  String name;
  String image;
  int price;
  int quantity;
  String type;
  Map<String, List<Dish>> related;

  factory Dish.fromJson(Map<String, dynamic> json) => Dish(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        price: json["price"],
        quantity: json["quantity"] ?? 0,
        type: json["type"],
        related: {},
      );

  factory Dish.fromJsonWithRelated(Map<String, dynamic> json) {
    Map<String, List<Dish>> related = {};
    (json["related"] as Map).forEach((key, value) {
      List<Dish> dishes = (value as List).map((e) => Dish.fromJson(e)).toList();
      related[key] = dishes;
    });
    return Dish(
      id: json["id"],
      name: json["name"],
      image: json["image"],
      price: json["price"],
      quantity: json["quantity"] ?? 0,
      type: json["type"],
      related: related,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "price": price,
        "quantity": quantity,
        "type": type,
      };
}
