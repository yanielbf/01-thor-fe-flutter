import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class ButtonDialog extends StatelessWidget {
  final String title;
  final VoidCallback callback;

  ButtonDialog({@required this.title, @required this.callback});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: ColorThemeCC.primaryColor,
      child: Text("Cerrar"),
      onPressed: () {
        callback();
      },
    );
  }
}
