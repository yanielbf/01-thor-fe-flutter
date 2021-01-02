import 'package:meta/meta.dart';

class Product {
  Product(
      {@required this.id,
      @required this.name,
      @required this.salesPrice,
      @required this.realStock,
      @required this.discountPercentage,
      @required this.primaryTax,
      @required this.promotional,
      @required this.image,
      @required this.rating,
      this.images,
      this.description,
      this.variations});

  int id;
  String name;
  int salesPrice;
  int realStock;
  int rating;
  int discountPercentage;
  int promotional;
  String image;
  String description;
  List<Product> variations;
  List<String> images;
  double primaryTax;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json["id"],
      name: json["name"],
      salesPrice: json["sales_price"],
      realStock: json["real_stock"],
      discountPercentage: json["discount_percentage"],
      promotional: json["promotional"],
      description: json["description"] != null ? json["description"] : '',
      rating: json["rating"],
      primaryTax: json["primary_tax"].toDouble(),
      image: json["image"],
      images: json["images"] != null
          ? (json["images"] as List).map((e) => e).toList().cast<String>()
          : [],
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
