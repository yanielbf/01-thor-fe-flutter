import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thor_flutter/app/utils/colors.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    textSelectionTheme: TextSelectionThemeData(cursorColor: kPrimaryColor),
    appBarTheme: AppBarTheme(color: Colors.white, elevation: 0),
    primaryColor: kPrimaryColor,
    accentColor: kSecondaryDarkFontColor,
    errorColor: kErrorLightColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: kBackgroundDarkColor),
//    accentIconTheme: IconThemeData(color: kAccentIconLightColor),
    primaryIconTheme: IconThemeData(color: kBackgroundDarkColor),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      // Bold ---------------------------------------------
      headline1: GoogleFonts.poppins(
        color: kPrimaryLightFontColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.poppins(
        color: kPrimaryLightFontColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline3: GoogleFonts.poppins(
        color: kPrimaryLightFontColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.poppins(
        color: kPrimaryLightFontColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headline5: GoogleFonts.poppins(
        color: kSecondaryLightFontColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),

      // -------------------------------------------------

      bodyText1: GoogleFonts.poppins(
        color: kPrimaryLightFontColor,
        fontSize: 16.0,
      ),
      bodyText2: GoogleFonts.poppins(
        color: kPrimaryLightFontColor,
        fontSize: 14.0,
      ),
      subtitle1: GoogleFonts.poppins(
        color: kSecondaryLightFontColor,
        fontSize: 14.0,
      ),
      subtitle2: GoogleFonts.poppins(
        color: kSecondaryLightFontColor,
        fontSize: 12.0,
      ),
      button: GoogleFonts.poppins(
        color: kBackgroundLightColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

// Dark Them
ThemeData darkThemeData(BuildContext context) {
  return ThemeData.dark().copyWith(
    textSelectionTheme: TextSelectionThemeData(cursorColor: kPrimaryColor),
    primaryColor: kPrimaryColor,
    accentColor: kSecondaryLightFontColor,
    buttonColor: kPrimaryColor,
    cardColor: kCardDarkColor,
    errorColor: kErrorDarkColor,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kBackgroundDarkColor,
    appBarTheme: AppBarTheme(color: kBackgroundDarkColor, elevation: 0.0),
    backgroundColor: kBackgroundDarkColor,
    iconTheme: IconThemeData(color: kPrimaryColor),
    accentIconTheme: IconThemeData(color: kPrimaryColor),
    primaryIconTheme: IconThemeData(color: kPrimaryColor),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      // Bold ---------------------------------------------
      headline1: GoogleFonts.poppins(
        color: kPrimaryDarkFontColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      headline2: GoogleFonts.poppins(
        color: kPrimaryDarkFontColor,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      headline3: GoogleFonts.poppins(
        color: kPrimaryDarkFontColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      headline4: GoogleFonts.poppins(
        color: kPrimaryDarkFontColor,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      headline5: GoogleFonts.poppins(
        color: kPrimaryDarkFontColor,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),

      // -------------------------------------------------

      bodyText1: GoogleFonts.poppins(
        color: kPrimaryDarkFontColor,
        fontSize: 18.0,
      ),
      bodyText2: GoogleFonts.poppins(
        color: kPrimaryDarkFontColor,
        fontSize: 16.0,
      ),
      subtitle1: GoogleFonts.poppins(
        color: kSecondaryDarkFontColor,
        fontSize: 14.0,
      ),
      subtitle2: GoogleFonts.poppins(
        color: kSecondaryDarkFontColor,
        fontSize: 12.0,
      ),
      button: GoogleFonts.poppins(
        color: kPrimaryDarkFontColor,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

AppBarTheme appBarTheme = AppBarTheme(color: Colors.transparent, elevation: 0);
