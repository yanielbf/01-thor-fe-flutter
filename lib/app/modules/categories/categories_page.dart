import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/modules/categories/views/mobile/portrait/categories_portrait_view.dart';
import 'package:thor_flutter/app/modules/products_by_category/products_by_category_controller.dart';
import 'package:thor_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:thor_flutter/app/utils/responsive/screentype_builder.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsByCategoryController>(
        builder: (_) => ScreenTypeBuilder(
            mobile: ResponsiveOrientationBuilder(
                portrait: CategoriesPortraitView(), landscape: Container()),
            tablet: ResponsiveOrientationBuilder(
                portrait: Container(), landscape: Container())));
  }
}
