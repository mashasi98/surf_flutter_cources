// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/extension/app_color_scheme_x.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/theme/light_text_themes.dart';

abstract class AppThemeData {
  static final List<ThemeData> getLightThemes = [
    lightThemeSchemeGreen,
    lightThemeSchemeBlue,
    lightThemeSchemeOrange
  ];
  static final List<ThemeData> getDarkThemes = [
    darkThemeSchemeGreen,
    darkThemeSchemeBlue,
    darkThemeSchemeOrange
  ];

  static const _lightGreenScheme = AppColorSchemeX.lightGreen();
  static const _lightBlueScheme = AppColorSchemeX.lightBlue();
  static const _lightOrangeScheme = AppColorSchemeX.lightOrange();

  static const _darkGreenScheme = AppColorSchemeX.darkGreen();
  static const _darkBlueScheme = AppColorSchemeX.darkBlue();
  static const _darkOrangeScheme = AppColorSchemeX.darkOrange();

  static final ThemeData lightThemeSchemeGreen = ThemeData(
    extensions: const [_lightGreenScheme , ],

    brightness: Brightness.light,
    primaryColor: _lightGreenScheme.primary,
    colorScheme: ColorScheme(
      primary: _lightGreenScheme.primary,
      secondary: _lightGreenScheme.secondary,
      surface: _lightGreenScheme.surface,
      background: _lightGreenScheme.background,
      error: _lightGreenScheme.danger,
      onPrimary: _lightGreenScheme.onPrimary,
      onSecondary: _lightGreenScheme.onSecondary,
      onSurface: _lightGreenScheme.onSurface,
      onBackground: _lightGreenScheme.onBackground,
      onError: _lightGreenScheme.danger,
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor: _lightGreenScheme.background,
    appBarTheme: AppBarTheme(
      color: _lightGreenScheme.background,
      iconTheme: IconThemeData(color: _lightGreenScheme.primary),
      titleTextStyle: LightTextThemes.headlineLarge,
    ),

    textTheme: LightTextThemes.getLightTextTheme(),

    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    cardTheme: CardTheme(
      elevation: 0,
      color: _lightGreenScheme.surfaceSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    iconTheme: IconThemeData(color: _lightGreenScheme.primary),
    // floatingActionButtonTheme:  FloatingActionButtonThemeData(
    //   backgroundColor: color:_lightGreenScheme.primary,
    // ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: _lightGreenScheme.danger, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _lightGreenScheme.onDanger,
      ),
    ),
    bottomSheetTheme:  BottomSheetThemeData(
      backgroundColor: _lightGreenScheme.backgroundSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _lightGreenScheme.onSecondary,
        backgroundColor: _lightGreenScheme.secondary,
      ),
    ),
  );

  static final ThemeData lightThemeSchemeBlue = ThemeData(
    extensions: const [_lightBlueScheme],
    brightness: Brightness.light,
    primaryColor: _lightBlueScheme.primary,
    colorScheme: ColorScheme(
      primary: _lightBlueScheme.primary,
      secondary: _lightBlueScheme.secondary,
      surface: _lightBlueScheme.surface,
      background: _lightBlueScheme.background,
      error: _lightBlueScheme.danger,
      onPrimary: _lightBlueScheme.onPrimary,
      onSecondary: _lightBlueScheme.onSecondary,
      onSurface: _lightBlueScheme.onSurface,
      onBackground: _lightBlueScheme.onBackground,
      onError: _lightBlueScheme.danger,
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor: _lightBlueScheme.background,
    appBarTheme: AppBarTheme(
      color: _lightBlueScheme.background,
      iconTheme: IconThemeData(color: _lightBlueScheme.primary),
      titleTextStyle: LightTextThemes.headlineLarge,
    ),

    textTheme: LightTextThemes.getLightTextTheme(),

    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    cardTheme: CardTheme(
      elevation: 0,
      color: _lightBlueScheme.surfaceSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    iconTheme: IconThemeData(color: _lightBlueScheme.primary),
    // floatingActionButtonTheme:  FloatingActionButtonThemeData(
    //   backgroundColor: color:_lightGreenScheme.primary,
    // ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: _lightBlueScheme.danger, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _lightBlueScheme.onDanger,
      ),
    ),
    bottomSheetTheme:  BottomSheetThemeData(
      backgroundColor: _lightBlueScheme.backgroundSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _lightBlueScheme.onSecondary,
        backgroundColor: _lightBlueScheme.secondary,
      ),
    ),
  );

  static final ThemeData lightThemeSchemeOrange = ThemeData(
    extensions: const [_lightOrangeScheme],
    brightness: Brightness.light,
    primaryColor: _lightOrangeScheme.primary,
    colorScheme: ColorScheme(
      primary: _lightOrangeScheme.primary,
      secondary: _lightOrangeScheme.secondary,
      surface: _lightOrangeScheme.surface,
      background: _lightOrangeScheme.background,
      error: _lightOrangeScheme.danger,
      onPrimary: _lightOrangeScheme.onPrimary,
      onSecondary: _lightOrangeScheme.onSecondary,
      onSurface: _lightOrangeScheme.onSurface,
      onBackground: _lightOrangeScheme.onBackground,
      onError: _lightOrangeScheme.danger,
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor: _lightOrangeScheme.background,
    appBarTheme: AppBarTheme(
      color: _lightOrangeScheme.background,
      iconTheme: IconThemeData(color: _lightOrangeScheme.primary),
      titleTextStyle: LightTextThemes.headlineLarge,
    ),

    textTheme: LightTextThemes.getLightTextTheme(),

    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    cardTheme: CardTheme(
      elevation: 0,
      color: _lightOrangeScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    iconTheme: IconThemeData(color: _lightOrangeScheme.primary),
    // floatingActionButtonTheme:  FloatingActionButtonThemeData(
    //   backgroundColor: color:_lightGreenScheme.primary,
    // ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: _lightOrangeScheme.danger, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _lightOrangeScheme.onDanger,
      ),
    ),
    bottomSheetTheme:  BottomSheetThemeData(
      backgroundColor: _lightOrangeScheme.backgroundSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _lightOrangeScheme.onSecondary,
        backgroundColor: _lightOrangeScheme.secondary,
      ),
    ),
  );

  static final ThemeData darkThemeSchemeGreen = ThemeData(
    extensions: const [_darkGreenScheme],
    brightness: Brightness.dark,
    primaryColor: _darkGreenScheme.primary,
    colorScheme: ColorScheme(
      primary: _darkGreenScheme.primary,
      secondary: _darkGreenScheme.secondary,
      surface: _darkGreenScheme.surface,
      background: _darkGreenScheme.background,
      error: _darkGreenScheme.danger,
      onPrimary: _darkGreenScheme.onPrimary,
      onSecondary: _darkGreenScheme.onSecondary,
      onSurface: _darkGreenScheme.onSurface,
      onBackground: _darkGreenScheme.onBackground,
      onError: _darkGreenScheme.danger,
      brightness: Brightness.dark,
    ),

    scaffoldBackgroundColor: _darkGreenScheme.background,
    appBarTheme: AppBarTheme(
      color: _darkGreenScheme.background,
      iconTheme: IconThemeData(color: _darkGreenScheme.primary),
      titleTextStyle: LightTextThemes.headlineLarge,
    ),

    textTheme: LightTextThemes.getLightTextTheme(),

    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    cardTheme: CardTheme(
      elevation: 0,
      color: _darkGreenScheme.surfaceSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    iconTheme: IconThemeData(color: _darkGreenScheme.primary),
    // floatingActionButtonTheme:  FloatingActionButtonThemeData(
    //   backgroundColor: color:_lightGreenScheme.primary,
    // ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: _darkGreenScheme.danger, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _darkGreenScheme.onDanger,
      ),
    ),
    bottomSheetTheme:  BottomSheetThemeData(
      backgroundColor: _darkGreenScheme.backgroundSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _darkGreenScheme.onSecondary,
        backgroundColor: _darkGreenScheme.secondary,
      ),
    ),
  );

  static final ThemeData darkThemeSchemeBlue = ThemeData(
    extensions: const [_darkBlueScheme],
    brightness: Brightness.dark,
    primaryColor: _darkBlueScheme.primary,
    colorScheme: ColorScheme(
      primary: _darkBlueScheme.primary,
      secondary: _darkBlueScheme.secondary,
      surface: _darkBlueScheme.surface,
      background: _darkBlueScheme.background,
      error: _darkBlueScheme.danger,
      onPrimary: _darkBlueScheme.onPrimary,
      onSecondary: _darkBlueScheme.onSecondary,
      onSurface: _darkBlueScheme.onSurface,
      onBackground: _darkBlueScheme.onBackground,
      onError: _darkBlueScheme.danger,
      brightness: Brightness.dark,
    ),

    scaffoldBackgroundColor: _darkBlueScheme.background,
    appBarTheme: AppBarTheme(
      color: _darkBlueScheme.background,
      iconTheme: IconThemeData(color: _darkBlueScheme.primary),
      titleTextStyle: LightTextThemes.headlineLarge,
    ),

    textTheme: LightTextThemes.getLightTextTheme(),

    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    cardTheme: CardTheme(
      elevation: 0,
      color: _darkBlueScheme.surfaceSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    iconTheme: IconThemeData(color: _darkBlueScheme.primary),
    // floatingActionButtonTheme:  FloatingActionButtonThemeData(
    //   backgroundColor: color:_lightGreenScheme.primary,
    // ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: _darkBlueScheme.danger, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _darkBlueScheme.onDanger,
      ),
    ),
    bottomSheetTheme:  BottomSheetThemeData(
      backgroundColor: _darkBlueScheme.backgroundSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _darkBlueScheme.onSecondary,
        backgroundColor: _darkBlueScheme.secondary,
      ),
    ),
  );
  static final ThemeData darkThemeSchemeOrange = ThemeData(
    extensions: const [_darkOrangeScheme],
    brightness: Brightness.dark,
    primaryColor: _darkOrangeScheme.primary,
    colorScheme: ColorScheme(
      primary: _darkOrangeScheme.primary,
      secondary: _darkOrangeScheme.secondary,
      surface: _darkOrangeScheme.surface,
      background: _darkOrangeScheme.background,
      error: _darkOrangeScheme.danger,
      onPrimary: _darkOrangeScheme.onPrimary,
      onSecondary: _darkOrangeScheme.onSecondary,
      onSurface: _darkOrangeScheme.onSurface,
      onBackground: _darkOrangeScheme.onBackground,
      onError: _darkOrangeScheme.danger,
      brightness: Brightness.dark,
    ),

    scaffoldBackgroundColor: _darkOrangeScheme.background,
    appBarTheme: AppBarTheme(
      color: _darkOrangeScheme.background,
      iconTheme: IconThemeData(color: _darkOrangeScheme.primary),
      titleTextStyle: LightTextThemes.headlineLarge,
    ),

    textTheme: LightTextThemes.getLightTextTheme(),

    buttonTheme: ButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    cardTheme: CardTheme(
      elevation: 0,
      color: _darkOrangeScheme.surfaceSecondary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
    ),

    iconTheme: IconThemeData(color: _darkOrangeScheme.primary),
    // floatingActionButtonTheme:  FloatingActionButtonThemeData(
    //   backgroundColor: color:_lightGreenScheme.primary,
    // ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: _darkOrangeScheme.danger, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _darkOrangeScheme.onDanger,
      ),
    ),
    bottomSheetTheme:  BottomSheetThemeData(
      backgroundColor: _darkOrangeScheme.backgroundSecondary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        foregroundColor: _darkOrangeScheme.onSecondary,
        backgroundColor: _darkOrangeScheme.secondary,
      ),
    ),
  );

}
