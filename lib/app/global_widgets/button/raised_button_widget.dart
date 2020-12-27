import 'package:flutter/material.dart';
import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:thor_flutter/app/utils/colors.dart';
import 'package:thor_flutter/app/utils/screens.dart';

class RaisedButtonWidget extends StatelessWidget {
  final String title;
  final Function onPressed;

  const RaisedButtonWidget({
    Key key,
    @required this.title,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Screen.width(context),
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.transparent,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.4),
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: RaisedButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: kBackgroundLightColor),
          ),
        ),
      ),
    );
  }
}
