import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/entity/theme_settings.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/state/theme_settings_state.dart';

import '../../../generated/assets.dart';
import '../../domain/entity/theme_mode.dart';
import '../../utils/const/app_text_constant.dart';
import '../widgets/theme_settings_provider.dart';
import '../widgets/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_back,
            size: 24,
          ),
        ),
        title: const Align(
          alignment: Alignment.center,
          child: Text(
            AppTextConstant.profileText,
          ),
        ),
        actions: const <Widget>[
          TextButton(
            onPressed: null,
            child: Text(AppTextConstant.saveButtonText),
          ),
        ],
      ),
      body: _UserInfoWidget(),
    );
  }
}

class _UserInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: _ProfilePhotoWidget(),
            ),
            Expanded(
              flex: 2,
              child: _AchievementsWidget(),
            ),
            Expanded(
              flex: 9,
              child: _ProfileInfoWidget(),
            ),
            const Expanded(flex: 2, child: SizedBox()),
            _LogOutButtonWidget(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class _LogOutButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const _LogOutButtonWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: const Text(
          AppTextConstant.logoutText,
        ),
      ),
    );
  }
}

class _ProfilePhotoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userState = UserProvider.of(context);
    final String photoUrl = userState?.user.photo ?? Assets.profileNoPh;
    return Align(
      alignment: Alignment.center,
      child: CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage(photoUrl),
        child: const TextButton(
          onPressed: null,
          child: Text(AppTextConstant.profilePhotoEdit),
        ),
      ),
    );
  }
}

class _AchievementsWidget extends StatelessWidget {
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

class _ProfileInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userState = UserProvider.of(context);
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
          onPressed: null,
        ),
        _RoundedInfoWidget(
          label: AppTextConstant.playerPositionText,
          value: userState?.user.position ?? '',
          haveOptions: true,
          onPressed: null,
        ),
        const _RoundedInfoWidget(
          label: AppTextConstant.themeTitleText,
          value: 'value',
          haveOptions: true,
          onPressed: _changeTheme,
        ),
      ],
    );
  }

  void _changeTheme(BuildContext context) {
    showFlexibleBottomSheet(
      context: context,
      maxHeight: 0,
      initHeight: 0.5,
      minHeight: 1,
      builder: (context, controller, _) => _BottomSheetContent(controller),
      anchors: [0, 0.5, 1],
    );
  }
}

class _BottomSheetContent extends StatelessWidget {
  final ScrollController controller;

  const _BottomSheetContent(this.controller);

  @override
  Widget build(BuildContext context) {
    final themeSettingsState = ThemeSettingsProvider.of(context);

    return Material(
      child: ListView(
        controller: controller,
        children: ThemeSettings.themeVariations.map(),
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
                onPressed: onPressed,
                icon: const Icon(Icons.arrow_forward_ios, size: 20),
              )
          ],
        ),
      ),
    );
  }
}
