import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/products_by_category/products_by_category_controller.dart';

class ProductsByCategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductsByCategoryController());
  }
}
