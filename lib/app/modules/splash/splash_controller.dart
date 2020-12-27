import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/provider/local/authentication_local.dart';
import 'package:thor_flutter/app/data/provider/remote/authentication_api.dart';

class SplashController extends GetxController {
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
    if (await _authenticationLocal.getSession() != null) {
      try {
        await _authenticationApi.requestCurrentUser();
        Get.offAllNamed(AppRoutes.NAVIGATIONBAR);
      } on DioError catch (e) {
        Get.offAllNamed(AppRoutes.LOGIN);
      }
    } else {
      Get.offAllNamed(AppRoutes.LOGIN);
    }
  }
}
