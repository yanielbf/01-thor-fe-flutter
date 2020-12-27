import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:thor_flutter/app/theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarCC extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(
      builder: (_) {
        return AppBar(
            title: Text(
              'La Cocina Cubana',
              style: TextThemeCC().appBarTitle(colorShadow: Colors.black38),
            ),
            backgroundColor: ColorThemeCC.primaryColor,
            actions: <Widget>[
              Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: _.closeSession,
                    child: Icon(
                      Icons.close,
                      size: 26.0,
                    ),
                  ))
            ]);
      },
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
