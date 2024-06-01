
import 'package:decimal/decimal.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/domain/entity/amount_entity.dart';

import 'category_entity.dart';

class ProductEntity {
  final String title;
  final int price;
  final CategoryType category;
  final String imageUrl;
  final Amount amount;
  final double sale;

  Decimal get decimalPrice => _getDecimalPrice(price);

  ProductEntity({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    required this.sale,
  });

  _getDecimalPrice(int price) {
    final priceString = (price/100).toStringAsFixed(2);
    return Decimal.parse(priceString);
  }
}
