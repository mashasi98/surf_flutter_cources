import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/theme/app_theme.dart';

class ThemeSettingsState extends ChangeNotifier {
  ThemeMode _currentThemeMode = ThemeMode.system;
  int _currentThemeIndex = 0;
  late SharedPreferences _prefs;

  late AnimationController _controller;
  late Animation<ThemeData> _themeAnimation;

  ThemeSettingsState(TickerProvider vsync) {
    _controller = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 500),
    );
    _themeAnimation = ThemeDataTween().animate(_controller);
    _loadThemeSettings();
  }

  ThemeMode get currentThemeMode => _currentThemeMode;

  int get currentThemeIndex => _currentThemeIndex;

  Animation<ThemeData> get themeAnimation => _themeAnimation;

  ThemeData get currentThemeData {
    if (_currentThemeMode == ThemeMode.system) {
      final Brightness brightness =
          PlatformDispatcher.instance.platformBrightness;
      return brightness == Brightness.dark
          ? AppTheme.darkThemes[_currentThemeIndex]
          : AppTheme.lightThemes[_currentThemeIndex];
    }
    return _currentThemeMode == ThemeMode.dark
        ? AppTheme.darkThemes[_currentThemeIndex]
        : AppTheme.lightThemes[_currentThemeIndex];
  }

  void _loadThemeSettings() async {
    _prefs = await SharedPreferences.getInstance();
    String? themeMode = _prefs.getString('themeMode');
    int? themeIndex = _prefs.getInt('themeIndex');

    if (themeMode != null) {
      _currentThemeMode = ThemeMode.values.firstWhere(
              (mode) => mode.toString() == themeMode,
          orElse: () => ThemeMode.system);
    }
    if (themeIndex != null) {
      _currentThemeIndex = themeIndex;
    }
    _controller.value = 1.0;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) async {
    if (_currentThemeMode != mode) {
      _currentThemeMode = mode;
      await _prefs.setString('themeMode', mode.toString());
      _controller.forward(from: 0);
      notifyListeners();
    }
  }

  void setThemeIndex(int index) async {
    if (_currentThemeIndex != index) {
      _currentThemeIndex = index;
      await _prefs.setInt('themeIndex', index);
      _controller.forward(from: 0);
      notifyListeners();
    }
  }
}
