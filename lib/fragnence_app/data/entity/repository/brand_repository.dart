import 'package:surf_flutter_cources/fragnence_app/data/entity/brand.dart';
import 'package:surf_flutter_cources/fragnence_app/data/mock/mock_data.dart';

class BrandRepository{

  Future<List<Brand>> getBrands() async {
    return Future.value(brands);
  }

}


