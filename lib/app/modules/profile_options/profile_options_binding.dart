import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/profile_options/profile_options_controller.dart';

class ProfileOptionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileOptionsController());
  }
}
