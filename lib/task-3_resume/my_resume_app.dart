import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/about_me/about_me_widget.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/contact_widget.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/decorator/custom_decorator.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/greeting_widget/greeting_widget.dart';

class MyResumeApp extends StatelessWidget {
  const MyResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    CustomDecorator decorator = CustomDecorator();
    return Scaffold(
      body: Container(
        decoration: decorator.buildBackgroundDecoration(),
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

