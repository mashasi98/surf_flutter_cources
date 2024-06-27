import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/const/app_text_constant.dart';

class ThemeSettings {
 static final Map<String, ThemeMode> themeVariations = {
    AppTextConstant.darkThemeText: ThemeMode.dark,
    AppTextConstant.lightThemeText: ThemeMode.light,
    AppTextConstant.systemThemeText: ThemeMode.system
  };
}
