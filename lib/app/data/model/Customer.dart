import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
import 'package:thor_flutter/app/data/model/address.dart';

class Customer {
  Customer(
      {@required this.id,
      @required this.name,
      @required this.email,
      @required this.phone,
      @required this.address,
      this.token,
      this.expirationAt});

  int id;
  String name;
  String email;
  String phone;
  String token;
  Address address;
  DateTime expirationAt;

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      token: json["token"],
      address: Address.fromJson(json["address"]),
      expirationAt: json["expiration_at"] != null
          ? DateFormat('yyyy-MM-dd').parse(json["expiration_at"])
          : null);

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "phone": phone,
      "token": token,
      "address": address.toJson(),
      "expiration_at": expirationAt.toString()
    };
  }
}
