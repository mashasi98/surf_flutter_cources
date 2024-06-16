import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/theme/custom_app_bar_theme.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/theme/custom_theme.dart';

import 'custom_bottom_navigation_bar_theme.dart';

class AppTheme {
  static ThemeData get theme {
    final base = ThemeData.light();
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      textTheme: CustomAppTheme.customTextTheme(base.textTheme),
      appBarTheme: CustomAppBarTheme.customAppBarTheme(base.appBarTheme),
      bottomNavigationBarTheme:
          CustomBottomNavigationBarTheme.customBottomNavigationBarTheme(
              base.bottomNavigationBarTheme),
    );
  }
}
