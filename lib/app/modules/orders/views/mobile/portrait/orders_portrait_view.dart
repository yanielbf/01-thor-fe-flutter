import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/loading_widget.dart';
import 'package:thor_flutter/app/global_widgets/app/no_items.dart';
import 'package:thor_flutter/app/global_widgets/app/order_card_widget.dart';
import 'package:thor_flutter/app/modules/orders/orders_controller.dart';

class OrdersPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Órdenes de compra"),
          elevation: 0.0,
        ),
        body: _.orders != null && _.orders.length > 0
            ? Stack(
                children: [
                  Container(
                    child: ListView.builder(
                      itemCount: _.orders.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 20.0),
                      itemBuilder: (context, index) {
                        var order = _.orders[index];
                        return SideInAnimation(index,
                            child: OrderCard(order: order));
                      },
                    ),
                  ),
                  Obx(() => LoadingOverlay(
                        isLoading: _.isLoading.value,
                      ))
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
}
