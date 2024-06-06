import 'package:flutter/material.dart';

class CustomTextTheme {
  static TextTheme customTextTheme(TextTheme base) {
    return base.copyWith(
      bodyLarge: base.bodyLarge?.copyWith(
        fontSize: 16.0,
        color: Colors.black,
      ),

      headlineLarge: base.headlineLarge?.copyWith(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
    );
  }

}
