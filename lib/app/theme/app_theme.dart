import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _ligthBackgroundPrimaryColor = Colors.white;
  static const Color _ligthPrimaryColor = Color(0xff3598DB);
  static const Color _ligthAccentColor = Color(0xFFFF5252);

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: _ligthBackgroundPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.light(primary: _ligthPrimaryColor),
    inputDecorationTheme: AppTheme._inputDecoration,
    buttonTheme: AppTheme._buttonTheme,
    textTheme: AppTheme._textTheme,
  );

  static InputDecorationTheme _inputDecoration = InputDecorationTheme(
    border: OutlineInputBorder(),
    labelStyle: TextStyle(color: _ligthPrimaryColor),
    focusColor: _ligthPrimaryColor,
    filled: true,
    enabledBorder: UnderlineInputBorder(
      borderRadius: BorderRadius.circular(3),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(3),
      borderSide: BorderSide(color: _ligthPrimaryColor),
    ),
  );

  static const ButtonThemeData _buttonTheme = ButtonThemeData(
    buttonColor: _ligthPrimaryColor,
    splashColor: _ligthAccentColor,
    height: 60.0,
  );

  static const TextTheme _textTheme = TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 36.0, fontFamily: 'Hind'),
    bodyText1: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
    bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
  );
}
