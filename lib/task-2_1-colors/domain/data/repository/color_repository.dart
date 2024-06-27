import 'package:surf_flutter_cources/task-2_1-colors/api/service/i_color_api.dart';
import 'package:surf_flutter_cources/task-2_1-colors/domain/data/mapper/color_mapper.dart';
import 'package:surf_flutter_cources/task-2_1-colors/domain/entity/color_entity.dart';

final class ColorRepository {
  final IColorApi _colorApi;
  final ColorMapper _colorMapper;

  ColorRepository({
    required IColorApi colorApi,
    required ColorMapper colorMapper,
  })  : _colorApi = colorApi,
        _colorMapper = colorMapper;

  Future<List<ColorEntity>> getColors() =>
      _colorApi.getColors().then(_colorMapper.mapColors);
}
