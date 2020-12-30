import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/horizontal_list_widget.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/modules/main/main_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';

class SpecialOffersMain extends StatelessWidget {
  AppController _appController = Get.find<AppController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return SideInAnimation(3,
          child: HorizontalListView(
              itemCount: _.productsSpecialOffer,
              onTapItem: (item) {
                _appController.navigateToRoute(AppRoutes.PRODUCTDETAIL,
                    arguments: item.id);
              }));
    });
  }
}
