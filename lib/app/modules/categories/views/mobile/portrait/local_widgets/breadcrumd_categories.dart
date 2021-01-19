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
          itemCount: _.breadcrumb.length,
          builder: (index) {
            Map<String, dynamic> item = _.breadcrumb[index];
            return BreadCrumbItem(
                content: GestureDetector(
                    child: Text(item['name']),
                    onTap: () {
                      if (index + 1 < _.breadcrumb.length) {
                        _.executeNavigateFromBreadcrumb(
                            index, item['id'], item['name']);
                      }
                    }));
          },
          divider: Icon(Icons.chevron_right),
        ),
      );
    });
  }
}
