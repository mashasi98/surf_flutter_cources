import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-2/entity/vinil_record.dart';

class VinilPlayerWidget extends StatefulWidget {
  final List<VinilRecord> recordList;

  const VinilPlayerWidget({super.key, required this.recordList});

  @override
  _VinilPlayerWidgetState createState() => _VinilPlayerWidgetState();
}

class _VinilPlayerWidgetState extends State<VinilPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print('tap');
        }
      },
      child: mainRecordContainer(),
    );
  }

  SizedBox mainRecordContainer() {
    return SizedBox(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            alignment: Alignment.centerRight,
            child: const Column(children: [
              Text(" "  ),
              Text(" "),
            ]),
          ),
          SizedBox(
            height: 400,
            width: 400,
            child: Transform.translate(
              offset: const Offset(80, 0),
              child:
              Image.asset(
                  'assets/images/p2.png'),
            ),
          ),
          Container(
            height: 30,
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(right: 20),
            child: const Text("Time to change side"),
          ),
        ],
      ),
    );
  }
}
