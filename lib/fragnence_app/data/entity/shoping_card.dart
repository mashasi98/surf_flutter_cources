import 'package:decimal/decimal.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/perfume.dart';

class ShoppingCard {
  int id;
  List<Perfume> perfumes;
  double amount;
  double discountAmount = 0;

  ShoppingCard({
    required this.id,
    required this.perfumes,
    this.amount = 0,
    this.discountAmount = 0,
  });

  void add(Perfume perfume) {
    perfumes.add(perfume);
  }

  void remove(Perfume perfume) {
    perfumes.remove(perfume);
  }

  Decimal getFullAmount() {
    Decimal amount = Decimal.fromInt(0);
    for (Perfume perfume in perfumes) {
      amount += perfume.decimalPrice;
    }
    return amount;
  }

  Decimal getAmountWithDiscount() {
      Decimal amountWithDiscount = Decimal.fromInt(0);
      for (Perfume perfume in perfumes) {
        amountWithDiscount += perfume.decimalPrice;
      }
      return amountWithDiscount;
  }
}
