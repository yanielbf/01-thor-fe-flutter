import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/categories/categories_controller.dart';

class CategoriesBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoriesController());
  }
}
