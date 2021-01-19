import 'package:flutter/material.dart';

class AlertTitle extends StatelessWidget {
  final String title;
  AlertTitle({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold));
  }
}
