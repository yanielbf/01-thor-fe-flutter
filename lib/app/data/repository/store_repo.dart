import 'package:thor_flutter/app/data/model/cart.dart';
import 'package:thor_flutter/app/data/model/category.dart';
import 'package:thor_flutter/app/data/model/mainscreen.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/data/provider/remote/store_api.dart';

class StoreRepo {
  final StoreAPI _storeApi = Get.find<StoreAPI>();

  Future<MainScreen> requestMainScreenProducts() async {
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

  Future<Cart> requestCart(int currencyId) {
    return _storeApi.requestCart(currencyId);
  }

  Future<void> requestAddToCart(
      int productId, String name, double price, double tax) async {
    return _storeApi.requestAddToCart(productId, name, price, tax);
  }

  Future<Cart> requestUpdateItemFromCart(
      String rowId, int qty, int currencyId) async {
    return _storeApi.requestUpdateItemFromCart(rowId, qty, currencyId);
  }

  Future<void> requestRemoveFromCart(String rowId) async {
    return _storeApi.requestRemoveFromCart(rowId);
  }

  Future<void> requestDestroyCart() async {
    return _storeApi.requestDestroyCart();
  }

  Future<void> requestCheckout(int currencyId, String comments) async {
    return _storeApi.requestCheckout(currencyId, comments);
  }
}
