import 'package:flutter_breadcrumb/flutter_breadcrumb.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/categories/categories_controller.dart';

class BreadCrumbCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(builder: (_) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: BreadCrumb.builder(
          itemCount: 8,
          builder: (index) {
            return BreadCrumbItem(content: Text('Item$index'));
          },
          divider: Icon(Icons.chevron_right),
        ),
      );
    });
  }
}
