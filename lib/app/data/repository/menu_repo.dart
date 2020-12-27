import 'package:thor_flutter/app/data/model/dish.dart';
import 'package:thor_flutter/app/data/provider/remote/menu_api.dart';
import 'package:get/get.dart';

class MenuRepo {
  final MenuAPI _menuApi = Get.find<MenuAPI>();

  Future<List<Dish>> requestDailyMenu() async {
    return _menuApi.requestDailyMenu();
  }

  Future<Dish> requestDishDetail(int id) async {
    return _menuApi.requestDishDetail(id);
  }
}
