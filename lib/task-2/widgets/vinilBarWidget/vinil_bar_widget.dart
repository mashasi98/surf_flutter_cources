import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../entity/vinil_record.dart';
import '../BoxDecoratetors/vinil_bar_box_decorator.dart';

class VinilRecordWidget extends StatefulWidget {
  final List<VinilRecord> recordList;

  const VinilRecordWidget({Key? key, required this.recordList}) : super(key: key);

  @override
  _VinilRecordWidgetState createState() => _VinilRecordWidgetState();
}

class _VinilRecordWidgetState extends State<VinilRecordWidget> {
  final decorator = VinilBarBoxDecorator();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (kDebugMode) {
          print('tap1');
        }
      },
      child: Center(
        child: _vinilBarBodyWidget(),
      ),
    );
  }

  Widget _vinilBarBodyWidget() {
    var contOfSongs = (widget.recordList.isEmpty) ? 5 : widget.recordList.length;
    return Container(
      height: 110,
      decoration: decorator.bodyDecorator(),
      child: _listViewBuilder(contOfSongs),
    );
  }

  ListView _listViewBuilder(int contOfSongs) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: contOfSongs,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 15.0),
          child: Container(
            decoration: decorator.skrollBarElementDecorator(),
            width: 80,
            height: 80,
            child: Image.asset(
              'assets/images/1A.png',
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
