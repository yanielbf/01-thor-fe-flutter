import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/progress_indicator.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';

class FavoritesController extends GetxController {
  final StoreRepo _storeRepo = Get.find<StoreRepo>();
  final AppController appController = Get.find<AppController>();

  List<Product> products = [];

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    await getProducts();
  }

  Future<void> getProducts() async {
    ProggresIndicatorCC.processRequest();
    try {
      products = await _storeRepo.requestFavorites();
      update();
      Get.back();
    } on DioError catch (e) {
      Get.back();
      if (e.response != null && e.response != null) {
        Get.dialog(AlertDialog(
            title: TitleError(title: 'Ha ocurrido un error'),
            content: Text(e.response.data['message'])));
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.dialog(AlertDialog(
          title: TitleError(title: 'Ha ocurrido un error'),
          content: Text(e.toString())));
    }
  }
}
