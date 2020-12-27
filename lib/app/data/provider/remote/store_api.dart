import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/mainscreen.dart';
import 'package:thor_flutter/app/data/model/product.dart';

class StoreAPI {
  final Dio _dio = Get.find<Dio>();

  Future<MainScreen> requestMainScreenProducts() async {
    var response = await _dio.get('/store/product-main');
    return MainScreen.fromJson(response.data['data']);
  }

  Future<Product> requestProductDetail(int id) async {
    var response = await _dio.get('/store/product-details/$id');
    return Product.fromJson(response.data['data']);
  }
}
