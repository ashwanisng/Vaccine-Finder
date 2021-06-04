import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefrences {
  static const THEME_STATUS = "THEME_STATUS";

  void setTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(THEME_STATUS, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(THEME_STATUS) ?? false;
  }
}
