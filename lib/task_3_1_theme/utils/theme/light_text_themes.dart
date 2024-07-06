import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/const/app_colors.dart';

class LightTextThemes {
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.bold,
    color: AppColors.blackTextColor,
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    color: AppColors.blackTextColor,
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.blackTextColor,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: AppColors.blackTextColor,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.blackTextColor,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.blackTextColor,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w400,
    color: AppColors.blackTextColor,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.blackTextColor,
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.blackTextColor,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.blackTextColor,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.blackTextColor,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.whiteTextColor,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.blackTextColor,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.blackTextColor,
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.blackTextColor,
  );

  static TextTheme getLightTextTheme() {
    return const TextTheme(
      displayLarge: LightTextThemes.displayLarge,
      displayMedium: LightTextThemes.displayMedium,
      displaySmall: LightTextThemes.displaySmall,
      headlineLarge: LightTextThemes.headlineLarge,
      headlineMedium: LightTextThemes.headlineMedium,
      headlineSmall: LightTextThemes.headlineSmall,
      titleLarge: LightTextThemes.titleLarge,
      titleMedium: LightTextThemes.titleMedium,
      titleSmall: LightTextThemes.titleSmall,
      bodyLarge: LightTextThemes.bodyLarge,
      bodyMedium: LightTextThemes.bodyMedium,
      bodySmall: LightTextThemes.bodySmall,
      labelLarge: LightTextThemes.labelLarge,
      labelMedium: LightTextThemes.labelMedium,
      labelSmall: LightTextThemes.labelSmall,
    );
  }
}