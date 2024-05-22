import 'package:flutter/cupertino.dart';

class  CustomDecorator{
  BoxDecoration buildBackgroundDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/task-3/main_bg.jpg"),
        fit: BoxFit.cover,
      ),
    );
  }
}

