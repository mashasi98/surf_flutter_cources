import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/generated/assets.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/entity/user_entity.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/state/theme_settings_state.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/state/user_state.dart';
import 'package:surf_flutter_cources/task_3_1_theme/presentation/screen/profile_screen.dart';
import 'package:surf_flutter_cources/task_3_1_theme/presentation/widgets/theme_settings_provider.dart';
import 'package:surf_flutter_cources/task_3_1_theme/presentation/widgets/user_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      birthDay: '03.03.1986',
    ),
  );

  runApp(
    MyCurlingoApp(
      userState: userState,
    ),
  );
}

class MyCurlingoApp extends StatefulWidget {
  final UserState userState;

  const MyCurlingoApp({
    super.key,
    required this.userState,
  });

  @override
  MyCurlingoAppState createState() => MyCurlingoAppState();
}

class MyCurlingoAppState extends State<MyCurlingoApp> with TickerProviderStateMixin {
  late ThemeSettingsState _themeSettingsState;
  late AnimationController _controller;
  late Animation<ThemeData> _themeAnimation;

  @override
  void initState() {
    super.initState();
    _themeSettingsState = ThemeSettingsState(this);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _themeAnimation = ThemeDataTween(
      begin: _themeSettingsState.currentThemeData,
      end: _themeSettingsState.currentThemeData,
    ).animate(_controller);

    _themeSettingsState.addListener(_onThemeChanged);
    _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    _themeSettingsState.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    setState(() {
      _themeAnimation = ThemeDataTween(
        begin: _themeAnimation.value,
        end: _themeSettingsState.currentThemeData,
      ).animate(_controller);

      _controller.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return UserProvider(
      userState: widget.userState,
      child: ThemeSettingsProvider(
        themeSettingsState: _themeSettingsState,
        child: AnimatedBuilder(
          animation: _themeAnimation,
          builder: (context, _) {
            return MaterialApp(
              theme: _themeAnimation.value,
              darkTheme: _themeAnimation.value,
              themeMode: _themeSettingsState.currentThemeMode,
              home: const ProfileScreen(),
            );
          },
        ),
      ),
    );
  }
}
