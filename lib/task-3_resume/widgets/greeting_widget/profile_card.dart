import 'dart:math';
import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/resume_text.dart';
import '../decorator/resume_box_decorator.dart';
import '../decorator/resume_text_decorator.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: _ProfileInfoWidget(),
          ),
          Expanded(
            flex: 2,
            child: _PlayerTextWidget(),
          ),
        ],
      ),
    );
  }
}

class _PlayerTextWidget extends StatelessWidget {
  const _PlayerTextWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.all(5),
      alignment: Alignment.topCenter,
      child: RichText(
        text: TextSpan(
          style: ResumeTextDecorator.instance.playerTextDecorator(),
          children: const [
            TextSpan(
              text: "player\n",
              style: TextStyle(fontSize: 35),
            ),
            TextSpan(text: " One")
          ],
        ),
      ),
    );
  }
}

class _ProfileInfoWidget extends StatelessWidget {
  const _ProfileInfoWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: ResumeBoxDecorator.instance.backgroundBorderDecorator(
        "assets/images/task-3/border_vertical.png",
        BoxFit.fill,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Container(
                width: constraints.maxWidth * 0.85,
                height: constraints.maxHeight * 0.85,
                margin: const EdgeInsets.only(
                    left: 30, right: 32, top: 40, bottom: 40),
                decoration: ResumeBoxDecorator.instance.avatarPhotoDecorator(),
              ),
              _RotatedTextWidget(
                  text: ResumeTexts.name,
                  textStyle: ResumeTextDecorator.instance.nameDecorator(),
                  containerSize: Size(constraints.maxWidth * 0.3,
                      constraints.maxHeight * 0.935),
                  rotate: 0),
              _RotatedTextWidget(
                  text: ResumeTexts.secondName,
                  textStyle: ResumeTextDecorator.instance.secondNameDecorator(),
                  containerSize: Size(constraints.maxWidth * 0.66,
                      constraints.maxHeight * 0.65),
                  rotate: 0.5 * pi),
            ],
          );
        },
      ),
    );
  }
}

class _RotatedTextWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Size containerSize;
  final double rotate;

  const _RotatedTextWidget({
    required this.text,
    required this.textStyle,
    required this.containerSize,
    required this.rotate,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: containerSize.height,
      left: containerSize.width,
      child: Transform.rotate(
        angle: rotate,
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}
