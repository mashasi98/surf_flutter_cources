import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task_3_1_theme/domain/state/user_state.dart';

class UserProvider extends InheritedNotifier<UserState> {
  final UserState userState;
  const UserProvider(
      {super.key, required this.userState, required super.child})
      : super(notifier: userState);

  static UserState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>()?.notifier;
  }

  static UserState? maybeOf(BuildContext context) {
    return context
        .getElementForInheritedWidgetOfExactType<UserProvider>()
        ?.widget as UserState?;
  }
  @override
  bool updateShouldNotify(UserProvider oldWidget) {
    return oldWidget.userState != userState;
  }
}
