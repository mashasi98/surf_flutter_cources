import 'package:flutter/material.dart';

class RotatedTextWidget extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Size containerSize;
  final double rotate;

  const RotatedTextWidget({super.key,
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