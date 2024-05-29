import 'package:flutter/material.dart';

import '../../resume_text.dart';
import '../decorator/resume_text_decorator.dart';

class MoreInfoWidget extends StatefulWidget {
  const MoreInfoWidget({super.key});

  @override
  MoreInfoWidgetState createState() => MoreInfoWidgetState();
}

class MoreInfoWidgetState extends State<MoreInfoWidget> {
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
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    ResumeTexts.moreInfo,
                    textAlign: TextAlign.center,
                    style: ResumeTextDecorator.instance.infoTextDecorator(),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(
                          "assets/images/task-3/arrow_down.gif"),
                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.5), BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
