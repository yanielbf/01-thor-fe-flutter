import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/banner.dart';
import 'package:thor_flutter/app/data/model/category.dart';
import 'package:thor_flutter/app/data/model/mainscreen.dart';
import 'package:thor_flutter/app/data/provider/local/launch_url.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';

class MainController extends GetxController {
  final AppController _appController = Get.find<AppController>();
  final StoreRepo _storeRepo = Get.find<StoreRepo>();
  LauncherUrl launcher = Get.find<LauncherUrl>();

  List<Category> categories = [];
  Map<String, dynamic> productsNew;
  Map<String, dynamic> productsMoreSale;
  Map<String, dynamic> productsSpecialOffer;
  Map<String, dynamic> productsWaitingStock;
  List<String> productsImage = [];
  List<BannerM> banners = [];

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    await _getMainScreen();
  }

  Future<void> _getMainScreen() async {
    //ProggresIndicatorCC.processRequest();
    try {
      MainScreen data = await _storeRepo.requestDailyMenu();
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
      update();
      //Get.back();
    } on DioError catch (e) {
      //Get.back();
      if (e.response != null && e.response != null) {
        Get.dialog(AlertDialog(
            title: TitleAlert(title: 'Ha ocurrido un error'),
            content: Text(e.response.data['message'])));
      }
    } catch (e) {
      print(e);
      //Get.back();
      Get.dialog(AlertDialog(
          title: TitleAlert(title: 'Ha ocurrido un error'),
          content: Text(e.toString())));
    }
  }

  void navigateFromBanner(BannerM banner) {
    if (banner.linkType == 'category') {
      _appController.navigateToRoute(AppRoutes.PRODUCTSBYCATEGORY,
          arguments: {'id': banner.linkResource, 'name': banner.title});
    } else if (banner.linkType == 'product') {
      _appController.navigateToRoute(AppRoutes.PRODUCTDETAIL,
          arguments: banner.linkResource);
    } else {
      launcher.launchExternalUrl(banner.linkResource);
    }
  }
}
