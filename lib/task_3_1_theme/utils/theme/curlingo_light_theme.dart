import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/const/app_colors.dart';

ThemeData greenAccentTheme() => ThemeData.light().copyWith(
  primaryColor: LightThemeColors.primaryGreenColor,
  scaffoldBackgroundColor: LightThemeColors.scaffoldGreenColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: LightThemeColors.appBarBackgroundGreenColor,
    titleTextStyle: TextStyle(color: LightThemeColors.appBarTitleColor),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: LightThemeColors.primaryGreenColor,
    secondary: LightThemeColors.secondaryGreenColor,
    background: LightThemeColors.scaffoldGreenColor,
    surface: LightThemeColors.listViewBackgroundGreenColor,
    onPrimary: LightThemeColors.primaryTextGreenColor,
    onSecondary: LightThemeColors.secondaryTextGreenColor,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all<Color>(LightThemeColors.iconGreenColor),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: LightThemeColors.primaryGreenColor,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightThemeColors.secondaryGreenColor,
      foregroundColor: LightThemeColors.bottomSheetButtonText,
      textStyle: const TextStyle(),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: const BorderSide(
        color: LightThemeColors.logout,
        width: 1.0,
      ),
    ),
  ),
);

// ThemeData greenAccentTheme() => ThemeData(
//       brightness: Brightness.light,
//       primaryColor: LightThemeColors.primaryGreenColor,
//       appBarTheme: AppBarTheme(
//         backgroundColor: LightThemeColors.appBarBackgroundGreenColor,
//         titleTextStyle: CurlingoTextTheme.displayMedium()
//             .copyWith(color: LightThemeColors.appBarTitleColor),
//         iconTheme: const IconThemeData(
//           color: LightThemeColors.iconGreenColor,
//           size: 24.0,
//         ),
//       ),
//       scaffoldBackgroundColor: LightThemeColors.scaffoldGreenColor,
//       textButtonTheme: TextButtonThemeData(
//         style: TextButton.styleFrom(
//           foregroundColor: LightThemeColors.primaryGreenColor,
//         ),
//       ),
//     );

ThemeData blueAccentTheme() => ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF22F60A),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF22F60A),
        // titleTextStyle: curlingoTextTheme().titleMedium,
      ),
      // textTheme: curlingoTextTheme(),
    );

ThemeData orangeAccentTheme() => ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF22F60A),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF22F60A),
        // titleTextStyle: curlingoTextTheme().titleMedium,
      ),
      // textTheme: curlingoTextTheme(),
    );
