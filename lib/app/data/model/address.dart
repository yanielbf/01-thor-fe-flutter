import 'package:meta/meta.dart';

class Address {
  Address({@required this.id, @required this.text});

  int id;
  String name;
  String text;

  factory Address.fromJson(Map<String, dynamic> json) =>
      Address(id: json["id"], text: json["text"]);

  Map<String, dynamic> toJson() {
    return {"id": id, "text": text};
  }
}
