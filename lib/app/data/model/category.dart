import 'package:meta/meta.dart';

class Category {
  Category({
    @required this.id,
    @required this.name,
    @required this.icon,
  });

  int id;
  String name;
  String icon;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "icon": icon,
      };
}
