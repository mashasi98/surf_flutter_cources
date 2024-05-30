import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/resume_text.dart';
import '../common_widget/header_box_widget.dart';
import '../decorator/resume_box_decorator.dart';
import '../decorator/resume_text_decorator.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = ResumeBoxDecorator.instance
        .backgroundBorderDecorator(
            'assets/images/task-3/border_vertical.png', BoxFit.fill);

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _InfoBoxWidget(info: ResumeTexts.aboutMe, decoration: decoration),
          _InfoBoxWidget(info: ResumeTexts.hobbies, decoration: decoration),
          _InfoBoxWidget(info: ResumeTexts.education, decoration: decoration),
          _InfoBoxWidget(
              info: ResumeTexts.workExperience, decoration: decoration),
        ],
      ),
    );
  }
}

class _InfoBoxWidget extends StatelessWidget {
  final Map<String, String> info;
  final BoxDecoration decoration;

  const _InfoBoxWidget({required this.info, required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeaderTextWidget(text: info.keys.first),
        Container(
          decoration: decoration,
          child: Container(
            padding: const EdgeInsets.all(55),
            child: Text(
              info.values.first,
              style: ResumeTextDecorator.instance.bodyTextDecorator(),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}
