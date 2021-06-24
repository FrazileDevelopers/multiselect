import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ThemeData(
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      primaryColor: Colors.black,
      accentColor: Colors.amber,
      cardColor: Colors.black,
      canvasColor: Colors.black,
      tabBarTheme: TabBarTheme(
        labelColor: Colors.amber,
        unselectedLabelColor: Colors.white,
        indicatorSize: TabBarIndicatorSize.tab,
      ),
      textTheme: GoogleFonts.robotoMonoTextTheme(textTheme).copyWith(
        headline1: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        headline2: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        headline3: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        headline4: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        headline5: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        headline6: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle1: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        subtitle2: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        bodyText1: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),

        /// Body Style
        bodyText2: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),

        caption: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        button: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
        overline: GoogleFonts.robotoMono(
          textStyle: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
