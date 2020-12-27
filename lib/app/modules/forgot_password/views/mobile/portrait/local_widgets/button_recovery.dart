import 'package:thor_flutter/app/global_widgets/button/button_text.dart';
import 'package:thor_flutter/app/modules/forgot_password/forgot_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class ButtonRecovery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotController>(builder: (_) {
      return ButtonText(
        title: 'Recuperar contraseña',
        callback: _.doRecoveryPassword,
      );
    });
  }
}
