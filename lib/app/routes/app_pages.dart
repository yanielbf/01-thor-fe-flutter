import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/forgot_password/forgot_binding.dart';
import 'package:thor_flutter/app/modules/forgot_password/forgot_page.dart';
import 'package:thor_flutter/app/modules/info/info_binding.dart';
import 'package:thor_flutter/app/modules/login/login_binding.dart';
import 'package:thor_flutter/app/modules/main/main_binding.dart';
import 'package:thor_flutter/app/modules/navigationbar/bottom_navigation.dart';
import 'package:thor_flutter/app/modules/product_detail/product_detail_binding.dart';
import 'package:thor_flutter/app/modules/product_detail/product_detail_page.dart';
import 'package:thor_flutter/app/modules/products_by_category/products_by_category_binding.dart';
import 'package:thor_flutter/app/modules/products_by_category/products_by_category_page.dart';
import 'package:thor_flutter/app/modules/splash/splash_binding.dart';
import 'package:thor_flutter/app/modules/info/info_page.dart';
import 'package:thor_flutter/app/modules/login/login_page.dart';
import 'package:thor_flutter/app/modules/main/main_page.dart';
import 'package:thor_flutter/app/modules/splash/splash_page.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding(),
        transition: Transition.cupertinoDialog),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginPage(),
        binding: LoginBinding(),
        transition: Transition.cupertinoDialog),
    GetPage(
        name: AppRoutes.FORGOT,
        page: () => ForgotPage(),
        binding: ForgotBinding(),
        transition: Transition.cupertinoDialog),
    GetPage(
        name: AppRoutes.INFO, page: () => InfoPage(), binding: InfoBinding()),
    GetPage(
        name: AppRoutes.NAVIGATIONBAR,
        page: () => BottomNavigationBarPage(),
        transition: Transition.cupertinoDialog),
    GetPage(
        name: AppRoutes.MAIN, page: () => MainPage(), binding: MainBinding()),
    GetPage(
        name: AppRoutes.PRODUCTDETAIL,
        page: () => ProductDetailPage(),
        binding: ProductDetailBinding()),
    GetPage(
        name: AppRoutes.PRODUCTSBYCATEGORY,
        page: () => ProductsByCategoryPage(),
        binding: ProductsByCategoryBinding()),
  ];
}
