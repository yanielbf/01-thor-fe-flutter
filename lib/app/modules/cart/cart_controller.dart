import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/cart.dart';
import 'package:thor_flutter/app/data/model/setting.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/progress_indicator.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';

class CartController extends GetxController {
  final AppController appController = Get.find<AppController>();
  final StoreRepo _storeRepo = Get.find<StoreRepo>();

  Currency checkoutCurrency;
  Cart cart;

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    checkoutCurrency = appController.mainCurrency;
    await getCart();
  }

  Future<void> getCart() async {
    ProggresIndicatorCC.processRequest();
    try {
      cart = await _storeRepo.requestCart(appController.mainCurrency.id);
      appController.totalCart.value = cart.total;
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

  Future<void> updateCart(
      String rowId, int currentQty, double price, String direction) async {
    ProggresIndicatorCC.processRequest();
    try {
      int qty = direction == 'inc' ? currentQty + 1 : currentQty - 1;
      await _storeRepo.requestUpdateItemFromCart(rowId, qty);
      cart.items = cart.items.map((e) {
        if (e.rowId == rowId) {
          e.qty = qty;
        }
        return e;
      }).toList();
      cart.subtotalPrice = _slitPrice(cart.subtotalPrice, price, direction);
      cart.totalPrice = _slitPrice(cart.totalPrice, price, direction);
      cart.total = direction == 'inc' ? cart.total + 1 : cart.total - 1;
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

  Future<void> removeCart(String rowId, int qty, double price) async {
    ProggresIndicatorCC.processRequest();
    try {
      await _storeRepo.requestRemoveFromCart(rowId);
      cart.items = cart.items.where((e) => e.rowId != rowId).toList();
      cart.subtotalPrice = _slitPrice(cart.subtotalPrice, price, 'dec');
      cart.totalPrice = _slitPrice(cart.totalPrice, price, 'dec');
      cart.total = cart.total - qty;
      appController.totalCart.value = cart.total;
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

  Future<void> destroyCart() async {
    ProggresIndicatorCC.processRequest();
    try {
      await _storeRepo.requestDestroyCart();
      appController.totalCart.value = 0;
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

  Future<void> changeCurrency() async {
    checkoutCurrency = appController.mainCurrency;
    await getCart();
  }

  String _slitPrice(String value, double money, String direccion) {
    List<String> pieces = value.split(' ');
    double newValue = double.parse(pieces[0]);
    newValue = direccion == 'inc' ? newValue + money : newValue - money;
    return newValue.toString() + ' ' + pieces[1];
  }
}
