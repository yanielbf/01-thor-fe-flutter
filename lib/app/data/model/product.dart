import 'package:meta/meta.dart';

class Product {
  Product(
      {@required this.id,
      @required this.name,
      @required this.salesPrice,
      @required this.realStock,
      @required this.discountPercentage,
      @required this.promotional,
      @required this.image,
      this.images,
      this.description,
      this.variations});

  int id;
  String name;
  int salesPrice;
  int realStock;
  int discountPercentage;
  int promotional;
  String image;
  String description;
  List<Product> variations;
  List<String> images;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      name: json["name"],
      salesPrice: json["sales_price"],
      realStock: json["real_stock"],
      discountPercentage: json["discount_percentage"],
      promotional: json["promotional"],
      description: json["description"] != null ? json["description"] : '',
      image: json["image"],
      images: json["images"] != null ? json["images"] : [],
      variations: json["variations"] != null
          ? (json["variations"] as List)
              .map((e) => Product.fromJson(e))
              .toList()
          : []);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "sales_price": salesPrice,
        "real_stock": realStock,
        "discount_percentage": discountPercentage,
        "promotional": promotional,
        "image": image,
        "description": description,
      };
}
