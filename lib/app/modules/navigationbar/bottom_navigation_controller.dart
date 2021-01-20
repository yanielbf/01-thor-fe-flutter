import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/provider/local/store_local.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/modules/cart/cart_controller.dart';
import 'package:thor_flutter/app/modules/cart/cart_page.dart';
import 'package:thor_flutter/app/modules/favorites/favorites_controller.dart';
import 'package:thor_flutter/app/modules/favorites/favorites_page.dart';
import 'package:thor_flutter/app/modules/main/main_controller.dart';
import 'package:thor_flutter/app/modules/main/main_page.dart';
import 'package:thor_flutter/app/modules/orders/orders_controller.dart';
import 'package:thor_flutter/app/modules/profile_options/profile_options_controller.dart';
import 'package:thor_flutter/app/modules/profile_options/profile_options_page.dart';

class BottomNavigationBarController extends GetxController {
  final AppController appCtl = Get.find<AppController>();
  final StoreLocal storeLocal = Get.find<StoreLocal>();
  CartController cartController;
  FavoritesController favoriteController;
  RxInt currentTab = 0.obs;
  TabController tabController;
  AnimationController animationController;

  var tabWidgets = [
    MainPage(),
    CartPage(),
    FavoritesPage(),
    ProfileOptionsPage(),
  ];

  @override
  void onInit() {
    super.onInit();
    _bootstrap();
  }

  void _bootstrap() {
    _initController();
  }

  void _initController() {
    Get.put(MainController());
    Get.put(CartController());
    Get.put(OrdersController());
    Get.put(FavoritesController());
    Get.put(ProfileOptionsController());
    cartController = Get.find<CartController>();
    favoriteController = Get.find<FavoritesController>();
  }

  void initTab(TickerProvider ticker) async {
    tabController = TabController(vsync: ticker, length: tabWidgets.length);
    animationController = AnimationController(
      vsync: ticker,
      duration: const Duration(milliseconds: 200),
    );
    animationController.reverse();
    String activeTab = await storeLocal.getStore('active-tab-in-main');
    if (activeTab != null) {
      await storeLocal.removeKey('active-tab-in-main');
      changeTab(int.parse(activeTab));
    }
  }

  void changeTab(int index, {bool refresh = true}) {
    currentTab.value = index;
    tabController.animateTo(currentTab.value);
    animationController.reverse();
    if (refresh) {
      if (index == 1) {
        cartController.fetchCart();
      } else if (index == 2) {
        favoriteController.getProducts();
      }
    }
  }
}
