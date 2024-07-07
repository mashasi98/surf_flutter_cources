import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/const/app_colors.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/theme/app_theme.dart';

extension ThemeExtensions on ThemeData {
  Color getContainerColor( int themeIndex) {
    final ThemeData scheme;
    if (brightness == Brightness.light) {
      scheme = AppTheme.lightThemes[themeIndex];
      switch (scheme) {
        case  :///от тут я уперлась в свой код....
          return AppColors.themeCardLightGreenBackgroundColor;
        case :
          return AppColors.themeCardLightBlueBackgroundColor;
        case :
          return AppColors.themeCardOrangeLightBackgroundColor;
      }
    } else if (brightness == Brightness.dark) {
      scheme = AppTheme.darkThemes[themeIndex];
      switch (scheme) {
        case :
          return AppColors.themeCardDarkGreenBackgroundColor;
        case :
          return AppColors.themeCardDarkBlueBackgroundColor;
        case :
          return AppColors.themeCardOrangeDarkBackgroundColor;
      }
    }
    return Colors.white;
  }
}


