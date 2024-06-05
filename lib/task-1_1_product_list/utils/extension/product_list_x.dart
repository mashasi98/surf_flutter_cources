import 'package:surf_flutter_cources/task-1_1_product_list/domain/entity/product_entity.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/domain/entity/sorting_type.dart';

extension ProductListX on List<ProductEntity> {
  List<ProductEntity> sortByFilter(SortingType type) {
    final List<ProductEntity> sortedList = switch (type) {
      SortingType.none => this,
      SortingType.nameFromA => _sortByName(this),
      SortingType.nameFromZ => _sortByName(this, isFromA: false),
      SortingType.ascendingOrder => _sortByPrice(this),
      SortingType.descendingOrder => _sortByPrice(this, isCheapFirst: false),
      SortingType.typeFromA => this,
      SortingType.typeFromZ => this,
    };

    return sortedList;
  }

  List<ProductEntity> _sortByName(List<ProductEntity> list,
      {bool isFromA = true}) {
    final result = list;
    result.sort((a, b) =>
        isFromA ? a.title.compareTo(b.title) : b.title.compareTo(a.title));
    return result;
  }

  List<ProductEntity> _sortByPrice(List<ProductEntity> list,
      {bool isCheapFirst = true}) {
    final result = list;
    result.sort((a, b) =>
        isCheapFirst ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
    return result;
  }
}
