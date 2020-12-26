import 'package:meta/meta.dart';
import 'package:intl/intl.dart';

class Customer {
    Customer({
        @required this.id,
        @required this.name,
        @required this.email,
        @required this.phone,
        this.token,
        this.expirationAt
    });

    int id;
    String name;
    String email;
    String phone;
    String token;
    DateTime expirationAt;

    Customer copyWith({
        int id,
        String name,
        String email,
        String phone,
        String token,
        DateTime expirationAt
    }) => 
        Customer(
            id: id ?? this.id,
            name: name ?? this.name,
            email: email ?? this.email,
            phone: phone ?? this.phone,
            token: token ?? this.token,
            expirationAt: token ?? this.expirationAt,
        );

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        token: json["token"],
        expirationAt: DateFormat('yyyy-MM-dd').parse(json["expiration_at"])
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "token": token,
        "expirationAt": expirationAt
    };
}