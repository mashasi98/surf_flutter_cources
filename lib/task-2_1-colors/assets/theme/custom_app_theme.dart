import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/app_colors.dart';

class AppTheme {
  static ThemeData get theme {
    final base = ThemeData.light();

    return base.copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        textTheme: _CustomAppTextTheme.appTheme(base.textTheme),
        snackBarTheme:
            _CustomAppSnackBarTheme.appSnackTheme(base.snackBarTheme));
  }
}

class _CustomAppSnackBarTheme {
  static SnackBarThemeData appSnackTheme(SnackBarThemeData base) {
    return base.copyWith(
      backgroundColor: AppColors.snackColor,
      contentTextStyle: GoogleFonts.ubuntu(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        color: AppColors.snackTextColor,
      ),
    );
  }
}

class _CustomAppTextTheme {
  static TextTheme appTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: GoogleFonts.ubuntu(
        fontWeight: FontWeight.bold,
        fontSize: 30,
        color: AppColors.mainTextColor,
      ),
      displaySmall: GoogleFonts.ubuntu(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        color: AppColors.mainTextColor,
      ),
      bodySmall: GoogleFonts.ubuntu(
        fontWeight: FontWeight.normal,
        fontSize: 12,
        color: AppColors.mainTextColor,
      ),
    );
  }
}
