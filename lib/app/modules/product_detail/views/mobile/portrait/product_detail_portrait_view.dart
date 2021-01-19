import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:thor_flutter/app/global_widgets/animation/fade_animation.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/loading_widget.dart';
import 'package:thor_flutter/app/global_widgets/app/vertical_list_widget.dart';
import 'package:thor_flutter/app/modules/product_detail/product_detail_controller.dart';
import 'package:thor_flutter/app/utils/colors.dart';
import 'package:thor_flutter/app/utils/constants.dart';
import 'package:thor_flutter/app/utils/screens.dart';

class ProductDetailPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text(_.product != null ? _.product.name : '',
              style: Theme.of(context).textTheme.bodyText2),
          actions: [],
        ),
        body: Stack(
          children: [
            _.product != null
                ? Container(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SideInAnimation(1,
                              child: PinchZoomImage(
                                image: CachedNetworkImage(
                                    imageUrl: _.product.images[0]),
                                zoomedBackgroundColor:
                                    Color.fromRGBO(240, 240, 240, 1.0),
                                onZoomStart: () {
                                  print('Zoom started');
                                },
                                onZoomEnd: () {
                                  print('Zoom finished');
                                },
                              )),
                          SizedBox(height: Constants.SPACING_XS),
                          SideInAnimation(
                            2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    _.product.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(fontWeight: FontWeight.bold),
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
                          SideInAnimation(3,
                              child: Row(
                                children: [
                                  Text(
                                    "\$${_.product.salesPrice}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(
                                            color: _.product
                                                        .discountPercentage ==
                                                    0
                                                ? Theme.of(context).primaryColor
                                                : Colors.grey,
                                            decoration:
                                                _.product.discountPercentage > 0
                                                    ? TextDecoration.lineThrough
                                                    : null),
                                    textAlign: TextAlign.left,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(width: 10.0),
                                  _.product.discountPercentage > 0
                                      ? Text(
                                          "\$${(_.product.salesPrice - (_.product.salesPrice * (_.product.discountPercentage / 100))).toStringAsFixed(2)}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              .copyWith(color: kPrimaryColor),
                                          textAlign: TextAlign.left,
                                          maxLines: 2,
                                        )
                                      : Container(),
                                  SizedBox(width: 10.0),
                                  SmoothStarRating(
                                    color: kYellowColor,
                                    size: 15.0,
                                    isReadOnly: true,
                                    spacing: 5.0,
                                    starCount: 5,
                                    rating: _.product.rating.toDouble(),
                                    allowHalfRating: true,
                                    borderColor: kGreyColor,
                                  )
                                ],
                              )),
                          SizedBox(height: Constants.SPACING_XS),
                          SideInAnimation(
                            4,
                            child: Text(
                              'Description',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          FadeInAnimation(
                            5,
                            child: ReadMoreText(
                              _.product.description,
                              trimLines: 4,
                              colorClickableText:
                                  Theme.of(context).primaryColor,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: '\n...Show more',
                              trimExpandedText: '\nshow less',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                          SizedBox(height: Constants.SPACING_M),
                          _.product.variations.length > 0
                              ? Text(
                                  'Variaciones',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontWeight: FontWeight.bold),
                                )
                              : Container(),
                          SizedBox(height: Constants.SPACING_S),
                          _.product.variations.length > 0
                              ? VerticalList(
                                  itemCount: _.product.variations,
                                  onTapItem: (item) {
                                    _.fetchProductDetail(item.id);
                                  })
                              : Container(),
                          SizedBox(height: 100.0),
                        ],
                      ),
                    ),
                  )
                : Container(),
            Obx(() => LoadingOverlay(
                  isLoading: _.isLoading.value,
                )),
          ],
        ),
        floatingActionButton: _.product != null && !_.isLoading.value
            ? FloatingActionButton.extended(
                onPressed: () {
                  _.executeProductToCart();
                },
                backgroundColor: kPrimaryColor,
                label: Text(
                  'Agregar al carrito',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.white),
                ),
              )
            : Container(),
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
