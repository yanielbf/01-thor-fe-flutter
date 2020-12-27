import 'package:flutter/material.dart';

class TitleError extends StatelessWidget {
  final String title;
  TitleError({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold));
  }
}
