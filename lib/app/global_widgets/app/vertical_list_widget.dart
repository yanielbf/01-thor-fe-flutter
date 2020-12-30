import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:thor_flutter/app/data/model/product.dart';
import 'package:thor_flutter/app/global_widgets/animation/fade_animation.dart';
import 'package:thor_flutter/app/global_widgets/app/product_card_widget.dart';

class VerticalList extends StatelessWidget {
  final List<Product> itemCount;
  final Function onTapItem;
  VerticalList({
    Key key,
    @required this.itemCount,
    this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      itemCount: itemCount.length,
      crossAxisCount: 4,
      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
      mainAxisSpacing: 15.0,
      crossAxisSpacing: 15.0,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      itemBuilder: (context, index) {
        var product = itemCount[index];
        return FadeInAnimation(
          index,
          child: ProductCard(
            product: product,
            isHorizontalList: false,
            onTap: () {
              onTapItem(product);
            },
          ),
        );
      },
    );
  }
}
