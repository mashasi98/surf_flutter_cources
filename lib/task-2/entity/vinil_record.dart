import 'package:surf_flutter_cources/task-2/entity/song.dart';

import 'sides.dart';

class VinilRecord {
  final String recordName;
  final Map<Sides, List<Song>> songs;
  final String imageSideA;
  final String imageSideB;

  VinilRecord(this.recordName, this.songs, this.imageSideA, this.imageSideB);
}
