import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/state/theme_settings_state.dart';

class ThemeSettingsProvider extends InheritedNotifier<ThemeSettingsState> {
  const ThemeSettingsProvider({
    super.key,
    required ThemeSettingsState themeSettingsState,
    required super.child,
  }) : super(notifier: themeSettingsState);

  static ThemeSettingsState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSettingsProvider>()?.notifier;
  }
}
