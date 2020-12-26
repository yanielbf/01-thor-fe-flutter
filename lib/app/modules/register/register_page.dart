import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:cubanfood_mobile_flutter/app/modules/register/register_controller.dart';
import 'package:cubanfood_mobile_flutter/app/modules/register/views/mobile/portrait/register_portrait_view.dart';
import 'package:cubanfood_mobile_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:cubanfood_mobile_flutter/app/utils/responsive/screentype_builder.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (_) => ScreenTypeBuilder(
        mobile: ResponsiveOrientationBuilder(
          portrait: RegisterPortraitView(),
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