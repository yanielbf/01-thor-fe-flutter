import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/category_circle_widget.dart';
import 'package:thor_flutter/app/modules/main/main_controller.dart';

class CategoryMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return SideInAnimation(2,
          child: Container(
            width: Get.width,
            height: 110.0,
            child: ListView.builder(
              itemCount: _.categories.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                var category = _.categories[index];
                return CategoryCircle(
                  category: category,
                  onTap: () {
                    //Get.to(BrowseProductPage());
                  },
                );
              },
            ),
          ));
    });
  }
}
