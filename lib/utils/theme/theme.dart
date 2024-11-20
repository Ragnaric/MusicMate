import 'package:flutter/material.dart';
import 'package:music_mate/utils/theme/tailored_themes/appbar_theme.dart';
import 'package:music_mate/utils/theme/tailored_themes/drawer_theme.dart';
import 'package:music_mate/utils/theme/tailored_themes/elevated_button_theme.dart';
import 'package:music_mate/utils/theme/tailored_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.greenAccent,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    drawerTheme: TDrawerTheme.lightDrawerTheme,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.greenAccent,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    drawerTheme: TDrawerTheme.darkDrawerTheme,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
  );
}