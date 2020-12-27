import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:thor_flutter/app/theme/text_theme.dart';
import 'package:flutter/material.dart';

class LinkText extends StatelessWidget {
  final String title;
  final VoidCallback callback;

  LinkText({@required this.title, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Text(title,
          style: TextThemeCC.linkTextStyle
              .merge(TextStyle(color: ColorThemeCC.primaryColor))),
      onTap: () {
        callback();
      },
    );
  }
}
