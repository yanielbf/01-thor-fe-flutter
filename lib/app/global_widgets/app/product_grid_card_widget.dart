import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/utils/colors.dart';

class ProductGridCard extends StatelessWidget {
  final Function onTap;
  final Product product;

  const ProductGridCard({Key key, @required this.onTap, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(12.0),
        onTap: onTap,
        child: Container(
          width: 150.0,
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: CachedNetworkImage(
                      imageUrl: product.image,
                      height: 150.0,
                      fit: BoxFit.cover,
                      width: Get.width,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 3.0),
                  Row(
                    children: [
                      Text(
                        "\$${product.salesPrice}",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: Theme.of(context).primaryColor),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 5.0),
                      product.promotional == 1
                          ? Text(
                              "\$${product.salesPrice * (product.discountPercentage / 100)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle2
                                  .copyWith(
                                      decoration: TextDecoration.lineThrough),
                              textAlign: TextAlign.left,
                              maxLines: 2,
                            )
                          : Container(),
                    ],
                  ),
                  SizedBox(height: 3.0),
                  SmoothStarRating(
                    color: kYellowColor,
                    spacing: 1.0,
                    size: 15.0,
                    rating: product.rating.toDouble(),
                    isReadOnly: true,
                    starCount: 5,
                    allowHalfRating: true,
                    borderColor: Theme.of(context).accentColor,
                  ),
                  SizedBox(height: 5.0),
                ],
              ),
              product.promotional == 1
                  ? Positioned(
                      top: 8.0,
                      left: 8.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Theme.of(context).primaryColor.withOpacity(.8),
                        ),
                        height: 20.0,
                        child: Center(
                          child: Text(
                            "-${product.discountPercentage / 100}%",
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .subtitle2
                                .copyWith(color: kBackgroundLightColor),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Positioned(
                right: 0.0,
                top: 0.0,
                child: IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Theme.of(context).accentColor,
                    size: 23.0,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
