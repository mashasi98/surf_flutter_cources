
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FinanceWidgetTheme {
  static ThemeData themeData(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ThemeData(
      scaffoldBackgroundColor: Colors.white,

      textTheme: textTheme.copyWith(
        labelLarge: GoogleFonts.sora(
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: const Color(0xFF252849),
          ),
        ),
        labelMedium: GoogleFonts.sora(
          textStyle: textTheme.labelMedium?.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            color: const Color(0xFF252849),
          ),
        ),
        bodyLarge: GoogleFonts.sora(
          textStyle: textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: const Color(0xFF252849),
          ),
        ),
        bodyMedium: GoogleFonts.sora(
          textStyle: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: const Color(0xFF252849),
          ),
        ),
      ),
    );
  }
}