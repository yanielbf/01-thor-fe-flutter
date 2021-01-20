import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/global_widgets/animation/side_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/bill_card_widget.dart';
import 'package:thor_flutter/app/global_widgets/app/loading_widget.dart';
import 'package:thor_flutter/app/global_widgets/app/no_items.dart';
import 'package:thor_flutter/app/modules/bills/bills_controller.dart';

class BillsPortraitView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BillsController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Obx(() => Text(
              _.type.value == 'ordinary-invoice' ? "Facturas" : "Rembolsos")),
          elevation: 0.0,
          actions: [
            PopupMenuButton<Choice>(
              onSelected: (choice) {
                _.changeTypeBill(choice.value);
              },
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                      value: choice, child: Text(choice.title));
                }).toList();
              },
            ),
          ],
        ),
        body: _.bills != null && _.bills.length > 0
            ? Stack(
                children: [
                  Container(
                    child: ListView.builder(
                      itemCount: _.bills.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 20.0),
                      itemBuilder: (context, index) {
                        var bill = _.bills[index];
                        return SideInAnimation(index,
                            child: BillCard(bill: bill));
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

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Facturas', value: 'ordinary-invoice'),
  const Choice(title: 'Rembolsos', value: 'refund-invoice'),
];

class Choice {
  const Choice({this.title, this.value, this.icon});
  final String title;
  final String value;
  final IconData icon;
}
