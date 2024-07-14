import 'package:surf_flutter_cources/task-4_1_galery/domain/entity/photo_entity.dart';

final List<PhotoEntity> mockData = List.generate(30,
    (index) => PhotoEntity(
      imageUrl: 'https://picsum.photos/${index+1}/237/200/300'
    ),
);