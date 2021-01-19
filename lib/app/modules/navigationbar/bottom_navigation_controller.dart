import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/modules/cart/cart_controller.dart';
import 'package:thor_flutter/app/modules/favorites/favorites_controller.dart';
import 'package:thor_flutter/app/modules/main/main_controller.dart';
import 'package:thor_flutter/app/modules/orders/orders_controller.dart';
import 'package:thor_flutter/app/modules/profile_options/profile_options_controller.dart';

class BottomNavigationBarController extends GetxController {
  AppController appCtl = Get.find<AppController>();

  @override
  void onInit() {
    super.onInit();
    _bootstrap();
  }

  void _bootstrap() {
    Get.put(MainController());
    Get.put(CartController());
    Get.put(OrdersController());
    Get.put(FavoritesController());
    Get.put(ProfileOptionsController());
  }
}
