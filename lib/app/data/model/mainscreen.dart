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

  Map<String, dynamic> moreSales;
  Map<String, dynamic> specialOffer;
  Map<String, dynamic> news;
  Map<String, dynamic> waitingStock;
  List<Category> categories;
  List<BannerM> banners;

  factory MainScreen.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> moreSales = {
      'id': json['mas-vendidos']['id'],
      'products': (json['mas-vendidos']['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList()
    };
    Map<String, dynamic> specialOffer = {
      'id': json['oferta-especial']['id'],
      'products': (json['oferta-especial']['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList()
    };
    Map<String, dynamic> news = {
      'id': json['nuevos']['id'],
      'products': (json['nuevos']['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList()
    };
    Map<String, dynamic> waitingStock = {
      'id': json['esperando-por-stock']['id'],
      'products': (json['esperando-por-stock']['products'] as List)
          .map((e) => Product.fromJson(e))
          .toList()
    };
    return MainScreen(
      moreSales: moreSales,
      specialOffer: specialOffer,
      news: news,
      waitingStock: waitingStock,
      categories: (json['categories'] as List)
          .map((e) => Category.fromJson(e))
          .toList(),
      banners:
          (json['banners'] as List).map((e) => BannerM.fromJson(e)).toList(),
    );
  }
}
