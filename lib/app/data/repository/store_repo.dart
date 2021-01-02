import 'package:thor_flutter/app/data/model/category.dart';
import 'package:thor_flutter/app/data/model/mainscreen.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/data/provider/remote/store_api.dart';

class StoreRepo {
  final StoreAPI _storeApi = Get.find<StoreAPI>();

  Future<MainScreen> requestDailyMenu() async {
    return _storeApi.requestMainScreenProducts();
  }

  Future<List<Product>> requestProductsByCategory(int id) async {
    return _storeApi.requestProductsByCategory(id);
  }

  Future<Product> requestProductDetail(int id) async {
    return _storeApi.requestProductDetail(id);
  }

  Future<List<Category>> requestRootCategories() async {
    return _storeApi.requestRootCategories();
  }

  Future<List<Category>> requestChildrenCategories(int id) async {
    return _storeApi.requestChildrenCategories(id);
  }

  Future<List<Product>> requestFavorites() async {
    return _storeApi.requestFavorites();
  }

  Future<void> requestAddToCart(
      int productId, String name, double price, double tax) async {
    return _storeApi.requestAddToCart(productId, name, price, tax);
  }
}
