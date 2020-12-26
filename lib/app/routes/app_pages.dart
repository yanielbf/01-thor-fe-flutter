import 'package:get/get.dart';
import 'package:cubanfood_mobile_flutter/app/modules/info/info_binding.dart';
import 'package:cubanfood_mobile_flutter/app/modules/login/login_binding.dart';
import 'package:cubanfood_mobile_flutter/app/modules/main/main_binding.dart';
import 'package:cubanfood_mobile_flutter/app/modules/register/register_binding.dart';
import 'package:cubanfood_mobile_flutter/app/modules/splash/splash_binding.dart';
import 'package:cubanfood_mobile_flutter/app/modules/info/info_page.dart';
import 'package:cubanfood_mobile_flutter/app/modules/login/login_page.dart';
import 'package:cubanfood_mobile_flutter/app/modules/main/main_page.dart';
import 'package:cubanfood_mobile_flutter/app/modules/register/register_page.dart';
import 'package:cubanfood_mobile_flutter/app/modules/splash/splash_page.dart';
import 'package:cubanfood_mobile_flutter/app/routes/app_routes.dart';

class AppPages {

   static final List<GetPage> pages = [
      GetPage(name: AppRoutes.SPLASH, page: () => SplashPage(), binding: SplashBinding()),
      GetPage(name: AppRoutes.LOGIN, page: () => LoginPage(), binding: LoginBinding()),
      GetPage(name: AppRoutes.REGISTER, page: () => RegisterPage(), binding: RegisterBinding()),
      GetPage(name: AppRoutes.INFO, page: () => InfoPage(), binding: InfoBinding()),
      GetPage(name: AppRoutes.MAIN, page: () => MainPage(), binding: MainBinding()),
   ];

 }