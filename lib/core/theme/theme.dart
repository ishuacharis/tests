import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//#94003B //primary
//#B03164 //accentcolor
//#ECE3EA //textcolor
class AppTheme {
  AppTheme._();

  static const _lightColor = Color(0XFFFAFAFA);
  static const _lighterColor = Color(0XFFECE3EA);
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
    //primaryColor: Color(0xFF94003B),
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: Color(0xFFECE3EA),
      ),
      backgroundColor: Color(0xFF94003B),
    ),
    accentColor: Color(0xFFB03164),
    dividerColor: Color(0xFFB03164) ,
    textTheme: TextTheme(
      headline3: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 26.0, color:_lighterColor )
      ),
      headline4: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 24.0, color:_lightColor )
      ),
      headline5: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 14.0, color: _lightColor,)
      ),
      headline6: GoogleFonts.lato(
        textStyle: TextStyle(fontSize: 12.0, color: _lightColor,)
      ),
      bodyText2: GoogleFonts.lato(
          textStyle: TextStyle(fontSize: 32.0, color: _lightColor,)
      ),
    ),
    sliderTheme: SliderThemeData(
        activeTrackColor: Color(0xFFB03164),
        thumbColor: Color(0xFFB03164),
        inactiveTrackColor: Color(0xFFDE729D),
        overlayColor: Color(0xFFDE729D)
    ),
    iconTheme: IconThemeData(
      color: Color(0xFFECE3EA),
    )
  );

}