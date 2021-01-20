import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/global_widgets/app/alert_dialog_widget.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';

class ProfileOptionsController extends GetxController {
  final AppController appCtl = Get.find<AppController>();

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    await getCountNotifications();
  }

  Future<void> getCountNotifications() async {}

  Future<void> closeSession() async {
    Get.dialog(AlertDialogCC(
      '¿Desea cerrar la sesión?',
      content: Text('Esperamos que regrese pronto con nosotros'),
      yesAction: () async {
        appCtl.closeSession();
      },
      noAction: () {},
    ));
  }
}
