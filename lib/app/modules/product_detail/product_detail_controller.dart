import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/progress_indicator.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';

class ProductDetailController extends GetxController {
  final AppController appController = Get.find<AppController>();
  final StoreRepo _storeRepo = Get.find<StoreRepo>();

  Product product;

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
    await getProductDetail(id);
  }

  Future<void> getProductDetail(int id) async {
    ProggresIndicatorCC.processRequest();
    try {
      product = await _storeRepo.requestProductDetail(id);
      update();
      Get.back();
    } on DioError catch (e) {
      Get.back();
      if (e.response != null && e.response != null) {
        Get.dialog(AlertDialog(
            title: TitleAlert(title: 'Ha ocurrido un error'),
            content: Text(e.response.data['message'])));
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.dialog(AlertDialog(
          title: TitleAlert(title: 'Ha ocurrido un error'),
          content: Text(e.toString())));
    }
  }

  Future<void> addProductToCart() async {
    ProggresIndicatorCC.processRequest();
    try {
      await _storeRepo.requestAddToCart(product.id, product.name,
          product.salesPrice.toDouble(), product.primaryTax);
      appController.totalCart.value++;
      update();
      Get.back();
      Get.dialog(AlertDialog(
          title: TitleAlert(title: 'Enhorabuena'),
          content: Text('Producto agregado al carrito')));
    } on DioError catch (e) {
      Get.back();
      if (e.response != null && e.response != null) {
        Get.dialog(AlertDialog(
            title: TitleAlert(title: 'Ha ocurrido un error'),
            content: Text(e.response.data['message'])));
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.dialog(AlertDialog(
          title: TitleAlert(title: 'Ha ocurrido un error'),
          content: Text(e.toString())));
    }
  }
}
