import 'package:flutter/cupertino.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/entity/user_entity.dart';

class UserState extends ChangeNotifier {
  final UserEntity _user;

  UserState(this._user);

  UserEntity get user => _user;

  void updateName(String name) {
    _user.name = name;
    notifyListeners();
  }

  void updateSecondName(String secondName) {
    _user.secondName = secondName;
    notifyListeners();
  }

  void updateEmail(String email) {
    _user.email = email;
    notifyListeners();
  }

  void updateBirthDay(String birthDay) {
    _user.birthDay = birthDay;
    notifyListeners();
  }

  void updateTeamName(String teamName) {
    _user.teamName = teamName;
    notifyListeners();
  }

  void updatePosition(String position) {
    _user.position = position;
    notifyListeners();
  }

  void updateAchievements(List<String> achievements) {
    _user.achievements = achievements;
    notifyListeners();
  }

  void addAchievement(String achievement) {
    _user.achievements.add(achievement);
    notifyListeners();
  }

  void updatePhoto(String photo) {
    _user.photo = photo;
    notifyListeners();
  }
}
