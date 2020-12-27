import 'package:badges/badges.dart';
import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class ButtonIconBadge extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback callback;
  final Color color;
  final double size;

  ButtonIconBadge(
      {@required this.title,
      @required this.icon,
      @required this.callback,
      this.color,
      this.size});

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeColor: ColorThemeCC.primaryColor,
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: Duration(milliseconds: 300),
      animationType: BadgeAnimationType.slide,
      badgeContent: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      child: IconButton(
          icon: Icon(
            icon,
            size: size,
            color: color,
          ),
          onPressed: () {}),
    );
  }
}
