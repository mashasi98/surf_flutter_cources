import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:surf_flutter_cources/task-2_1-colors/api/colors_api_urls.dart';
import 'package:surf_flutter_cources/task-2_1-colors/api/data/color_data.dart';
import 'package:surf_flutter_cources/task-2_1-colors/api/service/i_color_api.dart';


class ColorApi implements IColorApi {
  @override
  Future<List<ColorData>> getColors() async {
    final colors = <ColorData>[];
    await _addDelay(1500);
    final jsonString = await _loadAsset(ColorApiUrl.colors);
    final data = jsonDecode(jsonString) as Map<String, dynamic>;

    final colorsData = data['colors'] as List;

    if(colorsData.isNotEmpty){
      for (final e in colorsData){
        colors.add(ColorData.fromJson(e as Map <String, dynamic>));
      }
    }
    return colors;
  }

   Future<void> _addDelay(int ms) => Future.delayed(Duration(milliseconds: ms));

  Future<String> _loadAsset(String path) => rootBundle.loadString(path);
}
