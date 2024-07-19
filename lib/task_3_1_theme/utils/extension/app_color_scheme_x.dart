import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/colors/app_colors.dart';

@immutable
class AppColorSchemeX extends ThemeExtension<AppColorSchemeX> {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color onSecondary;
  final Color surface;
  final Color surfaceSecondary;
  final Color onSurface;
  final Color onSurfaceDisabled;
  final Color background;
  final Color onBackground;
  final Color backgroundSecondary;
  final Color onBackgroundSecondary;
  final Color onBackgroundSecondaryLabel;
  final Color textField;
  final Color textFieldLabel;
  final Color frameTextFieldSecondary;
  final Color danger;
  final Color onDanger;

  const AppColorSchemeX.lightGreen()
      : primary = AppColors.alienArmpit,
        onPrimary = AppColors.raisinBlack,
        // акцентные кнопки
        secondary = AppColors.hanPurple,
        onSecondary = AppColors.white,
        //текстовые поля
        surface = AppColors.aliceBlue,
        //Карточки схем
        surfaceSecondary = AppColors.culturedCard,
        // текст в карточках схем
        onSurface = AppColors.black,
        // текст в карточках схем неактивных
        onSurfaceDisabled = AppColors.sonicSilver,
        //фон
        background = AppColors.white,
        //текст на фоне
        onBackground = AppColors.charlestonGreen,
        //боттом щит
        backgroundSecondary = AppColors.lotion,
        //текст боттом щит
        onBackgroundSecondary = AppColors.raisinBlack,
        onBackgroundSecondaryLabel = AppColors.sonicSilver,
        // основной текст в картоках полей
        textField = AppColors.raisinBlack,
        // цвет лейблов в карточках полей
        textFieldLabel = AppColors.charlestonGreen,
        //рамки выделения
        frameTextFieldSecondary = AppColors.alienArmpit,
        // цвет  кнопки  выхода
        danger = AppColors.coralRed,
        onDanger = AppColors.coralRed;

  const AppColorSchemeX.darkGreen()
      : primary = AppColors.alienArmpit,
        onPrimary = AppColors.white,
        // акцентные кнопки
        secondary = AppColors.hanPurple,
        onSecondary = AppColors.white,
        //текстовые поля
        surface = AppColors.raisinBlack,
        //Карточки схем
        surfaceSecondary = AppColors.charlestonGreen,
        // текст в карточках схем
        onSurface = AppColors.white,
        // текст в карточках схем неактивных
        onSurfaceDisabled = AppColors.sonicSilver,
        //фон
        background = AppColors.black,
        //текст на фоне
        onBackground = AppColors.sonicSilver,
        //боттом щит
        backgroundSecondary = AppColors.raisinBlack,
        //текст боттом щит
        onBackgroundSecondary = AppColors.white,
        onBackgroundSecondaryLabel = AppColors.sonicSilver,
        // основной текст в картоках полей
        textField = AppColors.white,
        // цвет лейблов в карточках полей
        textFieldLabel = AppColors.sonicSilver,
        //рамки выделения
        frameTextFieldSecondary = AppColors.alienArmpit,
        // цвет  кнопки  выхода
        danger = AppColors.coralRed,
        onDanger = AppColors.coralRed;

  const AppColorSchemeX.lightBlue()
      : primary = AppColors.ultramarineBlue,
        onPrimary = AppColors.raisinBlack,
        // акцентные кнопки
        secondary = AppColors.royalBlue,
        onSecondary = AppColors.white,
        //текстовые поля
        surface = AppColors.aliceBlue,
        //Карточки схем
        surfaceSecondary = AppColors.culturedCard,
        // текст в карточках схем
        onSurface = AppColors.black,
        // текст в карточках схем неактивных
        onSurfaceDisabled = AppColors.ceruleanFrost,
        //фон
        background = AppColors.cultured,
        //текст на фоне
        onBackground = AppColors.ceruleanFrost,
        //боттом щит
        backgroundSecondary = AppColors.lotion,
        //текст боттом щит
        onBackgroundSecondary = AppColors.black,
        onBackgroundSecondaryLabel = AppColors.ceruleanFrost,
        // основной текст в картоках полей
        textField = AppColors.raisinBlack,
        // цвет лейблов в карточках полей
        textFieldLabel = AppColors.ceruleanFrost,
        //рамки выделения
        frameTextFieldSecondary = AppColors.ultramarineBlue,
        // цвет  кнопки  выхода
        danger = AppColors.coralRed,
        onDanger = AppColors.coralRed;

