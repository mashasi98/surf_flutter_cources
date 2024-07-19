import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/text/app_text_constant.dart';

class ThemeSettings {

  static final Map<String, ThemeMode> themeVariations = {
    AppTextConstant.systemThemeText: ThemeMode.system,
    AppTextConstant.lightThemeText: ThemeMode.light,
    AppTextConstant.darkThemeText: ThemeMode.dark,
  };

  static String getThemeName(ThemeMode? mode) {
    switch (mode) {
      case ThemeMode.system:
        return AppTextConstant.systemThemeText;
      case ThemeMode.light:
        return AppTextConstant.lightThemeText;
      case ThemeMode.dark:
        return AppTextConstant.darkThemeText;
      default:
        return AppTextConstant.systemThemeText;
    }
  }
}
