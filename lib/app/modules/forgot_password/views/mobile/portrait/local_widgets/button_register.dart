import 'package:thor_flutter/app/global_widgets/button/button_text.dart';
import 'package:thor_flutter/app/modules/login/login_controller.dart';
import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ButtonRegister extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (_) {
      return ButtonText(
        title: 'Registrarse',
        callback: () {},
        color: ColorThemeCC.secondaryColor,
      );
    });
  }
}
