import 'package:flutter/material.dart';

class CustomAppBarTheme {
  static AppBarTheme customAppBarTheme(AppBarTheme base) {
    return base.copyWith(
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.white ,
      elevation: 0,
    );
  }
}