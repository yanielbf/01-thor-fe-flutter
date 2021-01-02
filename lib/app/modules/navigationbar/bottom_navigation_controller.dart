import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/modules/cart/cart_controller.dart';
import 'package:thor_flutter/app/modules/favorites/favorites_controller.dart';
import 'package:thor_flutter/app/modules/main/main_controller.dart';
import 'package:thor_flutter/app/modules/profile_options/profile_options_controller.dart';

class BottomNavigationBarController extends GetxController {
  Product product;

  @override
  void onInit() {
    super.onInit();
    _bootstrap();
  }

  void _bootstrap() {
    Get.put(MainController());
    Get.put(CartController());
    Get.put(FavoritesController());
    Get.put(ProfileOptionsController());
  }
}
