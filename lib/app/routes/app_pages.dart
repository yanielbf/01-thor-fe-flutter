import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/about_us/about_us_binding.dart';
import 'package:thor_flutter/app/modules/about_us/about_us_page.dart';
import 'package:thor_flutter/app/modules/bills/bills_binding.dart';
import 'package:thor_flutter/app/modules/bills/bills_page.dart';
import 'package:thor_flutter/app/modules/categories/categories_binding.dart';
import 'package:thor_flutter/app/modules/categories/categories_page.dart';
import 'package:thor_flutter/app/modules/developer_company/developer_company_binding.dart';
import 'package:thor_flutter/app/modules/developer_company/developer_company_page.dart';
import 'package:thor_flutter/app/modules/favorites/favorites_binding.dart';
import 'package:thor_flutter/app/modules/favorites/favorites_page.dart';
import 'package:thor_flutter/app/modules/forgot_password/forgot_binding.dart';
import 'package:thor_flutter/app/modules/forgot_password/forgot_page.dart';
import 'package:thor_flutter/app/modules/info/info_binding.dart';
import 'package:thor_flutter/app/modules/login/login_binding.dart';
import 'package:thor_flutter/app/modules/main/main_binding.dart';
import 'package:thor_flutter/app/modules/navigationbar/bottom_navigation.dart';
import 'package:thor_flutter/app/modules/navigationbar/bottom_navigation_binding.dart';
import 'package:thor_flutter/app/modules/notifications/notifications_binding.dart';
import 'package:thor_flutter/app/modules/notifications/notifications_page.dart';
import 'package:thor_flutter/app/modules/orders/orders_binding.dart';
import 'package:thor_flutter/app/modules/orders/orders_page.dart';
import 'package:thor_flutter/app/modules/pdf_viewer/pdf_viewer_binding.dart';
import 'package:thor_flutter/app/modules/pdf_viewer/pdf_viewer_page.dart';
import 'package:thor_flutter/app/modules/product_detail/product_detail_binding.dart';
import 'package:thor_flutter/app/modules/product_detail/product_detail_page.dart';
import 'package:thor_flutter/app/modules/products_by_category/products_by_category_binding.dart';
import 'package:thor_flutter/app/modules/products_by_category/products_by_category_page.dart';
import 'package:thor_flutter/app/modules/profile_options/profile_options_binding.dart';
import 'package:thor_flutter/app/modules/profile_options/profile_options_page.dart';
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
        binding: BottomNavigationBarBinding(),
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
    GetPage(
        name: AppRoutes.CATEGORIES,
        page: () => CategoriesPage(),
        binding: CategoriesBinding()),
    GetPage(
        name: AppRoutes.PROFILE_OPTIONS,
        page: () => ProfileOptionsPage(),
        binding: ProfileOptionsBinding()),
    GetPage(
        name: AppRoutes.DEVELOPERS,
        page: () => DeveloperCompanyPage(),
        binding: DeveloperCompanyBinding()),
    GetPage(
        name: AppRoutes.ABOUTUS,
        page: () => AboutUsPage(),
        binding: AboutUsBinding()),
    GetPage(
        name: AppRoutes.BILLS,
        page: () => BillsPage(),
        binding: BillsBinding()),
    GetPage(
        name: AppRoutes.ORDERS,
        page: () => OrdersPage(),
        binding: OrdersBinding()),
    GetPage(
        name: AppRoutes.PDFVIEWER,
        page: () => PdfViewerPage(),
        binding: PdfViewerBinding()),
    GetPage(
        name: AppRoutes.NOTIFICATIONS,
        page: () => NotificationsPage(),
        binding: NotificationsBinding()),
    GetPage(
        name: AppRoutes.FAVORITES,
        page: () => FavoritesPage(),
        binding: FavoritesBinding()),
  ];
}
