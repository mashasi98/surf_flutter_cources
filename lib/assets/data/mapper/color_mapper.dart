import 'package:surf_flutter_cources/task-2_1-colors/domain/entity/color_entity.dart';

import '../../../task-2_1-colors/api/data/color_data.dart';


final class ColorMapper {
  List<ColorEntity> mapColors(List<ColorData> data) {
    final mappedList = <ColorEntity>[];
    data.map((color) => _mapColors(color)).forEach((entity) {
      if (entity != null) mappedList.add(entity);
    });
    return mappedList;
  }

  ColorEntity? _mapColors(ColorData data) {
    final value = data.value;
    if (value == null) return null;

    return ColorEntity(
      name: data.name,
      value: value,
    );
  }
}
