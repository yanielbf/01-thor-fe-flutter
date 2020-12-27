import 'package:thor_flutter/app/theme/color_theme.dart';
import 'package:flutter/material.dart';

class CardCC extends StatelessWidget {
  final Widget child;

  CardCC({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: ColorThemeCC.primaryColor.withOpacity(0.8),
                offset: Offset(0, 0),
                blurRadius: 5.0)
          ],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: this.child);
  }
}
