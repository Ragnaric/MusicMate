import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Class that contains convenience methods for platform-specific functionality
class PlatformUtils {
  static bool isAndroid() {
    return defaultTargetPlatform == TargetPlatform.android;
  }
}

/// Class that contains convenience methods for theme-related functionality
class ThemeUtils {
  static bool isDarkMode(BuildContext context) {
    return MediaQuery.of(context).platformBrightness == Brightness.dark;
  }
}

/// Class that contains convenience methods for screen dimensions and metrics
class ScreenUtils {
  static Orientation orientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  static Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  static void closeDrawer(BuildContext context) {
    Navigator.pop(context);
  }
}