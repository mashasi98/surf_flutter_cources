import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:intl/intl.dart';

extension DecimalX on Decimal {
  String toFormattedCurrency({String? symbol, int? decimalDigits}) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'RU_ru',
      symbol: symbol ?? 'руб',
      decimalDigits: decimalDigits ?? 2,
    );
    return currencyFormatter.format(DecimalIntl(this));
  }

  static Decimal calculateDiscountForProduct(
      Decimal price, String discountPercent) {
    final discountAmount =
        ((price * Decimal.parse(discountPercent) ) /
                Decimal.fromInt(100)).toDecimal(scaleOnInfinitePrecision: 2);
    return price - discountAmount;
  }

  static Decimal calculateDiscountPriceForProduct(
      Decimal price, String discountPercent) {
    final discountAmount =
        (price * Decimal.parse(discountPercent) / Decimal.fromInt(100))
            .toDecimal();
    return price - discountAmount;
  }
}
