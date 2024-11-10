import 'package:surf_flutter_cources/fragnence_app/data/entity/perfume.dart';

class Brand {
  final String name;
  final String description;
  final String logo;
  final List<Perfume> perfumes = [];

  Brand({
    required this.name,
    required this.description,
    required this.logo,
  });

  void add(Perfume perfume) {
    perfumes.add(perfume);
  }

  void remove(Perfume perfume) {
    perfumes.remove(perfume);
  }
}
