import 'package:badges/badges.dart';
import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class ButtonIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback callback;
  final Color color;
  final double size;

  ButtonIcon(
      {@required this.icon, @required this.callback, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(
          icon,
          size: size,
          color: color,
        ),
        onPressed: () {
          callback();
        });
  }
}
