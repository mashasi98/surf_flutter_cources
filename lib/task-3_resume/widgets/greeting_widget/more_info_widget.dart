import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../resume_text.dart';

class MoreInfoWidget extends StatefulWidget {
  const MoreInfoWidget({super.key});

  @override
  _MoreInfoWidgetState createState() => _MoreInfoWidgetState();
}

class _MoreInfoWidgetState extends State<MoreInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: _buildTextInfo(),
              ),
              Expanded(
                flex: 1,
                child: _buildAnimatedArrow(),
              ),
            ],
          ),
        );
      },
    );
  }

  Container _buildAnimatedArrow() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/task-3/arrow_down.gif"),
          fit: BoxFit.contain,
          colorFilter:
              ColorFilter.mode(Colors.white.withOpacity(0.5), BlendMode.srcIn),
        ),
      ),
    );
  }

  Container _buildTextInfo() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Text(
        ResumeTexts.moreInfo,
        textAlign: TextAlign.center,
        style: GoogleFonts.abel(
          textStyle: TextStyle(
            fontSize: 50,
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 1.5
              ..color = const Color(0xc8f8f8f8),
          ),
        ),
      ),
    );
  }
}
