import 'package:flutter/material.dart';
import 'about_info_widget.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: IntrinsicHeight(
        child: Column(
          children: [
            AboutWidget(topText: 'ABOUT', bottomText: "ME"),
            // AboutBodyWidget.oneWord(bottomText: 'HOBBIES'),
            AboutWidget(
              topText: 'WORK',
              bottomText: "EXPIRIENCE",
            ),
          ],
        ),
      ),
    );
  }
}
