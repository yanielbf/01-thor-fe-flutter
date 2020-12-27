import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:thor_flutter/app/data/provider/local/authentication_local.dart';
import 'package:thor_flutter/app/data/provider/local/launch_url.dart';
import 'package:thor_flutter/app/data/provider/remote/authentication_api.dart';
import 'package:thor_flutter/app/data/provider/remote/menu_api.dart';
import 'package:thor_flutter/app/data/provider/remote/store_api.dart';
import 'package:thor_flutter/app/data/repository/authentication_repo.dart';
import 'package:thor_flutter/app/data/repository/menu_repo.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/data/service/authentication_service.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/modules/main/main_controller.dart';
import 'constants.dart';

class DependencyInjection {
  static void init() {
    Get.lazyPut<LauncherUrl>(() => LauncherUrl(), fenix: true);

    Get.lazyPut<FlutterSecureStorage>(() => FlutterSecureStorage(),
        fenix: true);

    Get.lazyPut<AuthenticationLocal>(() => AuthenticationLocal(), fenix: true);

    Get.lazyPut<Dio>(() {
      Dio dio = Dio(BaseOptions(
        baseUrl: Constants.API_URL,
      ));
      dio.interceptors.add(PrettyDioLogger());
      dio.interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        AuthenticationLocal _authenticationLocal =
            Get.find<AuthenticationLocal>();
        String token = await _authenticationLocal.getToken();
        options.headers["Content-Type"] = "application/json";
        options.headers["Accept"] = "application/json";
        options.headers["Authorization"] = "Bearer " + token;
        return options;
      }));
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return true;
        };
      };
      return dio;
    }, fenix: true);

    // Providers
    Get.lazyPut<AuthenticationAPI>(() => AuthenticationAPI(), fenix: true);
    Get.lazyPut<MenuAPI>(() => MenuAPI(), fenix: true);
    Get.lazyPut<StoreAPI>(() => StoreAPI(), fenix: true);

    //Repositories
    Get.lazyPut<AuthenticationRepo>(() => AuthenticationRepo(), fenix: true);
    Get.lazyPut<MenuRepo>(() => MenuRepo(), fenix: true);
    Get.lazyPut<StoreRepo>(() => StoreRepo(), fenix: true);

    //Services
    Get.lazyPut<AuthenticationService>(() => AuthenticationService(),
        fenix: true);

    //Controllers
    Get.put(AppController());
    Get.put(MainController());
  }
}
