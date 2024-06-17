import 'package:surf_flutter_cources/task-2_1-colors/api/service/color_api.dart';


import '../../../task-2_1-colors/domain/entity/color_entity.dart';
import '../mapper/color_mapper.dart';

final class ColorRepository {
  final ColorApi _colorApi;
  final ColorMapper _colorMapper;

  ColorRepository({
    required ColorApi colorApi,
    required ColorMapper colorMapper,
  })  : _colorApi = colorApi,
        _colorMapper = colorMapper;

  Future<List<ColorEntity>> getColors() =>
      _colorApi.getColors().then(_colorMapper.mapColors);
}
