import '../data/color_data.dart';

abstract class ColorApi{
  Future<List<ColorData>> getColors();
}