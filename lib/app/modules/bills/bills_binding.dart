import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/bills/bills_controller.dart';

class BillsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BillsController());
  }
}
