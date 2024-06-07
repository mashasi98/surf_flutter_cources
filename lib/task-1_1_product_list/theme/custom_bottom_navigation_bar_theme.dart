import 'package:flutter/material.dart';

class CustomBottomNavigationBarTheme {
  static BottomNavigationBarThemeData customBottomNavigationBarTheme(
      BottomNavigationBarThemeData base) {
    return const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: Color(0xff60607b),
      elevation: 10,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      selectedIconTheme: IconThemeData(color: Colors.green),
      unselectedIconTheme: IconThemeData(color: Color(0xff60607b)),
    );
  }
}
