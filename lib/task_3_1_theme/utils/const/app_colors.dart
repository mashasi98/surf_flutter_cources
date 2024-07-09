import 'dart:ui';

class AppColors extends Color {
  AppColors(super.value);

  static const  Color blackTextColor =  Color(0xFF242439);
  static const  Color whiteTextColor =  Color(0xFFFFFFFF);
  static const Color logoutButtonColor = Color (0xFFFF392A);

//1-  Green  theme colors
  static const Color primaryGreenThemeColor = Color(0xFF6DD902);
  static const Color secondaryGreenThemeColor = Color(0xFF5114FF);
  static const Color secondaryGreenThemeTextColor = Color(0xFF77767B);
  //light
  static const Color backgroundGreenLightThemeColor = Color(0xFFFFFFFF);
  static const Color cardGreenLightThemeColor = Color(0xFFF6F6F6);
  static const Color bottomSheetLightGreenBackgroundColor = Color(0xFFFFFFFF);
  //dark
  static const Color backgroundGreenDarkThemeColor = Color(0xFF000000);
  static const Color cardGreenDarkThemeColor = Color(0xFF222222);
  static const Color bottomSheetDarkGreenBackgroundColor = Color(0xFF222222);

//2-  Blue  theme colors
  static const Color primaryBlueColor = Color(0xFF5261EB);
  static const Color secondaryBlueColor = Color(0xFF7B8EBE);
  static const Color secondaryBlueThemeTextColor = Color(0xFFA0AECF);

  static const Color backgroundBlueLightThemeColor = Color(0xFFF2F5FA);
  static const Color cardBlueLightThemeColor = Color(0xFFFFFFFF);
  static const Color bottomSheetLightBlueBackgroundColor = Color(0xFFF3F6FB);
  //dark
  static const Color backgroundBlueDarkThemeColor = Color(0xFF242439);
  static const Color cardBlueDarkThemeColor = Color(0xFF384057);
  static const Color bottomSheetDarkBlueBackgroundColor = Color(0xFF383F56);

//3- Orange light theme colors
  static const Color primaryOrangeColor = Color(0xFFFF7A00);
  static const Color secondaryOrangeColor = Color(0xFFBE937B);
  static const Color secondaryOrangeThemeTextColor = Color(0xFFBE937B);

// TODO : тудуду вопрос : стоит ли в случае с цветом Color(0xFFBE937B) делать отдельные константы.

  static const Color backgroundOrangeLightThemeColor = Color(0xFFFAF6F2);
  static const Color cardOrangeLightThemeColor = Color(0xFFFDFDFD);
  //dark
  static const Color backgroundOrangeDarkThemeColor = Color(0xFF262020);
  static const Color cardOrangeDarkThemeColor = Color(0xFF3B322F);
}
