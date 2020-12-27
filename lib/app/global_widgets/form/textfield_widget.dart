import 'package:flutter/material.dart';

class TextFieldCC extends StatelessWidget {
  final String placeholder;
  final ValueChanged callbackChange;
  final bool isPassword;
  final TextEditingController controller;

  TextFieldCC(
      {@required this.placeholder,
      @required this.callbackChange,
      this.isPassword = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        onChanged: callbackChange,
        obscureText: isPassword,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
            ),
            hintText: placeholder,
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none));
  }
}
