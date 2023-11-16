import 'package:shared_preferences/shared_preferences.dart';

class MyThemePreferences {
  static const ThemeKey = "theme_key";

  setTheme(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(ThemeKey, value);
  }

  getTheme() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(ThemeKey) ?? false;
  }
}
