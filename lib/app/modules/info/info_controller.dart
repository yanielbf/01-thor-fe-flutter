import 'package:thor_flutter/app/data/provider/local/launch_url.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:get/get.dart';

class InfoController extends GetxController {
  LauncherUrl launcher = Get.find<LauncherUrl>();

  String _message =
      'La Cocina Cubana surge en marzo del 2017 para llevar la cultura culinaria cubana a Montevideo. Esperamos que disfruten nuestra comida y seamos de su agrado.';

  String _phone = '+598 96249468';

  String get message => _message;

  String get phone => _phone;

  void doOpenWhatsApp() async {
    launcher.launchWhatsApp(_phone, "Hola quiero probar la cocina cubana");
  }

  void doSendMail() async {
    launcher.launchEmail(
        'comida@gmail.com', "Hola quiero probar la cocina cubana");
  }

  void navigateToLogin() async {
    Get.toNamed(AppRoutes.LOGIN);
  }

  void navigateToRegister() async {
    Get.toNamed(AppRoutes.REGISTER);
  }
}
