import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/navigationbar/bottom_navigation_controller.dart';

class BottomNavigationBarPage extends StatefulWidget {
  final BottomNavigationBarController bottomNavigationBarController =
      Get.find<BottomNavigationBarController>();

  @override
  _BottomNavigationBarPageState createState() {
    return _BottomNavigationBarPageState();
  }
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  final BottomNavigationBarController bottomNavigationBarController =
      Get.find<BottomNavigationBarController>();
  DateTime currentBackPressTime;

  @override
  void initState() {
    super.initState();
    bottomNavigationBarController.initTab(this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
      builder: (_) {
        return WillPopScope(
          onWillPop: () => _willPopCallback(context, _),
          child: Scaffold(
              key: scaffoldkey,
              drawerEdgeDragWidth: 0,
              body: Stack(
                children: <Widget>[
                  NotificationListener<UserScrollNotification>(
                    child: TabBarView(
                        children: _.tabWidgets,
                        controller: _.tabController,
                        physics: NeverScrollableScrollPhysics()),
                    onNotification: (UserScrollNotification notification) {
                      if (true) {
                        if (notification.direction == ScrollDirection.reverse &&
                            notification.metrics.extentAfter > kToolbarHeight &&
                            notification.metrics.axis == Axis.vertical) {
                          _.animationController.forward();
                        } else if (notification.direction ==
                            ScrollDirection.forward) {
                          _.animationController.reverse();
                        }
                      }
                      return true;
                    },
                  ),
                ],
              ),
              bottomNavigationBar: Obx(() => BottomNavigationBar(
                    currentIndex: _.currentTab.value,
                    onTap: (index) {
                      _.changeTab(index);
                    },
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: Theme.of(context).primaryColor,
                    unselectedItemColor: Theme.of(context).accentColor,
                    selectedLabelStyle: TextStyle(
                        // fontSize: 15.0,
                        ),
                    items: [
                      BottomNavigationBarItem(
                          icon: Icon(FlutterIcons.home_ant), label: 'Tienda'),
                      BottomNavigationBarItem(
                          icon: Obx(() {
                            return _.appCtl.totalCart.value > 0
                                ? Icon(FlutterIcons.shopping_cart_ent,
                                    color: Colors.red)
                                : Icon(FlutterIcons.shopping_cart_fea);
                          }),
                          label: 'Carrito'),
                      BottomNavigationBarItem(
                          icon: Icon(FlutterIcons.favorite_border_mdi),
                          label: 'Favoritos'),
                      BottomNavigationBarItem(
                          icon: Obx(() {
                            return _.appCtl.totalNotifications.value > 0
                                ? Icon(FlutterIcons.account_alert_mco,
                                    color: Colors.red)
                                : Icon(FlutterIcons.account_outline_mco);
                          }),
                          label: 'Cliente'),
                    ],
                  ))),
        );
      },
    );
  }

  Future<bool> _willPopCallback(
      BuildContext context, BottomNavigationBarController _) async {
    DateTime now = DateTime.now();
    if (_.currentTab.value != 1) {
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 4)) {
        currentBackPressTime = now;
        scaffoldkey.currentState.showSnackBar(
            SnackBar(content: Text('Presiona de nuevo para salir')));
        return Future.value(false);
      }
    }
    return Future.value(true);
  }
}
