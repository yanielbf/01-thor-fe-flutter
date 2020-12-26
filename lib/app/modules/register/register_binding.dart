import 'package:get/get.dart';
import 'package:cubanfood_mobile_flutter/app/modules/register/register_controller.dart';

class RegisterBinding extends Bindings{
  
  @override
  void dependencies() {
    Get.put(() => RegisterController());
  }

}