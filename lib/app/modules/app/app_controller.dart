import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:thor_flutter/app/data/model/customer.dart';
import 'package:thor_flutter/app/data/model/setting.dart';
import 'package:thor_flutter/app/data/provider/local/authentication_local.dart';
import 'package:thor_flutter/app/data/repository/common_repo.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final AuthenticationLocal _authenticationLocal =
      Get.find<AuthenticationLocal>();
  final CommonRepo _commonRepo = Get.find<CommonRepo>();

  RxInt activeRouteBottomBar = 0.obs;
  String activeRoute = AppRoutes.MAIN;
  Customer customer;
  Setting settings;
  Currency mainCurrency;
  RxInt totalNotifications = 0.obs;
  RxInt totalCart = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    await _bootstrap();
  }

  Future<void> _bootstrap() async {
    await _getSession();
    await _getSettings();
  }

  Future<void> _getSession() async {
    customer = await _authenticationLocal.getSession();
  }

  Future<void> _getSettings() async {
    try {
      settings = await _commonRepo.requestSettings();
      mainCurrency = settings.currencies.firstWhere((e) => e.isMain == 1);
    } on DioError catch (e) {
      if (e.response != null && e.response != null) {
        Get.dialog(AlertDialog(
            title: TitleAlert(title: 'Ha ocurrido un error'),
            content: Text(e.response.data['message'])));
      }
    } catch (e) {
      print(e);
      Get.dialog(AlertDialog(
          title: TitleAlert(title: 'Ha ocurrido un error'),
          content: Text(e.toString())));
    }
  }

  void navigateFromBottomBar(int index) {
    switch (index) {
      case 0:
        activeRoute = AppRoutes.MAIN;
        activeRouteBottomBar.value = index;
        Get.toNamed(AppRoutes.MAIN);
        break;
      case 1:
        activeRoute = AppRoutes.MAIN;
        activeRouteBottomBar.value = index;
        Get.toNamed(AppRoutes.MAIN);
        break;
      case 2:
        Get.toNamed(AppRoutes.MAIN);
        activeRoute = AppRoutes.MAIN;
        activeRouteBottomBar.value = index;
        break;
      case 3:
        activeRoute = AppRoutes.PROFILE_OPTIONS;
        activeRouteBottomBar.value = index;
        Get.toNamed(AppRoutes.PROFILE_OPTIONS);
        break;
    }
  }

  void navigateToRoute(String route,
      {bool removeStack = false, dynamic arguments}) {
    activeRoute = route;
    if (removeStack) {
      Get.offAllNamed(route);
    } else {
      Get.toNamed(route, arguments: arguments);
    }
  }

  void closeSession() {
    _authenticationLocal.removeSession();
    Get.offAllNamed(AppRoutes.LOGIN);
  }
}
