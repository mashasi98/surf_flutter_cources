import 'package:decimal/decimal.dart';
import 'package:surf_flutter_cources/task-1_1_product_list/domain/entity/amount_entity.dart';

import 'category_entity.dart';

class ProductEntity {
  final String title;
  final int price;
  final Category category;
  final String imageUrl;
  final Amount amount;
  final double sale;

  /////Ответы на  вопросы из тз :

  /// 1. Почему цена хранится в копейках, а не в рублях?
  /// Передача данных в копейках формата инт позволяет избежать потери точности при делении/использовании дробей.
  /// Это позволяет сохранить точность цены при получении суммы с учетом скидки
  ///
  /// 2. Почему тип данных цены - [int], а не [double]?
  ///   Как и писала выше,связанор с проблемой точности числа дабл.
  ///   Инт гарантирует точность вычесления,которую не может гарантировать  дабл
  ///
  /// 3. Как можно было реализовать передачу цены иначе?
  /// Есть несколько способов :
  /// 1. Использование библиотеки Decimal,которую подключали для точности подсчета и округления до нужных чисел после запятой
  /// 2. Хранение данных в формате строки с дальнейшим форматирование (но этот вариант не очень удобен на мой взгляд)
  /// 3. Библиотека  money2 для работы с денежными значениями
  ///

  Decimal get decimalPrice => _getDecimalPrice(price);

  ProductEntity({
    required this.title,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.amount,
    this.sale = 0,
  });

  Decimal _getDecimalPrice(int price) {
    final priceString = (price / 100).toStringAsFixed(2);
    return Decimal.parse(priceString);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductEntity &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          price == other.price &&
          category == other.category &&
          imageUrl == other.imageUrl &&
          amount == other.amount &&
          sale == other.sale;

  @override
  int get hashCode =>
      title.hashCode ^
      price.hashCode ^
      category.hashCode ^
      imageUrl.hashCode ^
      amount.hashCode ^
      sale.hashCode;
}
