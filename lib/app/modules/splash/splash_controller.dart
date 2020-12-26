import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:cubanfood_mobile_flutter/app/data/provider/local/authentication_local.dart';
import 'package:cubanfood_mobile_flutter/app/data/provider/remote/authentication_api.dart';
import 'package:cubanfood_mobile_flutter/app/routes/app_routes.dart';

class SplashController extends GetxController {

  // final AuthenticationLocal _authenticationLocal = Get.find<AuthenticationLocal>();
  // final AuthenticationAPI _authenticationApi = Get.find<AuthenticationAPI>();

  @override
  void onInit() {
    super.onInit();
    print('aaa111');
  }

  @override
  void onReady() {
    super.onReady();
    //_init();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void _init() async {
    // print('aaaa');
    // if(_authenticationLocal.getSession() != null){
    //   try {
    //     await _authenticationApi.requestCurrentUser();
    //     Get.offNamed(AppRoutes.MAIN);
    //   }on DioError catch($e) {
    //     print($e);
    //     Get.offNamed(AppRoutes.LOGIN);
    //   }
    // } else {
    //   Get.offNamed(AppRoutes.LOGIN);
    // }
  }

}