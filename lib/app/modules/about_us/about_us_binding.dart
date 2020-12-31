import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/about_us/about_us_controller.dart';

class AboutUsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AboutUsController());
  }
}
