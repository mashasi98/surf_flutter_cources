import 'package:surf_flutter_cources/task-2/entity/vinil_record.dart';

class VinilPlayer {
  static final VinilPlayer _instance = VinilPlayer._internal();

  final bool hasRecord;
  final VinilRecord? record;

  VinilPlayer._internal()
      : record = null,
        hasRecord = false;

  factory VinilPlayer({VinilRecord? record, bool hasRecord = false}) {
    return _instance;
  }
}
