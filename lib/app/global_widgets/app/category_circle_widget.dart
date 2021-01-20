import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:thor_flutter/app/data/model/category.dart';
import 'package:thor_flutter/app/utils/colors.dart';
import 'package:thor_flutter/app/utils/constants.dart';

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
        padding: EdgeInsets.all(5.0),
        width: 110.0,
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12.0),
              width: 70.0,
              height: 70.0,
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: category.icon,
                ),
              ),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).accentColor.withOpacity(.2)),
              ),
            ),
            SizedBox(height: Constants.SPACING_XS),
            Text(category.name,
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 12.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
