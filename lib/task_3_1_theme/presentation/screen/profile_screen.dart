import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surf_flutter_cources/generated/assets.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/entity/theme_settings.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/state/theme_settings_state.dart';
import 'package:surf_flutter_cources/task_3_1_theme/presentation/widgets/theme_settings_provider.dart';
import 'package:surf_flutter_cources/task_3_1_theme/presentation/widgets/user_provider.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/const/app_text_constant.dart';
import 'package:surf_flutter_cources/task_3_1_theme/utils/extensions/theme_extensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Реализовать сохранение
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            AppTextConstant.profileText,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Реализовать сохранение
            },
            child: Text(
              AppTextConstant.saveButtonText,
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
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
        onPressed: () {
          // Реализовать выход из аккаунта
        },
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
          child: Text(
            AppTextConstant.profilePhotoEdit,
            style:
                TextStyle(color: Theme.of(context).textTheme.bodySmall?.color),
          ),
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
        Text(
          AppTextConstant.achievementsText,
          style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 32,
          width: screenWidth * 0.6,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: allAchievementsLength,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: allAchievementsLength,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 20.0,
            ),
            itemBuilder: (context, index) {
              return Image.asset(
                allAchievements[index],
                width: 32,
                height: 32,
                fit: BoxFit.fill,
              );
            },
          ),
        ),
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
      minHeight: 0.3,
      initHeight: 0.4,
      maxHeight: 1,
      bottomSheetBorderRadius: const BorderRadius.vertical(
        top: Radius.circular(16),
      ),
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

  const _ThemeSettingsBottomSheet(this.scrollController,
      this.currentTheme,
      this.themeSettingsState,);

  @override
  State<_ThemeSettingsBottomSheet> createState() =>
      _ThemeSettingsBottomSheetState();
}

class _ThemeSettingsBottomSheetState extends State<_ThemeSettingsBottomSheet> {
  late ThemeMode _selectedMode;
  late int _selectedSchemeIndex;

  @override
  void initState() {
    super.initState();
    _selectedMode = widget.currentTheme;
    _selectedSchemeIndex = widget.themeSettingsState?.currentThemeIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final int themeCount = AppTextConstant.themesIcons.length;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppTextConstant.themeTitleText,
                  style: Theme.of(context).textTheme.headlineLarge),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            controller: widget.scrollController,
            children: [
              ...ThemeSettings.themeVariations.entries.map((entry) {
                return RadioListTile<ThemeMode>(
                  title: Text(entry.key,
                      style: Theme.of(context).textTheme.bodyLarge),
                  value: entry.value,
                  groupValue: _selectedMode,
                  onChanged: (ThemeMode? themeMode) {
                    setState(() {
                      _selectedMode = themeMode!;
                      if (_selectedMode == ThemeMode.system) {
                        _selectedSchemeIndex = 0;
                      }
                    });
                  },
                  activeColor: Theme.of(context).primaryColor,
                );
              }),
              if (_selectedMode != ThemeMode.system)
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        AppTextConstant.colorSchemeText,
                        style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontSize: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.fontSize,
                        ),
                      ),
                      const SizedBox(height: 25),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 1,
                        ),
                        itemCount: themeCount,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedSchemeIndex = index;
                              });
                            },
                            child: _ThemeCard(
                              selectedSchemeIndex: _selectedSchemeIndex,
                              isSelected: _selectedSchemeIndex == index,
                              currentIndex: index,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.07,
          child: ElevatedButton(
            onPressed: () {
              widget.themeSettingsState?.setThemeMode(_selectedMode);
              widget.themeSettingsState?.setThemeIndex(_selectedSchemeIndex);
              Navigator.pop(context);
            },
            child: const Text(AppTextConstant.doneText),
          ),
        ),
      ],
    );
  }
}

class _ThemeCard extends StatelessWidget {
  final int selectedSchemeIndex;
  final bool isSelected;
  final int currentIndex;

  const _ThemeCard(
      {required this.selectedSchemeIndex,
      required this.isSelected,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      //вот тут какая -то неведомая мне магия,которая не дает установить высоту контейнера
      decoration: BoxDecoration(
        color: Theme.of(context).getContainerColor(),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppTextConstant.themesIcons[currentIndex],
              width: 18, height: 18),
          const SizedBox(
            height: 5,
          ),
          Text(
            '${AppTextConstant.schemeText} ${currentIndex + 1}',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: Theme.of(context).secondaryHeaderColor,
                ),
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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 2, top: 5, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontWeight:
                          Theme.of(context).textTheme.bodyLarge?.fontWeight,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ],
              ),
              if (haveOptions)
                IconButton(
                  onPressed: () => onPressed?.call(context),
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
