import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:thor_flutter/app/modules/developer_company/views/mobile/portrait/developer_company_portrait_view.dart';
import 'package:thor_flutter/app/modules/products_by_category/products_by_category_controller.dart';
import 'package:thor_flutter/app/utils/responsive/responsive_orientation_builder.dart';
import 'package:thor_flutter/app/utils/responsive/screentype_builder.dart';

class DeveloperCompanyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsByCategoryController>(
        builder: (_) => ScreenTypeBuilder(
            mobile: ResponsiveOrientationBuilder(
                portrait: DeveloperCompanyPortraitView(),
                landscape: Container()),
            tablet: ResponsiveOrientationBuilder(
                portrait: Container(), landscape: Container())));
  }
}
