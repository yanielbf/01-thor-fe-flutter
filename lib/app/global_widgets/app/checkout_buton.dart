import 'package:thor_flutter/app/global_widgets/button/button_text.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (_) {
      return ButtonText(title: "Listo para pedir (3)", callback: () {});
    });
  }
}
