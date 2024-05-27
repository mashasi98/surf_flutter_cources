import 'package:flutter/material.dart';

import '../decorator/custom_decorator.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    CustomDecorator decorator = CustomDecorator();
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: _buildProfileInfoContainer(decorator),
          ),
          Expanded(
            flex: 2,
            child: _buildPlayerInfoContainer(decorator),
          ),
        ],
      ),
    );
  }

  Container _buildProfileInfoContainer(CustomDecorator decorator) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/task-3/border_vertical.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: LayoutBuilder(
        builder: (context , constraints) {
          return Stack(
            children: [
              container(constraints),
              positioned(

                'Maria\nNikoletta',
                decorator.nameDecorator(),
                Size(constraints.maxWidth * 0.3, constraints.maxHeight *0.93),
              ),
              positioned(
                'Sikorskaya',
                TextStyle(),
                Size(constraints.maxWidth * 0.7, constraints.maxHeight * 0.7),
              ),
            ],
          );
        },
      ),
    );
  }

  Positioned positioned(String text, TextStyle textStyle, Size containerSize) {
    return Positioned(
      top: containerSize.height,
      left: containerSize.width,
      child: Text(
        text,
        style: textStyle,
        // TextStyle(fontSize: 40, color: color),
      ),
    );
  }

  Container container(BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.85,
      height: constraints.maxHeight * 0.85,
      margin: const EdgeInsets.only(left: 30, right: 32, top: 40, bottom: 40),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/task-3/foto.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Container _buildPlayerInfoContainer(CustomDecorator decorator) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.all(5),
      alignment: Alignment.topCenter,
      child: RichText(
        text: TextSpan(
          style: decorator.playerTextDecorator(),
          children: const [
            TextSpan(
              text: "player\n",
              style: TextStyle(fontSize: 35),
            ),
            TextSpan(text: " One")
          ],
        ),
      ),
    );
  }
}
