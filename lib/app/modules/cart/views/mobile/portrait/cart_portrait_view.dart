import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/cart/cart_controller.dart';

class CartPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Carrito de compras"),
            elevation: 0.0,
          ),
          body: Container());
    });
  }
}
