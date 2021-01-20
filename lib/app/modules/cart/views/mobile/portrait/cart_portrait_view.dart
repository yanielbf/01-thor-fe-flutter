import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_select/smart_select.dart';
import 'package:thor_flutter/app/data/model/cart.dart';
import 'package:thor_flutter/app/global_widgets/animation/fade_animation.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/alert_dialog_widget.dart';
import 'package:thor_flutter/app/global_widgets/app/cart_card_widget.dart';
import 'package:thor_flutter/app/global_widgets/app/loading_widget.dart';
import 'package:thor_flutter/app/global_widgets/app/no_items.dart';
import 'package:thor_flutter/app/global_widgets/button/raised_button_widget.dart';
import 'package:thor_flutter/app/global_widgets/form/text_form_field_widget.dart';
import 'package:thor_flutter/app/modules/cart/cart_controller.dart';
import 'package:thor_flutter/app/utils/constants.dart';

class CartPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(Constants.IMAGE_LOGO_SIMPLE),
          ),
          title: Text("Carrito de compras",
              style: Theme.of(context).textTheme.bodyText2),
          elevation: 0.0,
        ),
        body: _.cart != null && _.cart.items.length > 0
            ? Stack(
                children: [
                  Container(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SmartSelect<String>.single(
                              title: 'Monedas',
                              value: _.checkoutCurrency.id.toString(),
                              choiceItems: _.currenciesOptions,
                              onChange: (state) =>
                                  _.changeCurrency(state.value)),
                          Divider(
                              color: Theme.of(context)
                                  .accentColor
                                  .withOpacity(.5)),
                          SizedBox(height: Constants.SPACING_XS),
                          Text(
                              'Tasa de cambio: 1 ${_.appCtl.mainCurrency.name} = ${_.checkoutCurrency.exchangeRate} ${_.checkoutCurrency.name}'),
                          SizedBox(height: Constants.SPACING_XS),
                          ListView.builder(
                            itemCount: _.cart.items.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              CartItem cartItem = _.cart.items[index];
                              return SideInAnimation(index,
                                  child: CartCard(cartItem));
                            },
                          ),
                          SizedBox(height: Constants.SPACING_S),
                          FadeInAnimation(
                            4,
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(
                                    color: Theme.of(context).accentColor),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Productos (${_.cart.total})',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      Text('',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1),
                                    ],
                                  ),
                                  SizedBox(height: 12.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Subtotal',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                      Text(_.cart.subtotalPrice,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1),
                                    ],
                                  ),
                                  SizedBox(height: 12.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Impuestos',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                      Text(_.cart.tax,
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1),
                                    ],
                                  ),
                                  SizedBox(height: 12.0),
                                  Divider(
                                    color: Theme.of(context).accentColor,
                                    thickness: 1.0,
                                  ),
                                  SizedBox(height: 12.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Total',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle2),
                                      Text(
                                        _.cart.totalPrice,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4
                                            .copyWith(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: Constants.SPACING_S),
                          Text(
                              'Dirección de envío: ${_.appCtl.customer.address.text}'),
                          SizedBox(height: Constants.SPACING_S),
                          TextFormFieldWidget(
                            maxLines: 6,
                            obscureText: false,
                            hintText: 'Dejar una nota',
                            onChanged: (value) => _.comments = value,
                          ),
                          SizedBox(height: Constants.SPACING_M),
                          FadeInAnimation(
                            5,
                            child: RaisedButtonWidget(
                              title: 'Comprar',
                              onPressed: () {
                                showCheckoutConfirmation(_);
                              },
                            ),
                          ),
                          SizedBox(height: Constants.SPACING_M),
                          FadeInAnimation(
                            5,
                            child: RaisedButtonWidget(
                              title: 'Vaciar carrito',
                              onPressed: () {
                                showEmptyCartConfirmation(_);
                              },
                            ),
                          ),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                  ),
                  Obx(() => LoadingOverlay(
                        isLoading: _.isLoading.value,
                      )),
                ],
              )
            : !_.isLoading.value
                ? NoItems()
                : Obx(() => LoadingOverlay(
                      isLoading: _.isLoading.value,
                    )),
      );
    });
  }

  showCheckoutConfirmation(CartController _) {
    return showDialog(
      context: Get.context,
      builder: (context) {
        return AlertDialogCC(
          '¿Desea realizar la compra?',
          yesAction: () {
            _.executeCheckout();
          },
          noAction: () {},
        );
      },
    );
  }

  showEmptyCartConfirmation(CartController _) {
    return showDialog(
      context: Get.context,
      builder: (context) {
        return AlertDialogCC(
          '¿Desea vaciar el carrito?',
          yesAction: () {
            _.executeDestroyCart();
          },
          noAction: () {},
        );
      },
    );
  }
}
