import 'package:flutter/material.dart';

class Style {
  static ThemeData themeData(bool isDarkModeEnabled) {
    return ThemeData(
      primaryColor: isDarkModeEnabled ? Colors.black : Colors.blue,
      scaffoldBackgroundColor:
          isDarkModeEnabled ? Color(0xff222222) : Colors.white,
      colorScheme: isDarkModeEnabled ? ColorScheme.dark() : ColorScheme.light(),
    );
  }
}
