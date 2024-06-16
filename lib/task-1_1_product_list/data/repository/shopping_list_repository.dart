import 'package:surf_flutter_cources/task-1_1_product_list/data/mock_data.dart';

import '../../domain/entity/cheque_entity.dart';

class ShoppingListRepository {
  Future<ChequeEntity> getCheque(int id) async {
    return Future.value(
      ChequeEntity(
        id: id,
        date: DateTime.now(),
        products: dataForStudents,
      ),
    );
  }
}
