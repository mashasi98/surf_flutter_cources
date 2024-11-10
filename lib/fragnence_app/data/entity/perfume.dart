import 'package:decimal/decimal.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/brand.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/enum/gender_type.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/enum/perfume_type.dart';
import 'package:surf_flutter_cources/fragnence_app/data/entity/note_peramide.dart';

class Perfume {
  final String title;
  final Brand brand;
  final String country;
  final int price;
  final int sale;

  Decimal get decimalPrice => _getDecimalPrice();

  Decimal get decimalSale => _getDecimalPriceWithSale();

  final List<int> volume;
  final GenderType genderType;
  final PerfumeType perfumeType;
  final int year;
  final String image;
  final List<NotePeramide> notes;

  Perfume({
    required this.title,
    required this.brand,
    required this.country,
    required this.price,
    this.sale = 0,
    required this.volume,
    required this.genderType,
    required this.perfumeType,
    required this.year,
    required this.image,
    required this.notes,
  });

  Perfume.withSale(
      {required this.title,
      required this.brand,
      required this.country,
      required this.price,
      required this.sale,
      required this.volume,
      required this.genderType,
      required this.perfumeType,
      required this.year,
      required this.image,
      required this.notes});

  Decimal _getDecimalPrice() {
    String priseString = (price / 100).toStringAsFixed(2);
    return Decimal.parse(priseString);
  }

  Decimal _getDecimalPriceWithSale() {
    String priseString = (sale * 0.01).toStringAsFixed(2);
    return Decimal.parse(priseString) * _getDecimalPrice();
  }
}
