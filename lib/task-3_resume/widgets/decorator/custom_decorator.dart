import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDecorator {
  BoxDecoration customBackgroundBorderPhotoDecorator() {
    return BoxDecoration(
      image: DecorationImage(
        image: const AssetImage("assets/images/task-3/main_bg.jpg"),
        fit: BoxFit.cover,
        colorFilter:
            ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.srcOver),
      ),
    );
  }

  BoxDecoration customBackgroundBorderBodyDecorator(String imagePath) {
    return BoxDecoration(
        image: DecorationImage(
      image: AssetImage(imagePath),
      // 'assets/images/task-3/border_horizontal.png'),
      fit: BoxFit.fill,
      colorFilter: ColorFilter.mode(
          const Color(0xFFEC3EC7).withOpacity(0.2), BlendMode.colorDodge),
    ));
  }

  TextStyle playerTextDecorator() {
    return GoogleFonts.orbitron(
      color: const Color(0xFFEC3EC7),
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 30,
      height: 1,
      shadows: [
        const Shadow(
          color: Color(0xFF00D0D1),
          blurRadius: 3,
          offset: Offset(-3, 1),
        ),
      ],
    );
  }

  TextStyle nameDecorator() {
    return GoogleFonts.orbitron(
      color: const Color(0xD0FFFFFF),
      fontSize: 16,
      height: 1,
      fontWeight: FontWeight.bold,
      shadows: [
        const Shadow(
          color: Color(0xFFDF42E4),
          blurRadius: 4,
          offset: Offset(2, 2),
        ),
      ],
    );
  }

  TextStyle secondNameDecorator() {
    return GoogleFonts.teko(
      color: const Color(0xB6770AF6),
      fontSize: 32,
      height: 1,
      fontWeight: FontWeight.w600,
      shadows: [
        const Shadow(
          color: Color(0xFF00D0D1),
          blurRadius: 3,
          offset: Offset(1, 1),
        ),
      ],
    );
  }

  TextStyle neonTextDecorator(Color textColor, Color shadeColor) {
    return GoogleFonts.orbitron(
      fontSize: 40,
      fontWeight: FontWeight.bold,
      height: 1.1,
      foreground: Paint()
        ..style = PaintingStyle.fill
        ..strokeWidth = 1
        ..color = textColor,
      shadows: [
        Shadow(
          offset: const Offset(0, 0),
          blurRadius: 10.0,
          color: shadeColor.withOpacity(0.7),
        ),
        Shadow(
          offset: const Offset(0, 0),
          blurRadius: 20.0,
          color: shadeColor.withOpacity(0.6),
        ),
        Shadow(
          offset: const Offset(0, 0),
          blurRadius: 30.0,
          color: shadeColor.withOpacity(0.5),
        ),
      ],
    );
  }
}
