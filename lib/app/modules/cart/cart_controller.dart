import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_select/smart_select.dart';
import 'package:thor_flutter/app/data/model/cart.dart';
import 'package:thor_flutter/app/data/model/setting.dart';
import 'package:thor_flutter/app/data/repository/store_repo.dart';
import 'package:thor_flutter/app/global_widgets/app/progress_indicator.dart';
import 'package:thor_flutter/app/global_widgets/error/title_error.dart';
import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/utils/colors.dart';

class CartController extends GetxController {
  final AppController appController = Get.find<AppController>();
  final StoreRepo _storeRepo = Get.find<StoreRepo>();

  List<S2Choice<String>> currenciesOptions;
  Currency checkoutCurrency;
  Cart cart;

  @override
  void onReady() {
    super.onReady();
    _bootstrap();
  }

  void _bootstrap() async {
    checkoutCurrency = appController.mainCurrency;
    _setCurrenciesOptions();
    await getCart();
  }

  Future<void> getCart() async {
    try {
      cart = await _storeRepo.requestCart(checkoutCurrency.id);
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

  void removeCart(String rowId, int qty, double price) {
    Get.dialog(AlertDialog(
      title: TitleAlert(title: '¿Desea eliminar el producto?'),
      content: Text('Necesitará agregar el producto nuevamente al carrito'),
      actions: [
        FlatButton(
          child: Text(
            "Aceptar",
            style: TextStyle(color: kPrimaryColor),
          ),
          onPressed: () async {
            Get.back();
            await _removeCart(rowId, qty, price);
          },
        )
      ],
    ));
  }

  Future<void> _removeCart(String rowId, int qty, double price) async {
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

  void destroyCart() async {
    Get.dialog(AlertDialog(
      title: TitleAlert(title: '¿Desea vaciar el carrito?'),
      content: Text('Necesitará agregar los productos nuevamente al carrito'),
      actions: [
        FlatButton(
          child: Text(
            "Aceptar",
            style: TextStyle(color: kPrimaryColor),
          ),
          onPressed: () async {
            Get.back();
            await _destroyCart();
          },
        )
      ],
    ));
  }

  void checkout() async {
    Get.dialog(AlertDialog(
      title: TitleAlert(title: '¿Desea realizar la compra?'),
      content:
          Text('La compra finalizará con los productos agregados al carrito'),
      actions: [
        FlatButton(
          child: Text(
            "Aceptar",
            style: TextStyle(color: kPrimaryColor),
          ),
          onPressed: () async {
            Get.back();
            await _checkout();
          },
        )
      ],
    ));
  }

  Future<void> _checkout() async {
    ProggresIndicatorCC.processRequest();
    try {
      await _storeRepo.requestCheckout(checkoutCurrency.id);
      cart = null;
      checkoutCurrency = appController.mainCurrency;
      appController.totalCart.value = 0;
      update();
      Get.back();
      Get.dialog(AlertDialog(
          title: TitleAlert(title: 'Enhorabuena'),
          content: Text('La orden de compra se realizó satisfactoriamente')));
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

  Future<void> _destroyCart() async {
    ProggresIndicatorCC.processRequest();
    try {
      await _storeRepo.requestDestroyCart();
      appController.totalCart.value = 0;
      cart.items = [];
      cart.subtotalPrice = "0.00 ${checkoutCurrency.name}";
      cart.totalPrice = "0.00 ${checkoutCurrency.name}";
      cart.total = 0;
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

  Future<void> changeCurrency(String value) async {
    checkoutCurrency =
        appController.currencies.firstWhere((e) => e.id == int.parse(value));
    await getCart();
  }

  String convertToCurrentCurrency(double value) {
    return "${value * checkoutCurrency.exchangeRate} ${checkoutCurrency.name}";
  }

  void _setCurrenciesOptions() {
    currenciesOptions = appController.currencies
        .map((e) => S2Choice<String>(title: e.name, value: e.id.toString()))
        .toList();
  }

  String _slitPrice(String value, double money, String direccion) {
    List<String> pieces = value.split(' ');
    double newValue = double.parse(pieces[0]);
    newValue = direccion == 'inc' ? newValue + money : newValue - money;
    return newValue.toString() + ' ' + pieces[1];
  }
}
