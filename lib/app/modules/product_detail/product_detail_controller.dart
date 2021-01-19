import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/alert_dialog_widget.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';

class ProductDetailController extends GetxController {
  final AppController appCtl = Get.find<AppController>();
  final StoreRepo _storeRepo = Get.find<StoreRepo>();

  Product product;
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    int id = 0;
    if (Get.arguments is String) {
      id = int.parse(Get.arguments);
    } else {
      id = Get.arguments;
    }
    await fetchProductDetail(id);
  }

  Future<void> fetchProductDetail(int id) async {
    try {
      isLoading.value = true;
      product = await _storeRepo.requestProductDetail(id);
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

  Future<void> executeProductToCart() async {
    try {
      await _storeRepo.requestAddToCart(product.id, product.name,
          product.salesPrice.toDouble(), product.primaryTax);
      appCtl.totalCart.value++;
      update();
      Get.dialog(AlertDialogCC('Enhorabuena',
          content: Text('Producto agregado al carrito')));
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
}
