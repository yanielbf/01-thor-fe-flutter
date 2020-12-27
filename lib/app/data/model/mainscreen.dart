import 'package:meta/meta.dart';
import 'package:thor_flutter/app/data/model/banner.dart';
import 'package:thor_flutter/app/data/model/category.dart';
import 'package:thor_flutter/app/data/model/product.dart';

class MainScreen {
  MainScreen({
    @required this.moreSales,
    @required this.specialOffer,
    @required this.news,
    @required this.waitingStock,
    @required this.categories,
    @required this.banners,
  });

  List<Product> moreSales;
  List<Product> specialOffer;
  List<Product> news;
  List<Product> waitingStock;
  List<Category> categories;
  List<BannerM> banners;

  factory MainScreen.fromJson(Map<String, dynamic> json) {
    return MainScreen(
      moreSales: (json['mas-vendidos'] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
      specialOffer: (json['oferta-especial'] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
      news: (json['nuevos'] as List).map((e) => Product.fromJson(e)).toList(),
      waitingStock: (json['esperando-por-stock'] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
      categories: (json['categories'] as List)
          .map((e) => Category.fromJson(e))
          .toList(),
      banners:
          (json['banners'] as List).map((e) => BannerM.fromJson(e)).toList(),
    );
  }
}
