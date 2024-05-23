import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'fio_widget.dart';

class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return LayoutBuilder(builder: (context, constraints) {
      double parentWidth = constraints.maxWidth;
      return Container(
        alignment: Alignment.topLeft,
        width: parentWidth,
        height: size.height,
        child: const Column(
          children: [
            FioWidget(),
          ],
        ),
      );
    });
  }
}
