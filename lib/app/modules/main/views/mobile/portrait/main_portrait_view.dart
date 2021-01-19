import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:thor_flutter/app/global_widgets/animation/fade_animation.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/loading_widget.dart';
import 'package:thor_flutter/app/global_widgets/app/sub_head_widget.dart';
import 'package:thor_flutter/app/modules/main/main_controller.dart';
import 'package:thor_flutter/app/modules/main/views/mobile/portrait/local_widgets/categories.dart';
import 'package:thor_flutter/app/modules/main/views/mobile/portrait/local_widgets/more_sale.dart';
import 'package:thor_flutter/app/modules/main/views/mobile/portrait/local_widgets/news.dart';
import 'package:thor_flutter/app/modules/main/views/mobile/portrait/local_widgets/slider.dart';
import 'package:thor_flutter/app/modules/main/views/mobile/portrait/local_widgets/special_offers.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:thor_flutter/app/utils/constants.dart';
import 'package:thor_flutter/app/utils/screens.dart';

class MainPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(Constants.IMAGE_LOGO_SIMPLE),
          ),
          title: Text(Constants.APP_NAME,
              style: Theme.of(context).textTheme.bodyText2),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FlutterIcons.search_mdi,
              ),
              onPressed: () {
                //Get.to(SearchPage());
              },
            ),
            IconButton(
              icon: Icon(
                FlutterIcons.notifications_none_mdi,
              ),
              onPressed: () {
                //Get.to(NotificationPage());
              },
            ),
          ],
        ),
        body: Stack(
          children: [
            Container(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SliderMain(),
                    SizedBox(height: Constants.SPACING_S),
                    SideInAnimation(
                      2,
                      child: Subhead(
                        title: 'Categorías',
                        onTap: () {
                          _.appCtl.navigateToRoute(AppRoutes.CATEGORIES);
                        },
                      ),
                    ),
                    SizedBox(height: Constants.SPACING_S),
                    CategoryMain(),
                    SideInAnimation(
                      3,
                      child: Subhead(
                        title: 'Ofertas especiales',
                        onTap: () {
                          if (_.productsSpecialOffer != null) {
                            _.appCtl.navigateToRoute(
                                AppRoutes.PRODUCTSBYCATEGORY,
                                arguments: {
                                  'id': _.productsSpecialOffer['id'],
                                  'name': 'Ofertas especiales'
                                });
                          }
                        },
                      ),
                    ),
                    SizedBox(height: Constants.SPACING_S),
                    SpecialOffersMain(),
                    SizedBox(height: Constants.SPACING_S),
                    SideInAnimation(
                      4,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://i.pinimg.com/564x/6a/3b/7b/6a3b7bf9bc206333bb29c4a2c21983ae.jpg',
                        width: Screen.width(context),
                        fit: BoxFit.fitWidth,
                        height: 250.0,
                      ),
                    ),
                    SizedBox(height: Constants.SPACING_L),
                    SideInAnimation(
                      5,
                      child: Subhead(
                        title: 'Nuevos',
                        onTap: () {
                          if (_.productsNew != null) {
                            _.appCtl.navigateToRoute(
                                AppRoutes.PRODUCTSBYCATEGORY,
                                arguments: {
                                  'id': _.productsNew['id'],
                                  'name': 'Nuevos'
                                });
                          }
                        },
                      ),
                    ),
                    SizedBox(height: Constants.SPACING_S),
                    NewsMain(),
                    SizedBox(height: Constants.SPACING_S),
                    StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: _.productsImage.length = 3,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        var image = _.productsImage[index];
                        return Container(
                          child: FadeInAnimation(
                            index,
                            child: CachedNetworkImage(
                              imageUrl:
                                  image ?? 'http://via.placeholder.com/350x150',
                              fit: BoxFit.cover,
                              width: Screen.width(context),
                            ),
                          ),
                        );
                      },
                      staggeredTileBuilder: (int index) =>
                          new StaggeredTile.count(2, index.isEven ? 2 : 4),
                    ),
                    SideInAnimation(
                      6,
                      child: Subhead(
                        title: 'Más vendidos',
                        onTap: () {
                          if (_.productsMoreSale != null) {
                            _.appCtl.navigateToRoute(
                                AppRoutes.PRODUCTSBYCATEGORY,
                                arguments: {
                                  'id': _.productsMoreSale['id'],
                                  'name': 'Más vendidos'
                                });
                          }
                        },
                      ),
                    ),
                    SizedBox(height: Constants.SPACING_S),
                    MoreSaleMain(),
                    SizedBox(height: Constants.SPACING_S),
                  ],
                ),
              ),
            ),
            Obx(() => LoadingOverlay(
                  isLoading: _.isLoading.value,
                )),
          ],
        ),
      );
    });
  }
}
