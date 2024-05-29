import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/decorator/custom_decorator.dart';
import 'header_box_widget.dart';

class InfoBoxWidget extends StatelessWidget {
  final Map<String, String> info;
  final BoxDecoration decoration;

  const InfoBoxWidget(
      {super.key, required this.info, required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeaderTextWidget(text: info.keys.first),
        Container(
          decoration: decoration,
          child: Container(
            padding: const EdgeInsets.all(55),
            child: Text(
              info.values.first,
              style: CustomDecorator.instance.bodyTextDecorator(),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
    );
  }
}
