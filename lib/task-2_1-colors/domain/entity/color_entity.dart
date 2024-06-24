import 'package:equatable/equatable.dart';

class ColorEntity extends Equatable {
  final String name;
  final String value;

  const ColorEntity({
    required this.name,
    required this.value,
  });

  @override
  List<Object?> get props => [name, value];
}
