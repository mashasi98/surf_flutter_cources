import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../const/image/picture_path.dart';
import '../const/text/app_text_constant.dart';
import '../domain/entity/user_entity.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Widget build(BuildContext context) {
    final UserEntity user = UserEntity(
        id: 123345,
        name: 'Маркус',
        secondName: 'Хассельборг',
        email: 'MarkusHSS@gmail.com',
        teamName: 'Сборная Швеции',
        position: 'Скип',
        achievements: [
          PicturePath.achievementFirst,
          PicturePath.achievementFirst,
          PicturePath.achievementThird,
          PicturePath.achievementSecond,
          PicturePath.achievementThird
        ],
        photo: PicturePath.photoPath,
        birthDay: '03.03.1986');
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.arrow_back),
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
      body: _UserInfoWidget(user: user),
    );
  }
}

class _UserInfoWidget extends StatelessWidget {
  final UserEntity user;

  const _UserInfoWidget({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            _ProfilePhotoWidget(),
            _AchievementsWidget(),
            _ProfileInfoWidget(),
            const TextButton(
              onPressed: null,
              child: Text(
                AppTextConstant.logoutText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfilePhotoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(PicturePath.photoPath),
        ),
      ),
    );
  }
}

class _AchievementsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String>? allAchievements =[];
    final int allAchievementsLength = allAchievements.isNotEmpty ? allAchievements.length  : 0;
    return Column(
      children: [
        const Text(AppTextConstant.achievementsText),
        SizedBox(
          height: 32,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: allAchievementsLength,
            itemBuilder: (context, index) {
              SvgPicture.asset(
                allAchievements[index],
                width: 32,
                height: 32,
                fit: BoxFit.fill,
                // placeholderBuilder: const Icon( icon: Icons.no_photography_rounded),
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
    return Container(
      child: const Column(
        children: [
          _RoundedInfoWidget(
            label: 'label',
            value: 'value',
          ),
          _RoundedInfoWidget(
            label: 'label',
            value: 'value',
          ),
          _RoundedInfoWidget(
            label: 'label',
            value: 'value',
          ),
          _RoundedInfoWidget(
            label: 'label',
            value: 'value',
          ),
          _RoundedInfoWidget(
            label: 'label',
            value: 'value',
          ),
          _RoundedInfoWidget(
            label: 'label',
            value: 'value',
          ),
        ],
      ),
    );
  }
}

class _RoundedInfoWidget extends StatelessWidget {
  final String label;
  final String value;

  const _RoundedInfoWidget({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
