import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/modules/profile_options/profile_options_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:thor_flutter/app/utils/colors.dart';
import 'package:thor_flutter/app/utils/screens.dart';

class ProfileOptionsPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileOptionsController>(builder: (_) {
      print(_);
      return Scaffold(
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: Screen.width(context),
                    height: 315.0,
                    child: Stack(
                      children: [
                        headerContent(
                          context,
                          image:
                              'assets/images/2ab08d7aa25abbd579f036c3c3acec47.png',
                          username:
                              _ != null ? _.appController.customer.name : '',
                          email:
                              _ != null ? _.appController.customer.email : '',
                        ),
                        primaryCard(context),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    elevation: 8.0,
                    child: Center(
                      child: Column(
                        children: [
                          SideInAnimation(
                            3,
                            child: ListTile(
                              onTap: () {
                                _.appController
                                    .navigateToRoute(AppRoutes.ORDERS);
                              },
                              leading: Icon(
                                FlutterIcons.layers_fea,
                                color: Theme.of(context).primaryColor,
                              ),
                              title: Text('Órdenes de compra',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 14.0)),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                          ),
                          SideInAnimation(
                            4,
                            child: ListTile(
                              onTap: () {
                                _.appController
                                    .navigateToRoute(AppRoutes.BILLS);
                              },
                              leading: Icon(
                                FlutterIcons.file_text_fea,
                                color: Theme.of(context).primaryColor,
                              ),
                              title: Text('Facturas',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 14.0)),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                          ),
                          SideInAnimation(
                            5,
                            child: ListTile(
                              leading: Icon(
                                FlutterIcons.bell_sli,
                                color: Theme.of(context).primaryColor,
                              ),
                              title: Row(children: [
                                Text('Notificaciones',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontSize: 14.0)),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Obx(() {
                                  return _.totalNotifications.value > 0
                                      ? Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 9, vertical: 3),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.red),
                                          child: Text(
                                              _.totalNotifications.value
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText2
                                                  .copyWith(
                                                      fontSize: 14.0,
                                                      color: Colors.white)),
                                        )
                                      : Container();
                                })
                              ]),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              onTap: () {
                                //Get.to(ActivityPage());
                              },
                            ),
                          ),
                          SideInAnimation(
                            7,
                            child: ListTile(
                              onTap: () {
                                _.appController
                                    .navigateToRoute(AppRoutes.ABOUTUS);
                              },
                              leading: Icon(
                                FlutterIcons.information_outline_mco,
                                color: Theme.of(context).primaryColor,
                              ),
                              title: Text('Acerca de nosotros',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 14.0)),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                          ),
                          SideInAnimation(
                            8,
                            child: ListTile(
                              onTap: () {
                                _.appController
                                    .navigateToRoute(AppRoutes.DEVELOPERS);
                              },
                              leading: Icon(
                                FlutterIcons.wrench_outline_mco,
                                color: Theme.of(context).primaryColor,
                              ),
                              title: Text('Desarrolladores',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 14.0)),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                          ),
                          SideInAnimation(
                            9,
                            child: ListTile(
                              onTap: () {
                                _.closeSession();
                              },
                              leading: Icon(
                                FlutterIcons.exit_to_app_mco,
                                color: Theme.of(context).primaryColor,
                              ),
                              title: Text('Cerrar sesión',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 14.0)),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50.0),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Positioned primaryCard(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: 120,
        margin: EdgeInsets.symmetric(horizontal: 18.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 8.0,
          child: Center(
            child: Column(
              children: [
                SideInAnimation(
                  1,
                  child: ListTile(
                    onTap: () {
                      //Get.to(ProfileDetailpage());
                    },
                    leading: Icon(
                      FlutterIcons.book_ant,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text('Datos de la cuenta',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 14.0)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),
                SideInAnimation(
                  2,
                  child: ListTile(
                    onTap: () {
                      //Get.to(ProfileAddressPage());
                    },
                    leading: Icon(
                      FlutterIcons.map_pin_fea,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text('Direcciones',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 14.0)),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container headerContent(
    BuildContext context, {
    String image,
    String username,
    String email,
  }) {
    return Container(
      width: Screen.width(context),
      height: 220.0,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.0),
          bottomRight: Radius.circular(25.0),
        ),
      ),
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Container(
              width: 95.0,
              height: 95.0,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white,
                  width: 2.0,
                ),
              ),
              child: CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(image),
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              username,
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(color: kBackgroundLightColor),
            ),
            SizedBox(height: 8.0),
            Text(
              email,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: kBackgroundLightColor),
            ),
          ],
        ),
      ),
    );
  }
}
