import 'package:flutter/cupertino.dart';
import 'package:vaccine_finder/theme/prefrences.dart';

class ThemeProvider with ChangeNotifier {
  bool _darkTheme = false;
  ThemePrefrences themePrefrences = ThemePrefrences();

  // getter
  bool get darkTheme => _darkTheme;

  // setter
  set darkTheme(bool value) {
    _darkTheme = value;
    themePrefrences.setTheme(value);
    notifyListeners();
  }
}
