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
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      alignment: Alignment.topLeft,
      width: size.width,
      child: const Column(
        children: [
          FioWidget(),
        ],
      ),
    );
  }
}

