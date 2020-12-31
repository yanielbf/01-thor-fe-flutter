import 'package:get/get.dart';

class NotificationsController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    await getInfo();
  }

  Future<void> getInfo() async {}
}
