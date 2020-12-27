import 'package:thor_flutter/app/modules/forgot_password/forgot_controller.dart';
import 'package:get/get.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ForgotController());
  }
}
