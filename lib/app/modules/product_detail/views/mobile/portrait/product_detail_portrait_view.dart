import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:thor_flutter/app/global_widgets/animation/fade_animation.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/vertical_list_widget.dart';
import 'package:thor_flutter/app/modules/product_detail/product_detail_controller.dart';
import 'package:thor_flutter/app/utils/colors.dart';
import 'package:thor_flutter/app/utils/screens.dart';

class ProductDetailPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (_) {
      if (_.product == null) {
        return Container();
      }
      return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //showSearch(context: context, delegate: Search());
              },
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SideInAnimation(1, child: swiperImage(context)),
                SizedBox(height: 15.0),
                SideInAnimation(
                  2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            _.product.name,
                            style: Theme.of(context).textTheme.headline3,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        SizedBox(width: 25.0),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.favorite_border,
                            color: Theme.of(context).errorColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                SideInAnimation(
                  3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SmoothStarRating(
                      color: kYellowColor,
                      size: 25.0,
                      isReadOnly: true,
                      spacing: 5.0,
                      starCount: 5,
                      rating: _.product.rating.toDouble(),
                      allowHalfRating: true,
                      borderColor: kGreyColor,
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                SideInAnimation(
                  4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "\$ ${_.product.salesPrice}",
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                SideInAnimation(
                  5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      'Description',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                FadeInAnimation(
                  6,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 5.0),
                    child: ReadMoreText(
                      _.product.description,
                      trimLines: 4,
                      colorClickableText: Theme.of(context).primaryColor,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '\n...Show more',
                      trimExpandedText: '\nshow less',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 18.0, vertical: 15.0),
                  child: Text(
                    'Variaciones',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                _.product.variations.length > 0
                    ? VerticalList(
                        itemCount: _.product.variations,
                        onTapItem: (item) {
                          _.getProductDetail(item.id);
                        })
                    : Container(),
                SizedBox(height: 100.0),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            //Get.to(CartPage());
          },
          backgroundColor: kPrimaryColor,
          label: Text(
            'Agregar al carrito',
            style: Theme.of(context).textTheme.button,
          ),
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
