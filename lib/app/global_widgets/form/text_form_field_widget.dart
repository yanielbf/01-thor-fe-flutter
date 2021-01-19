import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget prefixIcon;
  final String value;
  final int maxLines;
  final Function(String) validator;
  final void Function(String) onChanged;
  final TextEditingController controller;

  TextFormFieldWidget({
    @required this.hintText,
    this.keyboardType,
    @required this.obscureText,
    this.prefixIcon,
    this.value,
    this.validator,
    this.maxLines = 1,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //textInputAction: TextInputAction.done,
      maxLines: maxLines,
      cursorColor: Theme.of(context).primaryColor,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: Theme.of(context).textTheme.bodyText2,
      autocorrect: false,
      controller:
          controller != null ? controller : TextEditingController(text: value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.subtitle2,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).accentColor.withOpacity(.4),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide(
              color: Theme.of(context).errorColor,
            )),
      ),
      validator: validator,
      onChanged: onChanged,
    );
  }
}