  const AppColorSchemeX.darkBlue()
      : primary = AppColors.ultramarineBlue,
        onPrimary = AppColors.white,
        // акцентные кнопки
        secondary = AppColors.royalBlue,
        onSecondary = AppColors.white,
        //текстовые поля
        surface = AppColors.independence,
        //Карточки схем
        surfaceSecondary = AppColors.independence,
        // текст в карточках схем
        onSurface = AppColors.white,
        // текст в карточках схем неактивных
        onSurfaceDisabled = AppColors.ceruleanFrost,
        //фон
        background = AppColors.yankeesBlue,
        //текст на фоне
        onBackground = AppColors.ceruleanFrost,
        //боттом щит
        backgroundSecondary = AppColors.charcoal,
        //текст боттом щит
        onBackgroundSecondary = AppColors.white,
        onBackgroundSecondaryLabel = AppColors.ceruleanFrost,
        // основной текст в картоках полей
        textField = AppColors.white,
        // цвет лейблов в карточках полей
        textFieldLabel = AppColors.ceruleanFrost,
        //рамки выделения
        frameTextFieldSecondary = AppColors.ultramarineBlue,
        // цвет  кнопки  выхода
        danger = AppColors.coralRed,
        onDanger = AppColors.coralRed;

  const AppColorSchemeX.lightOrange()
      : primary = AppColors.beer,
        onPrimary = AppColors.raisinBlack,
        // акцентные кнопки
        secondary = AppColors.heatWave,
        onSecondary = AppColors.white,
        //текстовые поля
        surface = AppColors.white,
        //Карточки схем
        surfaceSecondary = AppColors.culturedCardOrange,
        // текст в карточках схем
        onSurface = AppColors.black,
        // текст в карточках схем неактивных
        onSurfaceDisabled = AppColors.paleTaupe,
        //фон
        background = AppColors.orangeBg,
        //текст на фоне
        onBackground = AppColors.paleTaupe,
        //боттом щит
        backgroundSecondary = AppColors.white,
        //текст боттом щит
        onBackgroundSecondary = AppColors.black,
        onBackgroundSecondaryLabel = AppColors.paleTaupe,
        // основной текст в картоках полей
        textField = AppColors.raisinBlack,
        // цвет лейблов в карточках полей
        textFieldLabel = AppColors.paleTaupe,
        //рамки выделения
        frameTextFieldSecondary = AppColors.beer,
        // цвет  кнопки  выхода
        danger = AppColors.coralRed,
        onDanger = AppColors.coralRed;

  const AppColorSchemeX.darkOrange()
      : primary = AppColors.beer,
        onPrimary = AppColors.white,
        // акцентные кнопки
        secondary = AppColors.heatWave,
        onSecondary = AppColors.white,
        //текстовые поля
        surface = AppColors.blackCoffee,
        //Карточки схем
        surfaceSecondary = AppColors.darkPuce,
        // текст в карточках схем
        onSurface = AppColors.white,
        // текст в карточках схем неактивных
        onSurfaceDisabled = AppColors.paleTaupe,
        //фон
        background = AppColors.raisinBlackBrown,
        //текст на фоне
        onBackground = AppColors.paleTaupe,
        //боттом щит
        backgroundSecondary = AppColors.blackCoffee,
        //текст боттом щит
        onBackgroundSecondary = AppColors.white,
        onBackgroundSecondaryLabel = AppColors.paleTaupe,
        // основной текст в картоках полей
        textField = AppColors.white,
        // цвет лейблов в карточках полей
        textFieldLabel = AppColors.paleTaupe,
        //рамки выделения
        frameTextFieldSecondary = AppColors.beer,
        // цвет  кнопки  выхода
        danger = AppColors.coralRed,
        onDanger = AppColors.coralRed;

