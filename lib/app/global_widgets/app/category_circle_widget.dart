import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thor_flutter/app/data/model/category.dart';

class CategoryCircle extends StatelessWidget {
  final Category category;
  final Function onTap;

  const CategoryCircle({
    Key key,
    @required this.category,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80.0,
        child: Column(
          children: <Widget>[
            Container(
              width: 60.0,
              height: 60.0,
              child: CachedNetworkImage(
                imageUrl: category.icon,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).accentColor.withOpacity(.2)),
              ),
            ),
            SizedBox(height: 12.0),
            Text(category.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle2),
          ],
        ),
      ),
    );
  }
}
