import 'dart:ui';

extension StringX on String {
  Color hexToColor() {
    String stringColor = hexToColorName();
    return Color(int.parse('FF$stringColor', radix: 16));
  }

  String hexToColorName() {
    return replaceFirst('#', '');
  }
}
