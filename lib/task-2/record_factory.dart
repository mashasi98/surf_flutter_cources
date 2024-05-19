import 'package:flutter/cupertino.dart';

import 'entity/sides.dart';
import 'entity/song.dart';
import 'entity/vinil_record.dart';

class RecordFactory {
  static List<VinilRecord> createRecordList() {
    return [
      VinilRecord(
        'APsENT',
        Map.of({
          Sides.sideA: [Song(name: "Я пока побуду")],
          Sides.sideB: [Song(name: "Можно я с тобой")]
        }),
        AssetImage('assets/images/4A.png'),
        AssetImage('assets/images/4B.png'),
      ),
      VinilRecord(
        'Ведьмина Поляна',
        Map.of({
          Sides.sideA: [Song(name: "Шабаш")],
          Sides.sideB: [Song(name: "Time to Die")]
        }),
        AssetImage('assets/images/3A.png'),
        AssetImage('assets/images/3B.png'),
      ),
      VinilRecord(
        'АИГЕЛ',
        Map.of({
          Sides.sideA: [Song(name: "Тебе кажется")],
          Sides.sideB: [Song(name: "Кожа")]
        }),
        AssetImage('assets/images/2A.png'),
        AssetImage('assets/images/2B.png'),
      ),
      VinilRecord(
        'Will Sparks',
        Map.of({
          Sides.sideA: [Song(name: "Nevermind")],
          Sides.sideB: [Song(name: "Disco Dancing")]
        }),
        AssetImage('assets/images/5A.png'),
        AssetImage('assets/images/5B.png'),
      ),
      VinilRecord(
        '  Doi',
        Map.of({
          Sides.sideA: [Song(name: "Panzer")],
          Sides.sideB: [Song(name: "Du ohne ich")]
        }),
        AssetImage('assets/images/1A.png'),
        AssetImage('assets/images/1B.png'),
      ),
    ];
  }
}
