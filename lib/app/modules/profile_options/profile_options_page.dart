import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/modules/product_detail/product_detail_controller.dart';
import 'package:thor_flutter/app/modules/profile_options/views/mobile/portrait/profile_options_portrait_view.dart';
import 'package:thor_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:thor_flutter/app/utils/responsive/screentype_builder.dart';

class ProfileOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
        builder: (_) => ScreenTypeBuilder(
            mobile: ResponsiveOrientationBuilder(
                portrait: ProfileOptionsPortraitView(), landscape: Container()),
            tablet: ResponsiveOrientationBuilder(
                portrait: Container(), landscape: Container())));
  }
}
