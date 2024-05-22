import 'package:flutter/material.dart';

import 'decorator/custom_decorator.dart';
import 'greeting_widget/greeting_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CustomDecorator decorator = CustomDecorator();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: decorator.buildBackgroundDecoration(),
        child: ListView(
          children: [
            Column(
              children: [
                const GreetingWidget(),
                Container(
                  alignment: Alignment.center,
                  height: size.height,
                  width: size.width,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
