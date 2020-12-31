import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/notifications/notifications_controller.dart';

class NotificationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationsController());
  }
}
