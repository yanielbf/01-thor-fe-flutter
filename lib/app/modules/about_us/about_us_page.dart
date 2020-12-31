import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/modules/about_us/about_us_controller.dart';
import 'package:thor_flutter/app/modules/about_us/views/mobile/portrait/about_us_portrait_view.dart';
import 'package:thor_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:thor_flutter/app/utils/responsive/screentype_builder.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
        builder: (_) => ScreenTypeBuilder(
            mobile: ResponsiveOrientationBuilder(
                portrait: AboutUsPortraitView(), landscape: Container()),
            tablet: ResponsiveOrientationBuilder(
                portrait: Container(), landscape: Container())));
  }
}
