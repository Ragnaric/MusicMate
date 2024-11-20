import 'package:flutter/material.dart';

class TDrawerTheme {
  static const DrawerThemeData lightDrawerTheme = DrawerThemeData(
    elevation: 10,
    backgroundColor: Colors.lightBlueAccent,
    width: 350, //Default width in case the drawer widget doesn't specify one
    surfaceTintColor: Colors.red,
  );

  static const DrawerThemeData darkDrawerTheme = DrawerThemeData(
    elevation: 10,
    backgroundColor: Colors.lightBlueAccent,
    width: 350, //Default width in case the drawer widget doesn't specify one
    surfaceTintColor: Colors.red,
  );
}