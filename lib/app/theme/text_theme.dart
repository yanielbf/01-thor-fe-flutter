import 'package:flutter/rendering.dart';

class TextThemeCC {
  TextStyle _textStyle = TextStyle();
  TextStyle get textStyle => _textStyle;

  static const font = TextStyle(fontFamily: 'Lato');
  static const fontSize5 = TextStyle(fontSize: 5.0);
  static const headerTextStyle = TextStyle(fontSize: 45.0, fontFamily: 'Lato');
  static const subHeaderTextStyle =
      TextStyle(fontSize: 30.0, fontFamily: 'Lato');
  static const bodyTextStyle = TextStyle(fontSize: 18.0, height: 1.5);
  static const linkTextStyle = TextStyle(fontSize: 18.0);

  // Predefined styles

  TextStyle header({Color color}) {
    return TextThemeCC()
        .addFont()
        .addFontSize(40.0)
        .addFontWeight(FontWeight.bold)
        .addColor(color)
        ._textStyle;
  }

  TextStyle subHeader({Color color}) {
    return TextThemeCC()
        .addFont()
        .addFontSize(30.0)
        .addFontWeight(FontWeight.bold)
        .addColor(color)
        ._textStyle;
  }

  TextStyle appBarTitle({Color color, Color colorShadow}) {
    return TextThemeCC()
        .addFont()
        .addFontSize(25.0)
        .addFontWeight(FontWeight.bold)
        .addColor(color)
        .addShadow(colorShadow)
        ._textStyle;
  }

  TextStyle normal({Color color, FontWeight fontWeight, Color colorShadow}) {
    return TextThemeCC()
        .addFont()
        .addFontSize(20.0)
        .addFontWeight(fontWeight)
        .addColor(color)
        .addShadow(colorShadow)
        ._textStyle;
  }

  TextStyle small({Color color}) {
    return TextThemeCC().addFont().addFontSize(15.0).addColor(color)._textStyle;
  }

  TextStyle x2lg({Color color}) {
    return TextThemeCC().addFont().addFontSize(45.0).addColor(color)._textStyle;
  }

  TextStyle xlg({Color color}) {
    return TextThemeCC().addFont().addFontSize(35.0).addColor(color)._textStyle;
  }

  TextStyle lg({Color color}) {
    return TextThemeCC().addFont().addFontSize(30.0).addColor(color)._textStyle;
  }

  TextStyle md({Color color}) {
    return TextThemeCC().addFont().addFontSize(25.0).addColor(color)._textStyle;
  }

  TextStyle sm({Color color}) {
    return TextThemeCC().addFont().addFontSize(20.0).addColor(color)._textStyle;
  }

  TextStyle xs({Color color}) {
    return TextThemeCC().addFont().addFontSize(15.0).addColor(color)._textStyle;
  }

  //Chainer

  TextThemeCC addFont() {
    _textStyle = _textStyle.merge(TextStyle(fontFamily: 'Lato'));
    return this;
  }

  TextThemeCC addFontSize(double fontSize) {
    _textStyle = _textStyle.merge(TextStyle(fontSize: fontSize));
    return this;
  }

  TextThemeCC addFontWeight(FontWeight fontWeight) {
    _textStyle = _textStyle.merge(TextStyle(fontWeight: fontWeight));
    return this;
  }

  TextThemeCC addColor(Color color) {
    _textStyle = _textStyle.merge(TextStyle(color: color));
    return this;
  }

  TextThemeCC addShadow(Color color) {
    if (color != null) {
      _textStyle = _textStyle.merge(TextStyle(shadows: [
        Shadow(
          blurRadius: 10.0,
          color: color,
          offset: Offset(1.0, 1.0),
        ),
      ]));
    }
    return this;
  }
}
