import 'package:cubanfood_mobile_flutter/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:cubanfood_mobile_flutter/app/modules/main/main_controller.dart';

class MainPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_) {
        return Container();
      },
    );
  }
}
