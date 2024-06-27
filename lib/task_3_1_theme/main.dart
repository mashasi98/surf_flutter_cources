import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/entity/theme_mode.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/state/theme_settings_state.dart';
import 'package:surf_flutter_cources/task_3_1_theme/presentation/screen/profile_screen.dart';
import 'package:surf_flutter_cources/task_3_1_theme/presentation/widgets/theme_settings_provider.dart';
import 'package:surf_flutter_cources/task_3_1_theme/presentation/widgets/user_provider.dart';

import '../generated/assets.dart';
import 'domain/entity/theme_settings.dart';
import 'domain/entity/user_entity.dart';
import 'domain/state/user_state.dart';

void main() {
  final userState = UserState(
    UserEntity(
        id: 123345,
        name: 'Маркус',
        secondName: 'Хассельборг',
        email: 'MarkusHSS@gmail.com',
        teamName: 'Сборная Швеции',
        position: 'Скип',
        achievements: [
          Assets.achievement1,
          Assets.achievement1,
          Assets.achievement3,
          Assets.achievement2,
          Assets.achievement3
        ],
        photo: Assets.profileProfilePh,
        birthDay: '03.03.1986'),
  );
  final themeSettings = ThemeSettingsState(
    ThemeSettings(themeMode: CustomThemeMode.system),
  );

  runApp(
    MyCurlingoApp(
      userState: userState,
      themeSettingsState: themeSettings,
    ),
  );
}

class MyCurlingoApp extends StatelessWidget {
  final UserState userState;
  final ThemeSettingsState themeSettingsState;

  const MyCurlingoApp(
      {super.key, required this.userState, required this.themeSettingsState});

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      userState: userState,
      child: ThemeSettingsProvider(
        themeSettingsState: themeSettingsState,
        child: MaterialApp(
          theme: ThemeData(
            brightness: _setBrightness(themeSettingsState),

            useMaterial3: true,
          ),
          home: const ProfileScreen(),
        ),
      ),
    );
  }

  Brightness _setBrightness(ThemeSettingsState themeSettingsState) {
    return themeSettingsState.themeSettings.themeMode
  }
}
