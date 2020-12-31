import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/orders/orders_controller.dart';

class OrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrdersController());
  }
}
