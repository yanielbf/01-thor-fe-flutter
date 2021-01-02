import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/cart.dart';
import 'package:thor_flutter/app/global_widgets/app/counter_widget.dart';
import 'package:thor_flutter/app/modules/cart/cart_controller.dart';

class CartCard extends StatelessWidget {
  CartItem cartItem;

  CartCard(this.cartItem);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (_) {
        return Card(
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            width: Get.width,
            height: 120.0,
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: CachedNetworkImage(
                    imageUrl: cartItem.image,
                    height: 100.0,
                    width: 100.0,
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                cartItem.name,
                                style: Theme.of(context).textTheme.headline5,
                                textAlign: TextAlign.start,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(width: 5.0),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    FlutterIcons.heart_outline_mco,
                                    color: Theme.of(context).errorColor,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                GestureDetector(
                                  onTap: () {
                                    double subPrice =
                                        cartItem.pricePromotional > 0
                                            ? cartItem.pricePromotional
                                            : cartItem.price;
                                    _.removeCart(cartItem.rowId, cartItem.qty,
                                        cartItem.qty * subPrice);
                                  },
                                  child: Icon(
                                    FlutterIcons.delete_outline_mco,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "\$${cartItem.pricePromotional > 0 ? cartItem.pricePromotional : cartItem.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .apply(
                                        color: Theme.of(context).primaryColor),
                              ),
                            ),
                            Counter(
                                cartItem.rowId,
                                cartItem.pricePromotional > 0
                                    ? cartItem.pricePromotional
                                    : cartItem.price,
                                cartItem.qty),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
