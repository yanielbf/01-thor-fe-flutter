import 'package:flutter/material.dart';

class Subhead extends StatelessWidget {
  final String title;
  final Function onTap;

  const Subhead({Key key, @required this.title, @required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: Theme.of(context).textTheme.headline3,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              'Ver todos',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
        ],
      ),
    );
  }
}
