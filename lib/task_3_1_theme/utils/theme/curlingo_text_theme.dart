import 'package:flutter/material.dart';

class CurlingoTextTheme extends TextTheme{

  TextTheme curlingoTextTheme() {
    return const TextTheme(
      displayLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        height: 1.78,
      ),
      displayMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        height: 1.33,
      ),
      displaySmall: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        height: 1.0,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        height: 1.43,
      ),
      bodyLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
      bodySmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        height: 0.75,
      ),
      titleMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        height: 1.43,
      ),
      labelMedium: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        height: 1.14,
      ),
      labelLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
    );
  }

}
