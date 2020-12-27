import 'package:thor_flutter/app/modules/app/app_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:thor_flutter/app/theme/text_theme.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:flutter/material.dart';

class DrawerCC extends StatelessWidget {
  Widget getItem(AppController _, String route, String text, IconData icon) {
    if (route == _.activeRoute) {
      return Ink(
        color: ColorThemeCC.primaryColor,
        child: ListTile(
          title: Text(text,
              style: TextThemeCC()
                  .normal(fontWeight: FontWeight.bold, color: Colors.white)),
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          onTap: () {
            _.navigateToRoute(route);
          },
        ),
      );
    }
    return Ink(
      child: ListTile(
        title: Text(text,
            style: TextThemeCC().normal(color: ColorThemeCC.primaryColor)),
        leading: Icon(icon, color: ColorThemeCC.primaryColor),
        onTap: () {
          _.navigateToRoute(route);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppController>(builder: (_) {
      return Drawer(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          colors: ColorThemeCC.backgroundColorPrimary),
                      image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                          image: AssetImage("images/header.jpeg"),
                          fit: BoxFit.cover)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        _.customer.name,
                        style: TextThemeCC().normal(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            colorShadow: Colors.black),
                      ),
                      Text(
                        _.customer.email,
                        style: TextThemeCC().normal(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            colorShadow: Colors.black),
                      ),
                      Text(
                        _.customer.phone,
                        style: TextThemeCC().normal(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            colorShadow: Colors.black),
                      ),
                      SizedBox(height: 30.0)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListView(padding: EdgeInsets.all(0.0), children: [
                getItem(_, AppRoutes.MAIN, 'Menú', Icons.menu_book),
                getItem(_, AppRoutes.HISTORY, 'Pedidos', Icons.history),
                getItem(_, AppRoutes.PROFILE, 'Perfil', Icons.account_circle),
                ListTile(
                  title: Text("Cerrar sesión",
                      style: TextThemeCC()
                          .normal(color: ColorThemeCC.primaryColor)),
                  leading: Icon(Icons.close, color: ColorThemeCC.primaryColor),
                  onTap: () {
                    _.closeSession();
                  },
                ),
              ]),
            )
          ],
        ),
      );
    });
  }
}
