import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProggresIndicatorCC {
  static void processRequest() {
    Get.defaultDialog(
        title: 'Procesando petición',
        barrierDismissible: false,
        radius: 5.0,
        titleStyle: TextStyle(color: Colors.white, fontSize: 20.0),
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
        content: CircularProgressIndicator(
          valueColor:
              new AlwaysStoppedAnimation<Color>(ColorThemeCC.primaryColor),
        ));
  }
}
