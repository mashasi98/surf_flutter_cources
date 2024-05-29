import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surf_flutter_cources/task-3_resume/resume_text.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/decorator/resume_box_decorator.dart';
import '../common_widget/neon_text_widget.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const NeonTextWidget(
            word: ResumeTexts.contacts,
            topColor: Color(0xFF42E4A6),
            bottomColor: Color(0xe742cce4)),
        Container(
          decoration: ResumeBoxDecorator.instance.backgroundBorderDecorator(
              "assets/images/task-3/border_horizontal.png", BoxFit.fill),
          margin: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.only(top: 30, left: 30, bottom: 30),
            child: const IntrinsicHeight(
              child: Column(
                children: [
                  _ContactRowWidget(
                    text: ResumeTexts.email,
                    icon: "assets/images/task-3/email.svg",
                  ),
                  _ContactRowWidget(
                    text: ResumeTexts.git,
                    icon: "assets/images/task-3/github.svg",
                  ),
                  _ContactRowWidget(
                    text: ResumeTexts.tg,
                    icon: "assets/images/task-3/tg.svg",
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ContactRowWidget extends StatelessWidget {
  final String text;
  final String icon;

  const _ContactRowWidget({
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10, right: 10, left: 5),
              child: SvgPicture.asset(
                icon,
                height: 30,
                width: 30,
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Color(0xff70bdfa), BlendMode.srcIn),
              ),
            ),
            Text(
              text,
              softWrap: true,
              maxLines: 2,
              style: GoogleFonts.pixelifySans(
                color: Colors.white,
                fontSize: 23,
                height: 3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
