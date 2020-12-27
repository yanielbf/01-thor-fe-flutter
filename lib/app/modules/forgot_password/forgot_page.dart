import 'package:thor_flutter/app/modules/forgot_password/forgot_controller.dart';
import 'package:thor_flutter/app/modules/forgot_password/views/mobile/portrait/forgot_portrait_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:thor_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:thor_flutter/app/utils/responsive/screentype_builder.dart';

class ForgotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotController>(
        builder: (_) => ScreenTypeBuilder(
            mobile: ResponsiveOrientationBuilder(
                portrait: ForgotPortraitView(), landscape: Container()),
            tablet: ResponsiveOrientationBuilder(
                portrait: Container(), landscape: Container())));
  }
}
