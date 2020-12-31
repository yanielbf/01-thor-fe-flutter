import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/global_widgets/animation/fade_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/product_grid_card_widget.dart';
import 'package:thor_flutter/app/modules/product_detail/product_detail_controller.dart';
import 'package:thor_flutter/app/modules/products_by_category/products_by_category_controller.dart';
import 'package:thor_flutter/app/routes/app_routes.dart';
import 'package:thor_flutter/app/utils/colors.dart';
import 'package:thor_flutter/app/utils/screens.dart';

class ProductsByCategoryPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsByCategoryController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_.categoryName),
          elevation: 0.0,
        ),
        body: StaggeredGridView.countBuilder(
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
                  _.appController.navigateToRoute(AppRoutes.PRODUCTDETAIL,
                      arguments: product.id);
                },
              ),
            );
          },
        ),
      );
    });
  }

  Widget swiperImage(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (_) {
      return Container(
        width: Screen.width(context),
        height: 230.0,
        child: Swiper(
          itemCount: _.product.images.length,
          scrollDirection: Axis.horizontal,
          autoplay: true,
          autoplayDelay: 5000,
          pagination: SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                size: 7.0,
                activeColor: kPrimaryColor,
                color: kGreyColor,
                activeSize: 7.0,
              )),
          itemBuilder: (context, index) {
            var image = _.product.images[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: CachedNetworkImage(
                imageUrl: image,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      );
    });
  }
}
