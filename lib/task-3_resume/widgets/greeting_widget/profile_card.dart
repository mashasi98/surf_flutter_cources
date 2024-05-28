import 'dart:math';

import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/resume_text.dart';

import '../decorator/custom_decorator.dart';

class ProfileCardWidget extends StatelessWidget {

  const ProfileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    CustomDecorator decorator = CustomDecorator();
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: _buildProfileInfoContainer(decorator),
          ),
          Expanded(
            flex: 2,
            child: _buildPlayerInfoContainer(decorator),
          ),
        ],
      ),
    );
  }

  Container _buildProfileInfoContainer(CustomDecorator decorator) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/task-3/border_vertical.png"),
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
              const Color(0xFF770AF6).withOpacity(0.02), BlendMode.colorDodge),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              _buildBIOPhoto(constraints),
              _buildRotatedText(
                  ResumeTexts.name,
                  decorator.nameDecorator(),
                  Size(constraints.maxWidth * 0.3,
                      constraints.maxHeight * 0.935),
                  0),
              _buildRotatedText(
                  ResumeTexts.secondName,
                  decorator.secondNameDecorator(),
                  Size(constraints.maxWidth * 0.66,
                      constraints.maxHeight * 0.65),
                  0.5 * pi),
            ],
          );
        },
      ),
    );
  }

  Positioned _buildRotatedText(
      String text, TextStyle textStyle, Size containerSize, double rotate) {
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

  Container _buildBIOPhoto(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.85,
      height: constraints.maxHeight * 0.85,
      margin: const EdgeInsets.only(left: 30, right: 32, top: 40, bottom: 40),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/task-3/foto.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container _buildPlayerInfoContainer(CustomDecorator decorator) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.all(5),
      alignment: Alignment.topCenter,
      child: RichText(
        text: TextSpan(
          style: decorator.playerTextDecorator(),
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
