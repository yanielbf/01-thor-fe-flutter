import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/banner.dart';
import 'package:thor_flutter/app/data/model/category.dart';
import 'package:thor_flutter/app/data/model/mainscreen.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';

class MainController extends GetxController {
  final StoreRepo _storeRepo = Get.find<StoreRepo>();

  List<Category> categories = [];
  List<Product> productsNew = [];
  List<Product> productsMoreSale = [];
  List<Product> productsSpecialOffer = [];
  List<Product> productsWaitingStock = [];
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
      productsImage = productsSpecialOffer.map((e) => e.image).toList();
      banners = data.banners;
      update();
      //Get.back();
    } on DioError catch (e) {
      //Get.back();
      if (e.response != null && e.response != null) {
        Get.dialog(AlertDialog(
            title: TitleError(title: 'Ha ocurrido un error'),
            content: Text(e.response.data['message'])));
      }
    } catch (e) {
      print(e);
      //Get.back();
      Get.dialog(AlertDialog(
          title: TitleError(title: 'Ha ocurrido un error'),
          content: Text(e.toString())));
    }
  }

  void navigateFromBanner(BannerM banner) {
    if (banner.linkType == 'category') {
    } else if (banner.linkType == 'product') {
    } else {}
  }
}
