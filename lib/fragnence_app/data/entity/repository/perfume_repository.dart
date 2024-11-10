import 'package:surf_flutter_cources/fragnence_app/data/entity/perfume.dart';
import 'package:surf_flutter_cources/fragnence_app/data/mock/mock_data.dart';

class PerfumeRepository {
  Future<List<Perfume>>? getPerfumes() async {
    return Future.value(perfumes);
  }
}
