import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/decorator/custom_decorator.dart';

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
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    ResumeTexts.moreInfo,
                    textAlign: TextAlign.center,
                    style: CustomDecorator.instance.infoTextDecorator(),
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
