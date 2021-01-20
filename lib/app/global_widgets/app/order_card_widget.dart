import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/saleorder.dart';
import 'package:thor_flutter/app/modules/orders/orders_controller.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    Key key,
    @required this.order,
  }) : super(key: key);

  final SaleOrder order;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(builder: (_) {
      return GestureDetector(
        onTap: () {
          _.launcher.launchExternalUrl(order.pdf);
        },
        child: Container(
          width: Get.width,
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.only(bottom: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(color: Theme.of(context).accentColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(order.reference.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Theme.of(context).primaryColor)),
              SizedBox(height: 12.0),
              Text(order.date, style: Theme.of(context).textTheme.subtitle2),
              Divider(),
              SizedBox(height: 12.0),
              orderCardItem(context,
                  title: "Productos",
                  data: "${order.totalItems} productos comprados"),
              SizedBox(height: 12.0),
              orderCardItem(context, title: "Estado", data: order.status),
              SizedBox(height: 12.0),
              priceItem(context,
                  title: "Precio", data: "\$ ${order.totalAmount}"),
            ],
          ),
        ),
      );
    });
  }

  Widget orderCardItem(BuildContext context, {String title, String data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.subtitle1),
        Text(data, style: Theme.of(context).textTheme.bodyText2),
      ],
    );
  }

  Widget priceItem(BuildContext context, {String title, String data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.subtitle1),
        Text(data,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Theme.of(context).primaryColor)),
      ],
    );
  }
}
