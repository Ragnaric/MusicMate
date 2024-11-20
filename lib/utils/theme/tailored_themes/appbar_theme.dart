import 'package:flutter/material.dart';

class TAppBarTheme {
  static const AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    backgroundColor: Colors.greenAccent,
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: Colors.white
    ),
  );

  static const AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    backgroundColor: Colors.greenAccent,
    titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.white
    ),
  );
}