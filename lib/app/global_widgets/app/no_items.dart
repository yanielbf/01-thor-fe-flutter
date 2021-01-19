import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class NoItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FlutterIcons.inbox_ant, size: 40),
            SizedBox(height: 10),
            Text(
              'No hay nada para mostrar',
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
