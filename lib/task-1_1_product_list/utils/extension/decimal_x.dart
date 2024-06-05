import 'package:decimal/decimal.dart';
import 'package:intl/intl.dart';

extension DecimalX on Decimal {
  String toFormattedCurrency({String? symbol, int? decimalDigits}) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'RU_ru',
      symbol: symbol ?? 'P',
      decimalDigits: decimalDigits ?? 2,
    );
    return currencyFormatter.format(this);
  }
}
