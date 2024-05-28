import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/resume_text.dart';
import '../common_widget/info_box_widget.dart';
import '../decorator/custom_decorator.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BoxDecoration decoration = CustomDecorator.instance
        .backgroundBorderDecorator(
            'assets/images/task-3/border_vertical.png', BoxFit.fill);

    return Container(
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          InfoBoxWidget(info: ResumeTexts.aboutMe, decoration: decoration),
          InfoBoxWidget(info: ResumeTexts.hobbies, decoration: decoration),
          InfoBoxWidget(info: ResumeTexts.education, decoration: decoration),
          InfoBoxWidget(
              info: ResumeTexts.workExperience, decoration: decoration),
        ],
      ),
    );
  }
}
