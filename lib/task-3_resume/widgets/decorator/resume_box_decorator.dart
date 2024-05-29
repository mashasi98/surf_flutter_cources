import 'package:flutter/material.dart';

class ResumeBoxDecorator {
  static ResumeBoxDecorator? _instance;

  ResumeBoxDecorator._();

  static ResumeBoxDecorator get instance {
    _instance ??= ResumeBoxDecorator._();
    return _instance!;
  }

  BoxDecoration avatarPhotoDecorator() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/task-3/foto.jpg"),
        fit: BoxFit.cover,
      ),
    );
  }

  BoxDecoration backgroundBorderPhotoDecorator() {
    return BoxDecoration(
      image: DecorationImage(
        image: const AssetImage("assets/images/task-3/main_bg.jpg"),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcOver),
      ),
    );
  }

  BoxDecoration backgroundBorderDecorator(String imagePath, BoxFit fit) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imagePath),
        fit: fit,
        colorFilter: ColorFilter.mode(
            const Color(0xFFEC3EC7).withOpacity(0.2), BlendMode.colorDodge),
      ),
    );
  }
}
