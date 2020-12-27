import 'package:thor_flutter/app/data/model/dish.dart';
import 'package:meta/meta.dart';

class OrderItem {
  OrderItem({
    @required this.quantity,
    @required this.dishes,
    @required this.dishesId,
  });

  int quantity;
  List<Dish> dishes;
  List<int> dishesId;

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        quantity: json["quantity"],
        dishes: List<Dish>.from(json["dishes"].map((x) => Dish.fromJson(x))),
        dishesId: List<int>.from(json["dishesId"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "dishes": List<dynamic>.from(dishes.map((x) => x.toJson())),
        "dishesId": List<dynamic>.from(dishesId.map((x) => x)),
      };
}
