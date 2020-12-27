import 'package:thor_flutter/app/data/model/address.dart';
import 'package:thor_flutter/app/data/model/order_item.dart';
import 'package:intl/intl.dart';

class Order {
  Order(
      {this.id,
      this.dateDelivery,
      this.hourDelivery,
      this.status,
      this.address,
      this.orderItems});

  int id;
  DateTime dateDelivery;
  String hourDelivery;
  String status;
  Address address;
  List<OrderItem> orderItems;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
      id: json["id"],
      dateDelivery: json["date_delivery"] != null
          ? DateFormat('yyyy-MM-dd').parse(json["date_delivery"])
          : null,
      hourDelivery: json["hour_delivery"],
      status: json['status'],
      address: Address.fromJson(json['address']),
      orderItems: (json['order_items'] as List)
          .map((e) => OrderItem.fromJson(e))
          .toList());

  Map<String, dynamic> toJson() => {
        "id": id,
        "date_delivery": dateDelivery.toString(),
        "hour_delivery": hourDelivery,
        "status": status,
        "address": address.toJson(),
        "order_items": List<dynamic>.from(orderItems.map((x) => x.toJson())),
      };
}
