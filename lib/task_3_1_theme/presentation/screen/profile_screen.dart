import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/generated/assets.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/entity/theme_settings.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/state/theme_settings_state.dart';
import 'package:surf_flutter_cources/task_3_1_theme/presentation/widgets/theme_settings_provider.dart';
import 'package:surf_flutter_cources/task_3_1_theme/presentation/widgets/user_provider.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/const/app_text_constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Align(
          alignment: Alignment.center,
          child: Text(AppTextConstant.profileText),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Implement save functionality
            },
            child: const Text(AppTextConstant.saveButtonText),
          ),
        ],
      ),
      body: const _UserInfoWidget(),
    );
  }
}

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 20),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(flex: 2, child: _ProfilePhotoWidget()),
          Expanded(flex: 2, child: _AchievementsWidget()),
          Expanded(flex: 9, child: _ProfileInfoWidget()),
          Expanded(flex: 2, child: SizedBox()),
          _LogOutButtonWidget(),
        ],
      ),
    );
  }
}

class _LogOutButtonWidget extends StatelessWidget {
  const _LogOutButtonWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: const Text(AppTextConstant.logoutText),
      ),
    );
  }
}

class _ProfilePhotoWidget extends StatelessWidget {
  const _ProfilePhotoWidget();

  @override
  Widget build(BuildContext context) {
    final userState = UserProvider.of(context);
    final String photoUrl = userState?.user.photo ?? Assets.profileNoPh;
    return Align(
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(photoUrl),
        child: TextButton(
          onPressed: () {},
          child: const Text(AppTextConstant.profilePhotoEdit),
        ),
      ),
    );
  }
}

class _AchievementsWidget extends StatelessWidget {
  const _AchievementsWidget();

  @override
  Widget build(BuildContext context) {
    final userState = UserProvider.of(context);
    final screenWidth = MediaQuery.of(context).size.width;
    List<String>? allAchievements = userState?.user.achievements ?? [];
    final int allAchievementsLength = allAchievements.length;
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(AppTextConstant.achievementsText),
        const SizedBox(height: 10),
        SizedBox(
          height: 32,
          width: screenWidth * 0.6,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allAchievementsLength,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Image.asset(
                    allAchievements[index],
                    width: 32,
                    height: 32,
                    fit: BoxFit.fill,
                  ),
                  if (allAchievementsLength != index + 1)
                    const SizedBox(width: 20),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}

class _ProfileInfoWidget extends StatefulWidget {
  const _ProfileInfoWidget();

  @override
  State<_ProfileInfoWidget> createState() => _ProfileInfoWidgetState();
}

class _ProfileInfoWidgetState extends State<_ProfileInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final userState = UserProvider.of(context);
    final themeSettingsState = ThemeSettingsProvider.of(context);
    final currentTheme = themeSettingsState?.currentThemeMode;

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _RoundedInfoWidget(
          label: AppTextConstant.nameText,
          value:
          '${userState?.user.name ?? ''} ${userState?.user.secondName ?? ''}',
          haveOptions: false,
          onPressed: null,
        ),
        _RoundedInfoWidget(
          label: AppTextConstant.emailText,
          value: userState?.user.email ?? '',
          haveOptions: false,
          onPressed: null,
        ),
        _RoundedInfoWidget(
          label: AppTextConstant.birthDayText,
          value: userState?.user.birthDay ?? '',
          haveOptions: false,
          onPressed: null,
        ),
        _RoundedInfoWidget(
          label: AppTextConstant.teamCountryText,
          value: userState?.user.teamName ?? '',
          haveOptions: true,
          onPressed: (context) {},
        ),
        _RoundedInfoWidget(
          label: AppTextConstant.playerPositionText,
          value: userState?.user.position ?? '',
          haveOptions: true,
          onPressed: (context) {},
        ),
        _RoundedInfoWidget(
          label: AppTextConstant.themeTitleText,
          value: ThemeSettings.getThemeName(currentTheme),
          haveOptions: true,
          onPressed: (context) {
            _changeTheme(
              context,
              themeSettingsState,
              currentTheme ?? ThemeMode.system,
            );
          },
        ),
      ],
    );
  }

  void _changeTheme(BuildContext context,
      ThemeSettingsState? themeSettingsState, ThemeMode currentTheme) {
    showFlexibleBottomSheet(
      context: context,
      minHeight: 0,
      initHeight: 0.5,
      maxHeight: 1,
      builder: (context, controller, _) => _ThemeSettingsBottomSheet(
        controller,
        currentTheme,
        themeSettingsState,
      ),
      anchors: [0, 0.5, 1],
    );
  }
}

class _ThemeSettingsBottomSheet extends StatefulWidget {
  final ScrollController scrollController;
  final ThemeMode currentTheme;
  final ThemeSettingsState? themeSettingsState;

  const _ThemeSettingsBottomSheet(
      this.scrollController, this.currentTheme, this.themeSettingsState);

  @override
  State<_ThemeSettingsBottomSheet> createState() =>
      _ThemeSettingsBottomSheetState();
}

class _ThemeSettingsBottomSheetState extends State<_ThemeSettingsBottomSheet> {
  late ThemeMode _selectedMode;

  @override
  void initState() {
    super.initState();
    _selectedMode = widget.currentTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: ListView(
              controller: widget.scrollController,
              children: ThemeSettings.themeVariations.entries.map((entry) {
                return RadioListTile<ThemeMode>(
                  title: Text(entry.key),
                  value: entry.value,
                  groupValue: _selectedMode,
                  onChanged: (ThemeMode? themeMode) {
                    setState(() {
                      _selectedMode = themeMode!;
                    });
                  },
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              widget.themeSettingsState?.setThemeMode(_selectedMode);
              Navigator.pop(context);
            },
            child: const Text(AppTextConstant.saveButtonText),
          ),
        ],
      ),
    );
  }
}


class _RoundedInfoWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool haveOptions;
  final void Function(BuildContext)? onPressed;

  const _RoundedInfoWidget({
    required this.label,
    required this.value,
    required this.haveOptions,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0x13050404),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label),
                Text(value),
              ],
            ),
            if (haveOptions)
              IconButton(
                onPressed: () => onPressed?.call(context),
                icon: const Icon(Icons.arrow_forward_ios, size: 20),
              )
          ],
        ),
      ),
    );
  }
}
