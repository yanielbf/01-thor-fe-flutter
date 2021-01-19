import 'package:thor_flutter/app/data/model/customer.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/provider/local/authentication_local.dart';
import 'package:thor_flutter/app/data/provider/remote/authentication_api.dart';

class SplashController extends GetxController {
  final AppController appCtl = Get.find<AppController>();
  final AuthenticationLocal _authenticationLocal =
      Get.find<AuthenticationLocal>();
  final AuthenticationAPI _authenticationApi = Get.find<AuthenticationAPI>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _init() async {
    Customer customer = await _authenticationLocal.getSession();
    if (customer != null) {
      try {
        appCtl.customer = await _authenticationApi.requestCurrentUser();
        appCtl.navigateToRoute(AppRoutes.NAVIGATIONBAR, removeStack: true);
      } on DioError catch (e) {
        appCtl.navigateToRoute(AppRoutes.LOGIN, removeStack: true);
      }
    } else {
      appCtl.navigateToRoute(AppRoutes.LOGIN, removeStack: true);
    }
  }
}
