import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:thor_flutter/app/modules/splash/splash_binding.dart';
import 'package:thor_flutter/app/modules/splash/splash_page.dart';
import 'package:thor_flutter/app/routes/app_pages.dart';
import 'package:thor_flutter/app/theme/theme.dart';
import 'package:thor_flutter/app/utils/dependency_injection.dart';

class HttpOverridesCustom extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = new HttpOverridesCustom();
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Thor',
      home: SplashPage(),
      defaultTransition: Transition.rightToLeft,
      debugShowCheckedModeBanner: false,
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      theme: themeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.light,
    );
  }
}
