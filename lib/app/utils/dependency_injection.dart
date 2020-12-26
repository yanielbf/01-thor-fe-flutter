import 'package:cubanfood_mobile_flutter/app/data/repository/AuthenticationRepo.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:cubanfood_mobile_flutter/app/data/service/AuthenticationService.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cubanfood_mobile_flutter/app/data/provider/local/authentication_local.dart';
import 'package:cubanfood_mobile_flutter/app/data/provider/remote/authentication_api.dart';
import 'constants.dart';

class DependencyInjection {

  static void init() async {
    
    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(), fenix: true);
    Get.lazyPut<AuthenticationLocal>(() => AuthenticationLocal(), fenix: true);

    String token = await Get.find<AuthenticationLocal>().getToken();

    Get.lazyPut<Dio>(() => Dio(
      BaseOptions(
        baseUrl: Constants.API_URL,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': token
        },
      )
    ), fenix: true);

    print('aaa');

    // Providers
    Get.lazyPut<AuthenticationAPI>(() => AuthenticationAPI(), fenix: true);

    //Repositories
    Get.lazyPut<AuthenticationRepo>(() => AuthenticationRepo(), fenix: true);
    
    //Services
    Get.lazyPut<AuthenticationService>(() => AuthenticationService(), fenix: true);
  }

}