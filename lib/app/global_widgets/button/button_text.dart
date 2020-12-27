import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class ButtonText extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  final Color color;

  ButtonText({
    @required this.title,
    @required this.callback,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: color != null ? color : ColorThemeCC.primaryColor),
      child: Material(
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          onTap: () {
            callback();
          },
          child: Center(
            child: Text(title,
                style: TextStyle(color: Colors.white, fontSize: 17.0)),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
