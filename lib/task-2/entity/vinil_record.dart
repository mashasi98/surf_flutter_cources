import 'package:flutter/cupertino.dart';
import 'package:surf_flutter_cources/task-2/entity/song.dart';

import 'sides.dart';

class VinilRecord {
  final String recordName;
  final Map<Sides, List<Song>> songs;
  final ImageProvider imageProviderSideA;
  final ImageProvider imageProviderSideB;

  VinilRecord(this.recordName, this.songs, this.imageProviderSideA,
      this.imageProviderSideB);
}
