/// A cutom theme for :
/// light mode - dark mode - fonts - colors
import 'package:flutter/material.dart';

class MyTheme {
  static Color blackColor = const Color(0xff242424);
  static Color whiteColor = const Color(0xffF8F8F8);
  static Color yellowColor = const Color(0xffFACC1D);
  static Color primaryLightColor = const Color(0xffB7935F);
  static Color primaryDarkColor = const Color(0xff141A2E);

  static ThemeData lightMode = ThemeData(
    primaryColor: primaryLightColor,

    ///* AppBarTheme :-
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation:
          0.0, // To remove the elevation of appBar while scrollin down
      centerTitle: true,
      backgroundColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.transparent,

    ///* TextTheme :-
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Messiri",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      titleMedium: TextStyle(
        fontFamily: "Messiri",
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: blackColor,
      ),
      labelLarge: TextStyle(
        fontFamily: "Messiri",
        fontSize: 23,
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
      labelMedium: TextStyle(
        fontFamily: "Messiri",
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
      labelSmall: TextStyle(
        fontFamily: "Messiri",
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: whiteColor,
      ),
    ),

    ///* DividerThemeData
    dividerTheme: DividerThemeData(color: primaryLightColor),

    /// backgroundColor in `BottomNavigationBar` has a bug 🪲
    //// bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: primaryLightColor,
    ///* BottomNavigationBarTheme :-
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(size: 44),
      unselectedIconTheme: const IconThemeData(size: 43),
      showUnselectedLabels: false,
      selectedItemColor: blackColor,
      unselectedItemColor: whiteColor,
    ),

    ///* ProgressIndicatorTheme :-
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: primaryLightColor,
    ),

    ///* IconThemeData :-
    iconTheme: IconThemeData(
      color: primaryLightColor,
    ),
  );
  static ThemeData darkMode = ThemeData(
    primaryColor: primaryDarkColor,

    ///* AppBarTheme :-
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: whiteColor),
      scrolledUnderElevation:
          0.0, // To remove the elevation of appBar while scrollin down
      centerTitle: true,
      backgroundColor: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.transparent,

    ///* TextTheme :-
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontFamily: "Messiri",
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        fontFamily: "Messiri",
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: whiteColor,
      ),
      titleSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        color: whiteColor,
      ),
      labelLarge: TextStyle(
        fontFamily: "Messiri",
        fontSize: 23,
        fontWeight: FontWeight.w600,
        color: yellowColor,
      ),
      labelMedium: TextStyle(
        fontFamily: "Messiri",
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: whiteColor,
      ),
      labelSmall: TextStyle(
        fontFamily: "Messiri",
        fontSize: 23,
        fontWeight: FontWeight.w600,
        color: blackColor,
      ),
    ),

    ///* DividerThemeData
    dividerTheme: DividerThemeData(color: yellowColor),
    dividerColor: yellowColor,

    /// backgroundColor in `BottomNavigationBar` has a bug 🪲
    //// bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: primaryLightColor,
    ///* BottomNavigationBarTheme :-
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: const IconThemeData(size: 44),
      unselectedIconTheme: const IconThemeData(size: 43),
      showUnselectedLabels: false,
      selectedItemColor: yellowColor,
      unselectedItemColor: whiteColor,
    ),

    ///* ProgressIndicatorTheme :-
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: yellowColor,
    ),

    ///* IconThemeData :-
    iconTheme: IconThemeData(
      color: yellowColor,
    ),
  );
}
