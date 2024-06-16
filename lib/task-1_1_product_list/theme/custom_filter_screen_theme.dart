import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomFilterScreenTheme {
  static TextTheme customFilterScreenTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: GoogleFonts.sora(
        textStyle: base.displayLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: const Color(0xFF252849),
        ),
      ),
      bodySmall: GoogleFonts.sora(
        textStyle: base.headlineSmall?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 12,
          color: const Color(0xFF252849),
        ),
      ),
        bodyMedium :GoogleFonts.sora(
          textStyle: base.headlineSmall?.copyWith(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            color: const Color(0xFF252849),
          ),
        ),
    );
  }
}