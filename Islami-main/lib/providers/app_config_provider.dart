import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  ///
  /// [ MARK ] Variables: -
  String appLanguage = 'en'; // MaterialApp Local
  ThemeMode appMode = ThemeMode.light; // MaterialApp ThemeMode
  SharedPreferences? _prefs;

  /// [ MARK ] Utilities: -

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    if (appLanguage == "ar") {
      saveLanguage(true);
    } else {
      saveLanguage(false);
    }
    notifyListeners();
  }

  void changeMode(ThemeMode newMode) {
    if (appMode == newMode) {
      return;
    }
    appMode = newMode;
    if (appMode == ThemeMode.dark) {
      saveMode(true);
    } else {
      saveMode(false);
    }

    notifyListeners();
  }

  bool isDarkMode(ThemeMode mode) {
    bool isDark;
    if (mode == ThemeMode.light) {
      isDark = false;
    } else {
      isDark = true;
    }
    return isDark;
  }

  ///* SharedPreferences Utilities :-
  Future<void> readData() async {
    _prefs = await SharedPreferences.getInstance();
    if (getMode() ?? false) {
      appMode = ThemeMode.dark;
    } else {
      appMode = ThemeMode.light;
    }

    if (getLanguage() ?? false) {
      appLanguage = "ar";
    } else {
      appLanguage = "en";
    }
  }

  Future<void> saveLanguage(bool isArbic) async {
    await _prefs?.setBool("isArbic", isArbic);
  }

  Future<void> saveMode(bool isDark) async {
    await _prefs?.setBool("isDark", isDark);
  }

  bool? getLanguage() {
    return _prefs?.getBool("isArbic");
  }

  bool? getMode() {
    return _prefs?.getBool("isDark");
  }
}
