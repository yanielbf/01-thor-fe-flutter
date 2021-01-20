import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/data/model/bill.dart';
import 'package:thor_flutter/app/modules/bills/bills_controller.dart';

class BillCard extends StatelessWidget {
  const BillCard({
    Key key,
    @required this.bill,
  }) : super(key: key);

  final Bill bill;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillsController>(builder: (_) {
      return GestureDetector(
        onTap: () {
          _.launcher.launchExternalUrl(bill.pdf);
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
              Text(bill.reference.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Theme.of(context).primaryColor)),
              SizedBox(height: 12.0),
              Text(bill.date, style: Theme.of(context).textTheme.subtitle2),
              Divider(),
              SizedBox(height: 12.0),
              orderCardItem(context,
                  title: "Productos",
                  data: "${bill.totalItems} productos comprados"),
              SizedBox(height: 12.0),
              priceItem(context,
                  title: "Precio", data: "\$ ${bill.totalAmount}"),
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
