import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thor_flutter/app/modules/cart/cart_controller.dart';

class Counter extends StatelessWidget {
  final String rowId;
  final int qty;
  final double price;

  Counter(this.rowId, this.price, this.qty);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(builder: (_) {
      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            SizedBox(width: 3.0),
            GestureDetector(
              onTap: () {
                _.executeUpdateCart(rowId, qty, price, 'dec');
              },
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            SizedBox(width: 3.0),
            CircleAvatar(
              radius: 15.0,
              backgroundColor: Theme.of(context).backgroundColor,
              child: Text(
                qty.toString(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            SizedBox(width: 3.0),
            GestureDetector(
              onTap: () {
                _.executeUpdateCart(rowId, qty, price, 'inc');
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 20.0,
              ),
            ),
            SizedBox(width: 3.0),
          ],
        ),
      );
    });
  }
}
