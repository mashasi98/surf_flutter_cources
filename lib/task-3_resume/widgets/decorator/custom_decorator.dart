import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class  CustomDecorator{
  BoxDecoration buildBackgroundDecoration() {
    return const BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/task-3/main_bg.jpg"),
        fit: BoxFit.cover,
      ),
    );
  }

  TextStyle playerTextDecorator () {
    return GoogleFonts.orbitron (
      color:  const Color(0xFFEC3EC7),
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 30,
      height: 1,
      shadows: [
        const Shadow(
          color:Color(0xFF00D0D1),
          blurRadius: 3,
          offset: Offset(-3, 1),
        ),
      ],
    );
  }

  TextStyle nameDecorator(){
    return GoogleFonts.orbitron(
      color: Colors.white,
      fontSize : 15 ,
      height: 1,
    );
  }

}

