import 'package:json_annotation/json_annotation.dart';
part 'color_data.g.dart';

@JsonSerializable(createToJson: false)
class ColorData {
 final String name;
 final String? value;

  ColorData(this.name, this.value);

  factory ColorData.fromJson(Map<String, dynamic> json) =>
      _$ColorDataFromJson(json);
}
