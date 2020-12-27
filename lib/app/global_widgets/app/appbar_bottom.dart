import 'package:badges/badges.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:thor_flutter/app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBottomBar extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomBarItems = [];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (_) {
      return Material(
          elevation: 15.0,
          child: Obx(() {
            return BottomNavigationBar(
              currentIndex: _.activeRouteBottomBar.value,
              selectedItemColor: ColorThemeCC.primaryColor,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: "Menú",
                ),
                BottomNavigationBarItem(
                  icon: new Icon(
                    Icons.shopping_bag,
                  ),
                  label: "Pedidos",
                ),
                BottomNavigationBarItem(
                  icon: Obx(() {
                    print(_.totalNotifications.value);
                    if (_.totalNotifications.value == 0) {
                      return Icon(
                        Icons.notifications,
                      );
                    }
                    return Badge(
                      badgeContent: Text(_.totalNotifications.value.toString(),
                          style:
                              TextThemeCC().addColor(Colors.white).textStyle),
                      child: Icon(
                        Icons.notifications,
                      ),
                    );
                  }),
                  label: "Notificaciones",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                  ),
                  label: "Perfil",
                )
              ],
              type: BottomNavigationBarType.fixed,
              selectedLabelStyle: TextThemeCC().small(),
              unselectedLabelStyle: TextThemeCC().small(),
              onTap: (index) {
                _.navigateFromBottomBar(index);
              },
            );
          }));
    });
  }
}
