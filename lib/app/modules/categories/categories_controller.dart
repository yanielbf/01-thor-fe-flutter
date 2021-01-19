import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/category.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/alert_dialog_widget.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';

class CategoriesController extends GetxController {
  AppController appCtl = Get.find<AppController>();
  final StoreRepo _storeRepo = Get.find<StoreRepo>();

  List<Map<String, dynamic>> breadcrumb = [
    {'id': null, 'name': 'Categorías'}
  ];
  List<Category> categories = [];
  List<Product> products = [];
  String categoryName = 'Categorías';
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    await fetchCategories();
  }

  Future<void> fetchCategories(
      {int id, String name, bool noadd = false}) async {
    try {
      isLoading.value = true;
      if (id == null) {
        categories = await _storeRepo.requestRootCategories();
        categoryName = "Categorías";
        products = [];
      } else {
        if (!noadd) {
          breadcrumb.add({'id': id, 'name': name});
        }
        categoryName = name;
        categories = await _storeRepo.requestChildrenCategories(id);
        products = await _storeRepo.requestProductsByCategory(id);
      }
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

  void executeNavigateFromBreadcrumb(int index, int id, String name) {
    if (index == 0) {
      breadcrumb = breadcrumb.sublist(0, 1);
    } else {
      breadcrumb = breadcrumb.sublist(0, index + 1);
    }
    fetchCategories(
        id: id, name: index == 0 ? 'Categorías' : name, noadd: true);
  }
}
