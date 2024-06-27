import 'package:flutter/material.dart';

import '../entity/theme_settings.dart';

class ThemeSettingsState extends ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.system;

  ThemeMode get currentThemeMode => _currentThemeMode;

  void setThemeMode(String modeName) {
    if (ThemeSettings.themeSettings.containsKey(modeName)) {
      _currentThemeMode = ThemeSettings.themeSettings[modeName]!;
      notifyListeners();
    }
  }
}
