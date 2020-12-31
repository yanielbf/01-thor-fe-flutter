import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/modules/orders/orders_controller.dart';
import 'package:thor_flutter/app/modules/orders/views/mobile/portrait/orders_portrait_view.dart';
import 'package:thor_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:thor_flutter/app/utils/responsive/screentype_builder.dart';

class OrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
        builder: (_) => ScreenTypeBuilder(
            mobile: ResponsiveOrientationBuilder(
                portrait: OrdersPortraitView(), landscape: Container()),
            tablet: ResponsiveOrientationBuilder(
                portrait: Container(), landscape: Container())));
  }
}
