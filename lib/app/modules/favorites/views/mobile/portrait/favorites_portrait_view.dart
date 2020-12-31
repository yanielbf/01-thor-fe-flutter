import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/favorites/favorites_controller.dart';

class FavoritesPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Favoritos"),
            elevation: 0.0,
          ),
          body: Container());
    });
  }
}
