import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/modules/products_by_category/products_by_category_controller.dart';
import 'package:thor_flutter/app/modules/products_by_category/views/mobile/portrait/products_by_category_portrait_view.dart';
import 'package:thor_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:thor_flutter/app/utils/responsive/screentype_builder.dart';

class ProductsByCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsByCategoryController>(
        builder: (_) => ScreenTypeBuilder(
            mobile: ResponsiveOrientationBuilder(
                portrait: ProductsByCategoryPortraitView(),
                landscape: Container()),
            tablet: ResponsiveOrientationBuilder(
                portrait: Container(), landscape: Container())));
  }
}
