import 'package:flutter/material.dart';

class CurlingoTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    hintColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
      titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.black),
      titleMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black),
      bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.black),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    hintColor: Colors.green,
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
      titleLarge: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
      bodyMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400, color: Colors.white),
      titleMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
      bodySmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static final Map<String, ThemeData> lightColorSchemes = {
    'Scheme1': lightTheme.copyWith(
      hintColor: Colors.green,
      buttonTheme: lightTheme.buttonTheme.copyWith(buttonColor: Colors.green),
    ),
    'Scheme2': lightTheme.copyWith(
      hintColor: Colors.blue,
      buttonTheme: lightTheme.buttonTheme.copyWith(buttonColor: Colors.blue),
    ),
    'Scheme3': lightTheme.copyWith(
      hintColor: Colors.orange,
      buttonTheme: lightTheme.buttonTheme.copyWith(buttonColor: Colors.orange),
    ),
  };

  static final Map<String, ThemeData> darkColorSchemes = {
    'Scheme1': darkTheme.copyWith(
      hintColor: Colors.green,
      buttonTheme: darkTheme.buttonTheme.copyWith(buttonColor: Colors.green),
    ),
    'Scheme2': darkTheme.copyWith(
      hintColor: Colors.blue,
      buttonTheme: darkTheme.buttonTheme.copyWith(buttonColor: Colors.blue),
    ),
    'Scheme3': darkTheme.copyWith(
      hintColor: Colors.orange,
      buttonTheme: darkTheme.buttonTheme.copyWith(buttonColor: Colors.orange),
    ),
  };

  static ThemeData getLightTheme(String scheme) {
    return lightColorSchemes[scheme] ?? lightTheme;
  }

  static ThemeData getDarkTheme(String scheme) {
    return darkColorSchemes[scheme] ?? darkTheme;
  }
}
