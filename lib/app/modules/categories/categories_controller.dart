import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/category.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/progress_indicator.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';

class CategoriesController extends GetxController {
  AppController appController = Get.find<AppController>();
  final StoreRepo _storeRepo = Get.find<StoreRepo>();

  List<Category> categories = [];
  List<Map<String, dynamic>> breadcrumb = [
    {'id': null, 'name': 'Categorías'}
  ];
  List<Product> products = [];
  String categoryName = 'Categorías';

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    await getCategories();
  }

  Future<void> getCategories(
      {int id = null, String name = null, bool noadd = false}) async {
    ProggresIndicatorCC.processRequest();
    try {
      if (id == null) {
        categories = await _storeRepo.requestRootCategories();
      } else {
        if (!noadd) {
          breadcrumb.add({'id': id, 'name': name});
          categoryName = 'Categorías';
        }
        categoryName = name;
        categories = await _storeRepo.requestChildrenCategories(id);
        products = await _storeRepo.requestProductsByCategory(id);
      }
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

  void navigateFromBreadcrumb(int index, int id, String name) {
    if (index == 0) {
      breadcrumb = breadcrumb.sublist(0, 1);
    } else {
      breadcrumb = breadcrumb.sublist(0, index + 1);
    }
    getCategories(id: id, name: index == 0 ? '' : name, noadd: true);
  }
}
