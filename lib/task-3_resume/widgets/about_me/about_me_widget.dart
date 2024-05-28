import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/resume_text.dart';
import 'about_info_widget.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const IntrinsicHeight(
      child: Column(
        children: [
          AboutWidget(info: ResumeTexts.aboutMe),
          AboutWidget(info: ResumeTexts.hobbies),
          AboutWidget(info: ResumeTexts.education),
          AboutWidget(info: ResumeTexts.workExperience),
        ],
      ),
    );
  }
}
