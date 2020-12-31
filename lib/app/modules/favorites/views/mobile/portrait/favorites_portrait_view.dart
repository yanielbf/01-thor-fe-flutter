import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/global_widgets/animation/fade_animation.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/product_grid_card_widget.dart';
import 'package:thor_flutter/app/modules/favorites/favorites_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';

class FavoritesPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavoritesController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Favoritos"),
          elevation: 0.0,
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10.0),
                _.products.length == 0
                    ? Container()
                    : SideInAnimation(
                        2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 15.0),
                          child: Text(
                            'Productos',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ),
                StaggeredGridView.countBuilder(
                  itemCount: _.products.length,
                  crossAxisCount: 4,
                  staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 15.0,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  itemBuilder: (context, index) {
                    var product = _.products[index];
                    return FadeInAnimation(
                      index,
                      child: ProductGridCard(
                        product: product,
                        onTap: () {
                          _.appController.navigateToRoute(
                              AppRoutes.PRODUCTDETAIL,
                              arguments: product.id);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
