import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

   //-------light theme --------//
  static ThemeData lightTheme = ThemeData(
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.black))),
    primarySwatch: Colors.yellow,
    brightness: Brightness.light,
    cardColor: Colors.black,
    textTheme: TTextTheme.lightTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );

  //-------dark theme --------//
  static ThemeData darkTheme = ThemeData(
    primaryTextTheme: TextTheme(bodyMedium: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold), ),
    iconButtonTheme: IconButtonThemeData(
       style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white))
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white))),
    primarySwatch: Colors.yellow,
    brightness: Brightness.dark,
    cardColor: Colors.white,
    textTheme: TTextTheme.darkTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
  );
}

class TTextTheme {
  static TextTheme lightTheme =
      TextTheme(bodyMedium: TextStyle(color: Colors.black));

  static TextTheme darkTheme =
      TextTheme(bodyMedium: TextStyle(color: Colors.white));
}
