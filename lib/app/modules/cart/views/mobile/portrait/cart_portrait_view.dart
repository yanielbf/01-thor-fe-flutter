import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/cart.dart';
import 'package:thor_flutter/app/global_widgets/animation/fade_animation.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/cart_card_widget.dart';
import 'package:thor_flutter/app/global_widgets/button/raised_button_widget.dart';
import 'package:thor_flutter/app/modules/cart/cart_controller.dart';

class CartPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (_) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Carrito de compras"),
            elevation: 0.0,
          ),
          body: Container(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Divider(color: Theme.of(context).accentColor.withOpacity(.5)),
                  SizedBox(height: 12.0),
                  ListView.builder(
                    itemCount: _.cart.items.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      CartItem cartItem = _.cart.items[index];
                      return SideInAnimation(index, child: CartCard(cartItem));
                    },
                  ),
                  SizedBox(height: 20.0),
                  // FadeInAnimation(
                  //   2,
                  //   child: Container(
                  //     width: Get.width,
                  //     height: 50.0,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(12.0),
                  //       border:
                  //           Border.all(color: Theme.of(context).primaryColor),
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           child: Padding(
                  //             padding:
                  //                 const EdgeInsets.symmetric(horizontal: 12.0),
                  //             child: TextField(
                  //               cursorColor: Theme.of(context).primaryColor,
                  //               style: Theme.of(context).textTheme.subtitle1,
                  //               decoration: InputDecoration(
                  //                 border: InputBorder.none,
                  //                 hintText: 'Enter coupon code',
                  //                 hintStyle:
                  //                     Theme.of(context).textTheme.subtitle2,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //         SizedBox(
                  //           width: 85.0,
                  //           height: 50.0,
                  //           child: RaisedButton(
                  //             color: Theme.of(context).primaryColor,
                  //             elevation: 0.0,
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(10.0),
                  //             ),
                  //             child: Text(
                  //               'Apply',
                  //               style: Theme.of(context).textTheme.button,
                  //             ),
                  //             onPressed: () {},
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 20.0),
                  FadeInAnimation(
                    4,
                    child: Container(
                      width: Get.width,
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border:
                            Border.all(color: Theme.of(context).accentColor),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Productos (${_.cart.total})',
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              Text('',
                                  style: Theme.of(context).textTheme.subtitle1),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal',
                                  style: Theme.of(context).textTheme.subtitle2),
                              Text(_.cart.subtotalPrice,
                                  style: Theme.of(context).textTheme.subtitle1),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Impuestos',
                                  style: Theme.of(context).textTheme.subtitle2),
                              Text(_.cart.tax,
                                  style: Theme.of(context).textTheme.subtitle1),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Divider(
                            color: Theme.of(context).accentColor,
                            thickness: 1.0,
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total',
                                  style: Theme.of(context).textTheme.subtitle2),
                              Text(
                                _.cart.totalPrice,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 18.0),
                  FadeInAnimation(
                    5,
                    child: RaisedButtonWidget(
                      title: 'Checkout',
                      onPressed: () {
                        //Get.to(AddressPage());
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  FadeInAnimation(
                    5,
                    child: RaisedButtonWidget(
                      title: 'Vaciar carrito',
                      onPressed: () {
                        _.destroyCart();
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
          ));
    });
  }
}
