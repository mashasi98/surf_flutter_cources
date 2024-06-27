import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/state/theme_settings_state.dart';

class ThemeSettingsProvider extends InheritedNotifier<ThemeSettingsState> {
  final ThemeSettingsState themeSettingsState;

  const ThemeSettingsProvider({
    super.key,
    required this.themeSettingsState,
    required super.child,
  }) : super(notifier: themeSettingsState);

  static ThemeSettingsProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeSettingsProvider>()!;
  }
}