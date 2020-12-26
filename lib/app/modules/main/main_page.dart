import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:cubanfood_mobile_flutter/app/modules/main/main_controller.dart';
import 'package:cubanfood_mobile_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:cubanfood_mobile_flutter/app/utils/responsive/screentype_builder.dart';
import 'package:cubanfood_mobile_flutter/app/modules/main/views/mobile/portrait/main_portrait_view.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (_) => ScreenTypeBuilder(
        mobile: ResponsiveOrientationBuilder(
          portrait: MainPortraitView(),
          landscape: Container()
        ),
        tablet: ResponsiveOrientationBuilder(
          portrait: Container(),
          landscape: Container()
        )
      )  
    );
  }
}