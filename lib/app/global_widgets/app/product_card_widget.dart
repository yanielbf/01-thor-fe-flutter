import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/utils/colors.dart';
import 'package:thor_flutter/app/utils/screens.dart';

class ProductCard extends StatelessWidget {
  final Function onTap;
  final Product product;
  final bool isHorizontalList;

  const ProductCard(
      {Key key,
      @required this.onTap,
      @required this.product,
      @required this.isHorizontalList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: isHorizontalList ? 15.0 : 0.0),
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
                      width: Screen.width(context),
                      fit: BoxFit.fitWidth,
                      height: 130.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    product.name,
                    style: Theme.of(context).textTheme.bodyText2,
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 3.0),
                  Row(
                    children: [
                      Text(
                        "\$${product.salesPrice}",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                            color: product.discountPercentage == 0
                                ? Theme.of(context).primaryColor
                                : Colors.grey,
                            decoration: product.discountPercentage > 0
                                ? TextDecoration.lineThrough
                                : null),
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(width: 10.0),
                      product.discountPercentage > 0
                          ? Text(
                              "\$${(product.salesPrice - (product.salesPrice * (product.discountPercentage / 100))).toStringAsFixed(2)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  .copyWith(color: kPrimaryColor),
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
              product.discountPercentage > 0
                  ? Positioned(
                      top: product.realStock > 0 ? 35.0 : 8.0,
                      left: 0.0,
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
                            "-${product.discountPercentage}%",
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
              product.realStock > 0
                  ? Positioned(
                      top: 8.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 3.0, horizontal: 10.0),
                        color: Colors.red,
                        child: Center(
                            child: Text('Agotado',
                                style: TextStyle(
                                    fontSize: 10.0, color: Colors.white))),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
