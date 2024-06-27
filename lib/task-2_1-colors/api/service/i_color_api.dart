import 'package:surf_flutter_cources/task-2_1-colors/api/data/color_data.dart';

abstract interface class IColorApi{
  Future<List<ColorData>> getColors();
}