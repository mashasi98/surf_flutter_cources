import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeSettingsState extends ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.system;
  late SharedPreferences _prefs;

  ThemeSettingsState() {
    _loadThemeMode();
  }

  ThemeMode get currentThemeMode => _currentThemeMode;

  void _loadThemeMode() async {
    _prefs = await SharedPreferences.getInstance();
    String? theme = _prefs.getString('themeMode');
    if (theme != null) {
      _currentThemeMode = ThemeMode.values.firstWhere(
              (mode) => mode.toString() == theme,
          orElse: () => ThemeMode.system);
      notifyListeners();
    }
  }

  void setThemeMode(ThemeMode mode) async {
    if (_currentThemeMode != mode) {
      _currentThemeMode = mode;
      await _prefs.setString('themeMode', mode.toString());
      notifyListeners();
    }
  }
}
