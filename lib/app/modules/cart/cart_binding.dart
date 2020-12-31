import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/cart/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CartController());
  }
}
