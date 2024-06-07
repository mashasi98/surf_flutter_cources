import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextTheme {
  static TextTheme customTextTheme(TextTheme base) {
    return base.copyWith(
      labelSmall: GoogleFonts.sora(
        textStyle: base.labelSmall?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 10.0,
          color: const Color(0xFF60607B),
        ),
      ) ,
      displayLarge: GoogleFonts.sora(
        textStyle: base.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
          color: const Color(0xFF252849),
        ),
      ) ,
      bodyMedium:  GoogleFonts.sora(
        textStyle: base.bodyLarge?.copyWith(
          fontSize: 12.0,
          color: const Color(0xFF252849),
        ),
      ),
      headlineLarge: GoogleFonts.sora(
        textStyle: base.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
          color: const Color(0xFF252849),
        ),
      ) ,
    );
  }
}
