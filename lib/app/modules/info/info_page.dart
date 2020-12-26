import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cubanfood_mobile_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:cubanfood_mobile_flutter/app/utils/responsive/screentype_builder.dart';
import 'package:cubanfood_mobile_flutter/app/modules/splash/views/mobile/portrait/splash_portrait_view.dart';
import 'package:cubanfood_mobile_flutter/app/modules/info/info_controller.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InfoController>(
      builder: (_) => ScreenTypeBuilder(
        mobile: ResponsiveOrientationBuilder(
          portrait: SplashPortraitView(),
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