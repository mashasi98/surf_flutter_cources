import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBottomNavigationBarTheme {
  static BottomNavigationBarThemeData customBottomNavigationBarTheme(
      BottomNavigationBarThemeData base) {
    return BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: const Color(0xff60607b),
      elevation: 10,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: GoogleFonts.sora(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Colors.green,
        ),
      ),
      unselectedLabelStyle: GoogleFonts.sora(
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Color(0xff60607b),
        ),
      ),
      selectedIconTheme: const IconThemeData(color: Colors.green),
      unselectedIconTheme: const IconThemeData(color: Color(0xff60607b)),
    );
  }
}
