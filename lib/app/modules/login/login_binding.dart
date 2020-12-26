import 'package:get/get.dart';
import 'package:cubanfood_mobile_flutter/app/modules/login/login_controller.dart';

class LoginBinding extends Bindings{
  
  @override
  void dependencies() {
    Get.put(() => LoginController());
  }

}