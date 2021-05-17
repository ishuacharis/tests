import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//#94003B //primary
//#B03164 //accentcolor
//#ECE3EA //textcolor
class AppTheme {
  AppTheme._();

  static const _lightColor = Color(0XFF323131);
  static const _darkColor = Color(0XFF272127);
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Color(0XFFEDECED),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Color(0xFFECE3EA),
      ),
      backgroundColor: Color(0XFFEDECED),
    ),
    accentColor: Color(0xFFECE3EA),
    dividerColor: Color(0XFF272127) ,
    textTheme: TextTheme(
      headline4: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 24.0, color:_darkColor )
      ),
      headline6: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 14.0, color: _darkColor, fontWeight: FontWeight.w800)
      ),
      bodyText2: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 32.0, color: _darkColor,)
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0XFFEDECED),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Color(0xFFECE3EA),
      ),
      backgroundColor: Color(0xFF94003B),
    ),
    accentColor: Color(0xFFB03164),
    dividerColor: Color(0xFFB03164) ,
    textTheme: TextTheme(
      headline4: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 24.0, color:_lightColor )
      ),
      headline6: GoogleFonts.lato(
        textStyle: TextStyle(fontSize: 14.0, color: _lightColor,)
      ),
      bodyText2: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 32.0, color: _lightColor,)
      ),
    ),
  );

}