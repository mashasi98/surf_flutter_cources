import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-2/record_factory.dart';
import 'package:surf_flutter_cources/task-2/widgets/record_info_bar_widget.dart';
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
      theme: ThemeData(
        dividerTheme: const DividerThemeData(
          color: Color(0xff010101),
          thickness: 2,
          indent: 10,
          endIndent: 10,
        ),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const VinilInfoBarWidget(),
              Expanded(flex: 3,child: VinilPlayerWidget(recordList: recordsList)),
              Expanded(
                flex: 1,
                child: VinilRecordWidget(
                  recordList: recordsList,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
