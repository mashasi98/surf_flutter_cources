import 'package:flutter/material.dart';
import '../decorator/custom_decorator.dart';

 class AboutWidget extends StatefulWidget {
  final String topText;
  final String bottomText;

  const AboutWidget({
    super.key,
    required this.topText,
    required this.bottomText,
  });

  const AboutWidget.oneWord({
    super.key,
    required this.bottomText,
  })  : topText = '';

  @override
  _AboutWidgetState createState() => _AboutWidgetState();
}

 class _AboutWidgetState  extends State<AboutWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeadText(),
        Container(
          height: 300,
          // decoration: decorator.customBackgroundBorderBodyDecorator('ssets/images/task-3/border_horizontal.png') ,
          ),

      ],
    );
  }
  Widget _buildHeadText() {
    return Container(
      margin: const EdgeInsets.only(left: 10, bottom: 10, top: 5),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.topText.isNotEmpty)
            _buildNeonText(widget.topText, const Color(0xFFAF68FD),
                const Color(0xff770af6)),
          _buildNeonText(
            widget.bottomText,
            const Color(0xff83a8f1),
            const Color(0xff0a8cf6),
          ),
        ],
      ),
    );
  }

  Text _buildNeonText(String text, Color textColor, Color shadeColor) {
    return Text(
      text,
      style: CustomDecorator.instance.neonTextDecorator(textColor, shadeColor),
      textAlign: TextAlign.left,
    );
  }
}
