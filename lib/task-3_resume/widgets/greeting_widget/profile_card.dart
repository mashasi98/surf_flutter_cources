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
            child: _buildProfileInfoContainer(),
          ),
          Expanded(
            flex: 2,
            child: _buildPlayerInfoContainer(decorator),
          ),
        ],
      ),
    );
  }

  Container _buildProfileInfoContainer() {
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
          return Container(
            width: constraints.maxWidth *0.8,
            height: constraints.maxHeight*0.8,
            margin: const EdgeInsets.only( left: 32 , right: 32, top: 40, bottom: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/task-3/foto.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          );
        }
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
