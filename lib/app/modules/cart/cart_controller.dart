import 'package:get/get.dart';

class CartController extends GetxController {
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
