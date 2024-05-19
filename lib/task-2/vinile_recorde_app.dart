import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-2/record_factory.dart';
import 'package:surf_flutter_cources/task-2/widgets/record_info_widget/record_info_bar_widget.dart';
import 'package:surf_flutter_cources/task-2/widgets/vinilBarWidget/vinil_bar_widget.dart';
import 'package:surf_flutter_cources/task-2/widgets/vinilPlayerWidget/vinil_player_widget.dart';

import 'entity/vinil_record.dart';

class VinileRecorderApp extends StatefulWidget {
  const VinileRecorderApp({Key? key}) : super(key: key);

  @override
  State<VinileRecorderApp> createState() => _VinileRecorderAppState();
}

class _VinileRecorderAppState extends State<VinileRecorderApp> {
  late List<VinilRecord> recordsList;

  @override
  void initState() {
    super.initState();
    recordsList = RecordFactory.createRecordList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const VinilInfoBarWidget(),
              VinilPlayerWidget(recordList: recordsList),
              VinilRecordWidget(recordList: recordsList),
            ],
          ),
        ),
      ),
    );
  }
}
