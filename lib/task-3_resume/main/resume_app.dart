import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/about_me/about_me_widget.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/decorator/resume_box_decorator.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/greeting_widget/greeting_widget.dart';

import '../widgets/contact_widget/contact_widget.dart';

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: ResumeBoxDecorator.instance.backgroundBorderPhotoDecorator(),
        child: ListView(
          children: const [
            Column(
              children: [
                GreetingWidget(),
                AboutMeWidget(),
                ContactWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
