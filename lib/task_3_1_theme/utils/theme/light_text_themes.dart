import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/colors/app_colors.dart';

class LightTextThemes {
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.bold,
   
  );

  static const TextStyle displayMedium = TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
   
  );

  static const TextStyle displaySmall = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
   
  );

  static const TextStyle headlineLarge = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
   
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
   
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
   
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
   
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
   
  );

  static const TextStyle titleSmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
   
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
   
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
   
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
  );

  static const TextStyle labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
   
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
   
  );

  static const TextStyle labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
   
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