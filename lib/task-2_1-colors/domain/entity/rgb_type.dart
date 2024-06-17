import 'package:surf_flutter_cources/constant/app_string.dart';

enum RgbType {
  red(AppString.red),
  green(AppString.green),
  blue(AppString.blue);

  final String name;

  const RgbType(this.name);
}
