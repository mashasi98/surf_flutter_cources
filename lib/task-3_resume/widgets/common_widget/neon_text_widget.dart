import 'package:flutter/material.dart';

import '../decorator/resume_text_decorator.dart';

class NeonTextWidget extends StatelessWidget {
  const NeonTextWidget({
    super.key,
    required this.word,
    required this.topColor,
    required this.bottomColor,
  });

  final String word;
  final Color topColor;
  final Color bottomColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      word,
      style: ResumeTextDecorator.instance.neonTextDecorator(
        topColor,
        bottomColor,
      ),
      textAlign: TextAlign.left,
    );
  }
}
