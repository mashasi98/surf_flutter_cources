enum SortingType {
  none(type: FilterType.none, name: 'Без сортировки'),
  nameFromA(type: FilterType.byName, name: 'По имени От А до Я'),
  nameFromZ(type: FilterType.byName, name: 'По имени от Я до А'),
  ascendingOrder(type: FilterType.byPrice, name: 'По возрастанию'),
  descendingOrder(type: FilterType.byPrice, name: 'По убыванию'),
  typeFromA(type: FilterType.byCategory, name: 'По типу от А до я'),
  typeFromZ(type: FilterType.byCategory, name: 'По типу от Я до А');

  final FilterType type;
  final String name;

  const SortingType({required this.type, required this.name});
}

enum FilterType {
  none('Без сортировки'),
  byName('По имени'),
  byPrice('По цене'),
  byCategory('по Категории');

  final String name;

  const FilterType(this.name);
}
