import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:cubanfood_mobile_flutter/app/modules/info/info_controller.dart';

class InfoPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoController>(
      builder: (_) {
        return Container();
      },
    );
  }
}
