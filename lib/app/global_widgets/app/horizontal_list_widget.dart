import 'package:flutter/material.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/global_widgets/app/product_card_widget.dart';
import 'package:thor_flutter/app/utils/screens.dart';

class HorizontalListView extends StatelessWidget {
  final List<Product> itemCount;
  HorizontalListView({
    Key key,
    @required this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen.width(context),
      height: 230.0,
      child: ListView.builder(
        itemCount: itemCount.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var product = itemCount[index];
          return ProductCard(
            product: product,
            isHorizontalList: true,
            onTap: () {
              //Get.to(ProductDetailPage(product: product));
            },
          );
        },
      ),
    );
  }
}
