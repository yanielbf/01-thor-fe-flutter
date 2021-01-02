import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/cart.dart';
import 'package:thor_flutter/app/data/model/category.dart';
import 'package:thor_flutter/app/data/model/mainscreen.dart';
import 'package:thor_flutter/app/data/model/product.dart';

class StoreAPI {
  final Dio _dio = Get.find<Dio>();

  Future<MainScreen> requestMainScreenProducts() async {
    var response = await _dio.get('/store/product-main');
    return MainScreen.fromJson(response.data['data']);
  }

  Future<List<Product>> requestProductsByCategory(int id) async {
    var response = await _dio.get('/store/productsbycategory/$id');
    return (response.data['data'] as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }

  Future<List<Category>> requestRootCategories() async {
    var response = await _dio.get('/categories/rootcategories');
    return (response.data['data'] as List)
        .map((e) => Category.fromJson(e))
        .toList();
  }

  Future<List<Category>> requestChildrenCategories(int id) async {
    var response = await _dio.get('/categories/firstdescendentcategories/$id');
    return (response.data['data'] as List)
        .map((e) => Category.fromJson(e))
        .toList();
  }

  Future<Product> requestProductDetail(int id) async {
    var response = await _dio.get('/store/product-details/$id');
    return Product.fromJson(response.data['data']);
  }

  Future<List<Product>> requestFavorites() async {
    var response = await _dio.get('/favorites/products');
    print(response);
    return (response.data['data'] as List)
        .map((e) => Product.fromJson(e))
        .toList();
  }

  Future<void> requestAddToFavorites() async {}

  Future<void> requestRemoveFromFavorites() async {}

  Future<void> requestDestroyFavorites() async {}

  Future<void> requestAddToCart(
      int productId, String name, double price, double tax) async {
    CartItem item = CartItem(
        id: productId, name: name, qty: 1, options: {'tax': tax}, price: price);
    await _dio.post('/cart/addproducts', data: {
      'items': [item]
    });
  }

  Future<void> requestRemoveFromCart() async {}

  Future<void> requestUpdateItemFromCart() async {}

  Future<void> requestDestroyCart() async {}
}
