import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: IntrinsicHeight(
          child: Column(
            children: [
              buildSizedBox(300),
              buildSizedBox(300),
              buildSizedBox(700),
              buildSizedBox(700),
            ],
          ),
        )
    );
  }

  Container buildSizedBox(double textContainerHeight) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Text("dara", style: TextStyle( color: Colors.cyanAccent , fontSize: 40),),
            Container(
              height: textContainerHeight,
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Colors.amberAccent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )
            ),
          ],
        )
    );
  }


}