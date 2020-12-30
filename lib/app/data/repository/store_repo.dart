import 'package:thor_flutter/app/data/model/mainscreen.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/data/provider/remote/store_api.dart';

class StoreRepo {
  final StoreAPI _storeApi = Get.find<StoreAPI>();

  Future<MainScreen> requestDailyMenu() async {
    return _storeApi.requestMainScreenProducts();
  }

  Future<List<Product>> requestProductsByategory(int id) async {
    return _storeApi.requestProductsByCategory(id);
  }

  Future<Product> requestProductDetail(int id) async {
    return _storeApi.requestProductDetail(id);
  }
}
