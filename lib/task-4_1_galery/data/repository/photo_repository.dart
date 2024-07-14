import 'package:surf_flutter_cources/task-4_1_galery/data/mock_data.dart';
import 'package:surf_flutter_cources/task-4_1_galery/domain/entity/photo_entity.dart';

class PhotoRepository{
  Future<List<PhotoEntity>> getPhotos() async{
    return Future.value(mockData);
  }
}