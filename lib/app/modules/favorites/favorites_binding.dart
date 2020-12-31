import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/favorites/favorites_controller.dart';

class FavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoritesController());
  }
}
