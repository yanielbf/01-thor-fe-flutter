import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/info/info_controller.dart';

class InfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InfoController());
  }
}
