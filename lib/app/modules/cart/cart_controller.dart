import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_select/smart_select.dart';
import 'package:thor_flutter/app/data/model/cart.dart';
import 'package:thor_flutter/app/data/model/setting.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/alert_dialog_widget.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';

class CartController extends GetxController {
  final AppController appCtl = Get.find<AppController>();
  final StoreRepo _storeRepo = Get.find<StoreRepo>();

  List<S2Choice<String>> currenciesOptions;
  Currency checkoutCurrency;
  Cart cart;
  String comments = '';
  RxBool isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    checkoutCurrency = appCtl.mainCurrency;
    _setCurrenciesOptions();
    await fetchCart();
  }

  Future<void> fetchCart() async {
    try {
      isLoading.value = true;
      cart = await _storeRepo.requestCart(checkoutCurrency.id);
      appCtl.totalCart.value = cart.total;
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

  Future<void> executeUpdateCart(
      String rowId, int currentQty, double price, String direction) async {
    try {
      if (direction == 'dec' && currentQty - 1 == 0) {
        return;
      }
      isLoading.value = true;
      int qty = direction == 'inc' ? currentQty + 1 : currentQty - 1;
      cart = await _storeRepo.requestUpdateItemFromCart(
          rowId, qty, checkoutCurrency.id);
      appCtl.totalCart.value = cart.total;
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

  Future<void> executeRemoveCart(String rowId, int qty, double price) async {
    try {
      isLoading.value = true;
      await _storeRepo.requestRemoveFromCart(rowId);
      cart.items = cart.items.where((e) => e.rowId != rowId).toList();
      cart.subtotalPrice = _slitPrice(cart.subtotalPrice, price, 'dec');
      cart.totalPrice = _slitPrice(cart.totalPrice, price, 'dec');
      cart.total = cart.total - qty;
      appCtl.totalCart.value = cart.total;
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

  Future<void> executeCheckout() async {
    try {
      isLoading.value = true;
      await _storeRepo.requestCheckout(checkoutCurrency.id, comments);
      cart = null;
      checkoutCurrency = appCtl.mainCurrency;
      appCtl.totalCart.value = 0;
      update();
      Get.dialog(AlertDialogCC('Enhorabuena',
          content: Text('La orden de compra se realizó satisfactoriamente')));
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

  Future<void> executeDestroyCart() async {
    try {
      isLoading.value = true;
      await _storeRepo.requestDestroyCart();
      appCtl.totalCart.value = 0;
      cart.items = [];
      cart.subtotalPrice = "0.00 ${checkoutCurrency.name}";
      cart.totalPrice = "0.00 ${checkoutCurrency.name}";
      cart.total = 0;
      appCtl.totalCart.value = cart.total;
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

  Future<void> changeCurrency(String value) async {
    checkoutCurrency =
        appCtl.currencies.firstWhere((e) => e.id == int.parse(value));
    await fetchCart();
  }

  String convertToCurrentCurrency(double value) {
    double valueC = value * checkoutCurrency.exchangeRate;
    valueC = double.parse((valueC).toStringAsFixed(2));
    return "$valueC ${checkoutCurrency.name}";
  }

  void _setCurrenciesOptions() {
    currenciesOptions = appCtl.currencies
        .map((e) => S2Choice<String>(title: e.name, value: e.id.toString()))
        .toList();
  }

  String _slitPrice(String value, double money, String direccion) {
    List<String> pieces = value.split(' ');
    double newValue = double.parse(pieces[0].replaceAll(',', ''));
    newValue = direccion == 'inc' ? newValue + money : newValue - money;
    return newValue.toString() + ' ' + pieces[1];
  }
}
