import '../../domain/entity/category_entity.dart';
import '../../domain/entity/sorting_type.dart';

extension CategoryListX on List<Category> {
  List<Category> sortByCategory(SortingType type) {
    final List<Category> sortedResultList = switch (type) {
      SortingType.none => this,
      SortingType.nameFromA => this,
      SortingType.nameFromZ => this,
      SortingType.ascendingOrder => this,
      SortingType.descendingOrder => this,
      SortingType.typeFromA => _sortByCategory(this),
      SortingType.typeFromZ => _sortByCategory(this, isFromA: false),
    };
    return sortedResultList;
  }

  List<Category> _sortByCategory(List<Category> list, {bool isFromA = true}) {
    List<Category> sortedCategories = List.from(list);
    sortedCategories.sort(
      (a, b) => isFromA
          ? a.toString().compareTo(b.toString())
          : b.toString().compareTo(a.toString()),
    );
    return sortedCategories;
  }
}
