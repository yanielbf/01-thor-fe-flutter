import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/navigationbar/bottom_navigation_controller.dart';

class BottomNavigationBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavigationBarController());
  }
}
