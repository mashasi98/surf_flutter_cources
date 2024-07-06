import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/const/app_colors.dart';

class DarkTextThemes {
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.whiteTextColor,
  );

  static TextTheme getDarkTextTheme() {
    return const TextTheme(
      displayLarge: DarkTextThemes.displayLarge,
      displayMedium: DarkTextThemes.displayMedium,
      displaySmall: DarkTextThemes.displaySmall,
      headlineLarge: DarkTextThemes.headlineLarge,
      headlineMedium: DarkTextThemes.headlineMedium,
      headlineSmall: DarkTextThemes.headlineSmall,
      titleLarge: DarkTextThemes.titleLarge,
      titleMedium: DarkTextThemes.titleMedium,
      titleSmall: DarkTextThemes.titleSmall,
      bodyLarge: DarkTextThemes.bodyLarge,
      bodyMedium: DarkTextThemes.bodyMedium,
      bodySmall: DarkTextThemes.bodySmall,
      labelLarge: DarkTextThemes.labelLarge,
      labelMedium: DarkTextThemes.labelMedium,
      labelSmall: DarkTextThemes.labelSmall,
    );
  }
}


