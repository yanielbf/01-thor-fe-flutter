import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/banner.dart';
import 'package:thor_flutter/app/data/model/category.dart';
import 'package:thor_flutter/app/data/model/mainscreen.dart';
import 'package:thor_flutter/app/data/provider/firebase/firebase_notification_handler.dart';
import 'package:thor_flutter/app/data/provider/local/launch_url.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/alert_dialog_widget.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';

class MainController extends GetxController {
  final AppController appCtl = Get.find<AppController>();
  final StoreRepo _storeRepo = Get.find<StoreRepo>();
  final LauncherUrl launcher = Get.find<LauncherUrl>();
  final FirebaseNotifications firebaseNotifications = FirebaseNotifications();

  List<Category> categories = [];
  Map<String, dynamic> productsNew;
  Map<String, dynamic> productsMoreSale;
  Map<String, dynamic> productsSpecialOffer;
  Map<String, dynamic> productsWaitingStock;
  List<String> productsImage = [];
  List<BannerM> banners = [];

  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    firebaseNotifications.setupFirebase(Get.context, onListenerNotifications);
    await fetchMainScreen();
  }

  void onListenerNotifications(data) {
    Map<dynamic, dynamic> dataParse = json.decode(data);
    switch (dataParse['action']) {
      case 'refresh-mainscreen':
        fetchMainScreen();
        break;
      default:
    }
  }

  void executeActionInController(String action) {}

  Future<void> fetchMainScreen() async {
    try {
      isLoading.value = true;
      MainScreen data = await _storeRepo.requestMainScreenProducts();
      categories = data.categories;
      productsNew = data.news;
      productsMoreSale = data.moreSales;
      productsSpecialOffer = data.specialOffer;
      productsWaitingStock = data.waitingStock;
      productsImage = productsSpecialOffer['products']
          .map((e) => e.image)
          .toList()
          .cast<String>();
      banners = data.banners;
      isLoading.value = false;
      update();
    } on DioError catch (e) {
      isLoading.value = false;
      if (e.response.statusCode == 401) {
        appCtl.closeSession();
        return;
      }
      if (e.response != null && e.response != null) {
        Get.dialog(AlertDialogCC('Ha ocurrido un error',
            content: Text(e.response.data['message'])));
      }
    } catch (e) {
      isLoading.value = false;
      Get.dialog(
          AlertDialogCC('Ha ocurrido un error', content: Text(e.toString())));
    }
  }

  void navigateFromBanner(BannerM banner) {
    if (banner.linkType == 'category') {
      appCtl.navigateToRoute(AppRoutes.PRODUCTSBYCATEGORY,
          arguments: {'id': banner.linkResource, 'name': banner.title});
    } else if (banner.linkType == 'product') {
      appCtl.navigateToRoute(AppRoutes.PRODUCTDETAIL,
          arguments: banner.linkResource);
    } else {
      launcher.launchExternalUrl(banner.linkResource);
    }
  }
}