  const AppColorSchemeX._({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.onSecondary,
    required this.surface,
    required this.surfaceSecondary,
    required this.onSurface,
    required this.background,
    required this.onBackground,
    required this.onBackgroundSecondary,
    required this.onBackgroundSecondaryLabel,
    required this.textField,
    required this.textFieldLabel,
    required this.frameTextFieldSecondary,
    required this.danger,
    required this.onDanger,
    required this.backgroundSecondary,
    required this.onSurfaceDisabled,
  });

  @override
  ThemeExtension<AppColorSchemeX> copyWith(
      {Color? primary,
      Color? onPrimary,
      Color? secondary,
      Color? onSecondary,
      Color? surface,
      Color? surfaceSecondary,
      Color? onSurface,
      Color? background,
      Color? backgroundSecondary,
      Color? onBackground,
      Color? onBackgroundSecondary,
      Color? onBackgroundSecondaryLabel,
      Color? textField,
      Color? textFieldLabel,
      Color? frameTextFieldSecondary,
      Color? danger,
      Color? onDanger,
      Color? onSurfaceDisabled}) {
    return AppColorSchemeX._(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      onSecondary: onSecondary ?? this.onSecondary,
      surface: surface ?? this.surface,
      surfaceSecondary: surfaceSecondary ?? this.surfaceSecondary,
      onSurface: onSurface ?? this.onSurface,
      background: background ?? this.background,
      onBackground: onBackground ?? this.onBackground,
      onBackgroundSecondary:
          onBackgroundSecondary ?? this.onBackgroundSecondary,
      onBackgroundSecondaryLabel:
          onBackgroundSecondaryLabel ?? this.onBackgroundSecondaryLabel,
      textField: textField ?? this.textField,
      textFieldLabel: textFieldLabel ?? this.textFieldLabel,
      frameTextFieldSecondary:
          frameTextFieldSecondary ?? this.frameTextFieldSecondary,
      danger: danger ?? this.danger,
      onDanger: onDanger ?? this.onDanger,
      backgroundSecondary: background ?? this.backgroundSecondary,
      onSurfaceDisabled: onSurfaceDisabled ?? this.onSurfaceDisabled,
    );
  }

  @override
  ThemeExtension<AppColorSchemeX> lerp(
    ThemeExtension<AppColorSchemeX>? other,
    double t,
  ) {
    if (other is! AppColorSchemeX) {
      return this;
    }

    return AppColorSchemeX._(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      onSecondary: Color.lerp(onSecondary, other.onSecondary, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surfaceSecondary:
          Color.lerp(surfaceSecondary, other.surfaceSecondary, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
      background: Color.lerp(background, other.background, t)!,
      onBackground: Color.lerp(onBackground, other.onBackground, t)!,
      onBackgroundSecondary:
          Color.lerp(onBackgroundSecondary, other.onBackgroundSecondary, t)!,
      onBackgroundSecondaryLabel: Color.lerp(
          onBackgroundSecondaryLabel, other.onBackgroundSecondaryLabel, t)!,
      textField: Color.lerp(textField, other.textField, t)!,
      textFieldLabel: Color.lerp(textFieldLabel, other.textFieldLabel, t)!,
      frameTextFieldSecondary: Color.lerp(
          frameTextFieldSecondary, other.frameTextFieldSecondary, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      onDanger: Color.lerp(onDanger, other.onDanger, t)!,
      backgroundSecondary:
          Color.lerp(backgroundSecondary, other.backgroundSecondary, t)!,
      onSurfaceDisabled:
          Color.lerp(onSurfaceDisabled, other.onSurfaceDisabled, t)!,
    );
  }

  /// Returns [AppColorSchemeX] from [context].
  static AppColorSchemeX of(BuildContext context) =>
      Theme.of(context).extension<AppColorSchemeX>()!;
}
