import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/cart/cart_controller.dart';
import 'package:thor_flutter/app/modules/cart/cart_page.dart';
import 'package:thor_flutter/app/modules/favorites/favorites_controller.dart';
import 'package:thor_flutter/app/modules/favorites/favorites_page.dart';
import 'package:thor_flutter/app/modules/main/main_page.dart';
import 'package:thor_flutter/app/modules/navigationbar/bottom_navigation_controller.dart';
import 'package:thor_flutter/app/modules/profile_options/profile_options_page.dart';

class BottomNavigationBarPage extends StatefulWidget {
  @override
  _BottomNavigationBarPageState createState() =>
      _BottomNavigationBarPageState();
}

class _BottomNavigationBarPageState extends State<BottomNavigationBarPage>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  final CartController cartController = Get.find<CartController>();
  final FavoritesController favoriteController =
      Get.find<FavoritesController>();
  TabController _tabController;
  AnimationController _animationController;
  DateTime currentBackPressTime;
  int _currentTab = 0;

  var currentTab = [
    MainPage(),
    CartPage(),
    FavoritesPage(),
    ProfileOptionsPage(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: currentTab.length);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
      builder: (_) {
        return WillPopScope(
          onWillPop: () => _willPopCallback(context),
          child: Scaffold(
            key: _scaffoldkey,
            drawerEdgeDragWidth: 0,
            body: Stack(
              children: <Widget>[
                NotificationListener<UserScrollNotification>(
                  child: TabBarView(
                      children: currentTab,
                      controller: _tabController,
                      physics: NeverScrollableScrollPhysics()),
                  onNotification: (UserScrollNotification notification) {
                    if (true) {
                      if (notification.direction == ScrollDirection.reverse &&
                          notification.metrics.extentAfter > kToolbarHeight &&
                          notification.metrics.axis == Axis.vertical) {
                        _animationController.forward();
                      } else if (notification.direction ==
                          ScrollDirection.forward) {
                        _animationController.reverse();
                      }
                    }
                    return true;
                  },
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentTab,
              onTap: (index) {
                setState(() {
                  _currentTab = index;
                  _tabController.animateTo(_currentTab);
                  _animationController.reverse();
                  if (index == 1) {
                    cartController.fetchCart();
                  } else if (index == 2) {
                    favoriteController.getProducts();
                  }
                });
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
            ),
          ),
        );
      },
    );
  }

  Future<bool> _willPopCallback(BuildContext context) async {
    DateTime now = DateTime.now();
    if (_currentTab != 1) {
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 4)) {
        currentBackPressTime = now;
        _scaffoldkey.currentState
            .showSnackBar(SnackBar(content: Text('Press again to exit')));
        return Future.value(false);
      }
    }
    return Future.value(true);
  }
}
