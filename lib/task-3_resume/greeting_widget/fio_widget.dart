import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FioWidget extends StatelessWidget {
  const FioWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Stack(
            children: [
              _buildPhotoContainer(size),
              _buildNamePositioned(size),
              _buildSecondNamePositioned(size),
            ],
          ),
          SizedBox(
            height: size.height * 0.5,
            child: Column(
              children: [
                _layerTextStack('PLAYER'),
                _layerTextStack('ONE'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Positioned _buildSecondNamePositioned(Size size) {
    return Positioned(
      left: size.width * 0.352,
      bottom: size.height * 0.16,
      child: Transform.rotate(
        angle: 0.5 * pi,
        child: Container(
          alignment: Alignment.bottomCenter,
          child: _secondNameStack('SIKORSKAYA'),
        ),
      ),
    );
  }

  Positioned _buildNamePositioned(Size size) {
    return Positioned(
      left: size.width * 0.1,
      bottom: size.width * 0.035,
      child: Container(
        alignment: Alignment.bottomCenter,
        child: Text.rich(
          TextSpan(
            text: "M A R I A\n"
                "N I K O L E T T A",
            style: GoogleFonts.orbitron(
              textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                height: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Container _buildPhotoContainer(Size size) {
    return Container(
      height: size.height * 0.5,
      width: size.width * 0.6,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.only(top: 5, left: 0, right: 20, bottom: 25),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/task-3/border_vertical.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        height: size.height * 0.15,
        width: size.width * 0.1,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/task-3/foto.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Stack _secondNameStack(String text) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.teko(
            textStyle: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              height: 1.1,
              foreground: Paint()
                ..style = PaintingStyle.fill
                ..strokeWidth = 1.8
                ..color = const Color(0xE742CCE4),
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.teko(
            textStyle: const TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              height: 1,
              color: Color(0xFF770AF6),
            ),
          ),
        ),
      ],
    );
  }

  Stack _layerTextStack(String text) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.teko(
            textStyle: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              height: 1.1,
              fontStyle: FontStyle.italic,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 1
                ..color = Colors.blue,
            ),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: GoogleFonts.teko(
            textStyle: const TextStyle(
              fontSize: 39,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              height: 1.3,
              color: Color(0xFFDF42E4),
            ),
          ),
        ),
      ],
    );
  }
}
