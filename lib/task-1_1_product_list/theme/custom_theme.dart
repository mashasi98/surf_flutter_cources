import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomAppTheme {
  static AppBarTheme customAppBarTheme(AppBarTheme base) {
    return base.copyWith(
      foregroundColor: Colors.white,
      backgroundColor: Colors.white,
    );
  }

  static TextTheme customTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: GoogleFonts.sora(
        textStyle: base.displayLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: const Color(0xFF252849),
        ),
      ),
      labelLarge: GoogleFonts.sora(
        textStyle: base.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: const Color(0xFF252849),
        ),
      ),
      labelMedium: GoogleFonts.sora(
        textStyle: base.labelMedium?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          color: const Color(0xFF252849),
        ),
      ),
      labelSmall: GoogleFonts.sora(
        textStyle: base.labelSmall?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 10,
          color: const Color(0xFF252849),
        ),
      ),
      bodyLarge: GoogleFonts.sora(
        textStyle: base.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: const Color(0xFF252849),
        ),
      ),
      bodyMedium: GoogleFonts.sora(
        textStyle: base.bodyMedium?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          color: const Color(0xFF252849),
        ),
      ),
    );
  }
}