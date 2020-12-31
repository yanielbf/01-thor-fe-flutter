import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/modules/bills/bills_controller.dart';
import 'package:thor_flutter/app/modules/bills/views/mobile/portrait/bills_portrait_view.dart';
import 'package:thor_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:thor_flutter/app/utils/responsive/screentype_builder.dart';

class BillsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillsController>(
        builder: (_) => ScreenTypeBuilder(
            mobile: ResponsiveOrientationBuilder(
                portrait: BillsPortraitView(), landscape: Container()),
            tablet: ResponsiveOrientationBuilder(
                portrait: Container(), landscape: Container())));
  }
}
