import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/const/app_colors.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/theme/dark_text_themes.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/theme/light_text_themes.dart';

mixin AppTheme {
  static final List<ThemeData> lightThemes = [
    lightThemeSchemeGreen,
    lightThemeSchemeBlue,
    lightThemeSchemeOrange
  ];
  static final List<ThemeData> darkThemes = [
    darkThemeSchemeGreen,
    darkThemeSchemeBlue,
    darkThemeSchemeOrange
  ];
}

final ThemeData lightThemeSchemeGreen = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryGreenThemeColor,
  secondaryHeaderColor: AppColors.secondaryGreenThemeTextColor,
  scaffoldBackgroundColor: AppColors.backgroundGreenLightThemeColor,
  textTheme: LightTextThemes.getLightTextTheme(),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    color: AppColors.cardGreenLightThemeColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.backgroundGreenLightThemeColor,
    iconTheme: IconThemeData(color: AppColors.primaryGreenThemeColor),
    titleTextStyle: LightTextThemes.headlineLarge,
  ),
  iconTheme: const IconThemeData(color: AppColors.primaryGreenThemeColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryGreenThemeColor,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.logoutButtonColor, width: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.logoutButtonColor,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.bottomSheetLightGreenBackgroundColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.whiteTextColor,
      backgroundColor: AppColors.secondaryGreenThemeColor,
    ),
  ),
);

final ThemeData lightThemeSchemeBlue = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryBlueColor,
  secondaryHeaderColor: AppColors.secondaryBlueThemeTextColor,
  scaffoldBackgroundColor: AppColors.backgroundBlueLightThemeColor,
  textTheme: LightTextThemes.getLightTextTheme(),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    color: AppColors.cardBlueLightThemeColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.backgroundBlueLightThemeColor,
    iconTheme: IconThemeData(color: AppColors.primaryBlueColor),
    titleTextStyle: LightTextThemes.headlineLarge,
  ),
  iconTheme: const IconThemeData(color: AppColors.primaryBlueColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryBlueColor,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.logoutButtonColor, width: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.logoutButtonColor,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.backgroundBlueLightThemeColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.whiteTextColor,
      backgroundColor: AppColors.primaryBlueColor,
    ),
  ),
);

final ThemeData lightThemeSchemeOrange = ThemeData(
  brightness: Brightness.light,
  primaryColor: AppColors.primaryOrangeColor,
  secondaryHeaderColor: AppColors.secondaryOrangeThemeTextColor,
  scaffoldBackgroundColor: AppColors.backgroundOrangeLightThemeColor,
  textTheme: LightTextThemes.getLightTextTheme(),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    color: AppColors.cardOrangeLightThemeColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.backgroundOrangeLightThemeColor,
    iconTheme: IconThemeData(color: AppColors.primaryOrangeColor),
    titleTextStyle: LightTextThemes.headlineLarge,
  ),
  iconTheme: const IconThemeData(color: AppColors.primaryOrangeColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryOrangeColor,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.logoutButtonColor, width: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.logoutButtonColor,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.backgroundOrangeLightThemeColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.whiteTextColor,
      backgroundColor: AppColors.primaryOrangeColor,
    ),
  ),
);

final ThemeData darkThemeSchemeGreen = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryGreenThemeColor,
  secondaryHeaderColor: AppColors.secondaryGreenThemeTextColor,
  scaffoldBackgroundColor: AppColors.backgroundGreenDarkThemeColor,
  textTheme: DarkTextThemes.getDarkTextTheme(),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    color: AppColors.cardGreenDarkThemeColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.backgroundGreenDarkThemeColor,
    iconTheme: IconThemeData(color: AppColors.primaryGreenThemeColor),
    titleTextStyle: DarkTextThemes.headlineLarge,
  ),
  iconTheme: const IconThemeData(color: AppColors.primaryGreenThemeColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryGreenThemeColor,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.logoutButtonColor, width: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.logoutButtonColor,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.cardGreenDarkThemeColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.whiteTextColor,
      backgroundColor: AppColors.secondaryGreenThemeColor,
    ),
  ),
);

final ThemeData darkThemeSchemeBlue = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryBlueColor,
  secondaryHeaderColor: AppColors.secondaryBlueThemeTextColor,
  scaffoldBackgroundColor: AppColors.backgroundBlueDarkThemeColor,
  textTheme: DarkTextThemes.getDarkTextTheme(),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    color: AppColors.cardBlueDarkThemeColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.backgroundBlueDarkThemeColor,
    iconTheme: IconThemeData(color: AppColors.primaryBlueColor),
    titleTextStyle: DarkTextThemes.headlineLarge,
  ),
  iconTheme: const IconThemeData(color: AppColors.primaryBlueColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryBlueColor,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.logoutButtonColor, width: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.logoutButtonColor,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.bottomSheetDarkBlueBackgroundColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.whiteTextColor,
      backgroundColor: AppColors.primaryBlueColor,
    ),
  ),
);

final ThemeData darkThemeSchemeOrange = ThemeData(
  brightness: Brightness.dark,
  primaryColor: AppColors.primaryOrangeColor,
  secondaryHeaderColor: AppColors.secondaryOrangeThemeTextColor,
  scaffoldBackgroundColor: AppColors.backgroundOrangeDarkThemeColor,
  textTheme: DarkTextThemes.getDarkTextTheme(),
  buttonTheme: ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  cardTheme: CardTheme(
    elevation: 0,
    color: AppColors.cardOrangeDarkThemeColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  ),
  appBarTheme: const AppBarTheme(
    color: AppColors.backgroundOrangeDarkThemeColor,
    iconTheme: IconThemeData(color: AppColors.primaryOrangeColor),
    titleTextStyle: DarkTextThemes.headlineLarge,
  ),
  iconTheme: const IconThemeData(color: AppColors.primaryOrangeColor),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: AppColors.primaryOrangeColor,
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(color: AppColors.logoutButtonColor, width: 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.logoutButtonColor,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: AppColors.cardOrangeDarkThemeColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      foregroundColor: AppColors.whiteTextColor,
      backgroundColor: AppColors.primaryOrangeColor,
    ),
  ),
);
