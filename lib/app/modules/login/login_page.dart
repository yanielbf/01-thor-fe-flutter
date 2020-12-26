import 'package:cubanfood_mobile_flutter/app/modules/login/views/mobile/portrait/login_portrait_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cubanfood_mobile_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:cubanfood_mobile_flutter/app/utils/responsive/screentype_builder.dart';
import 'package:cubanfood_mobile_flutter/app/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (_) => ScreenTypeBuilder(
        mobile: ResponsiveOrientationBuilder(
          portrait: LoginPortraitView(),
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