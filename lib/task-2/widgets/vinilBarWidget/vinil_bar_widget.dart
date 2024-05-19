import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-2/widgets/dragWidget/DraggingListRecord.dart';

import '../../entity/vinil_record.dart';
import '../BoxDecoratetors/vinil_bar_box_decorator.dart';
import '../dragWidget/VinilBarListRecord.dart';

class VinilRecordWidget extends StatefulWidget {
  final List<VinilRecord> recordList;

  const VinilRecordWidget({Key? key, required this.recordList})
      : super(key: key);

  @override
  _VinilRecordWidgetState createState() => _VinilRecordWidgetState();
}

class _VinilRecordWidgetState extends State<VinilRecordWidget> {
  final decorator = VinilBarBoxDecorator();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: _vinilBarBodyWidget(),
      ),
    );
  }

  Widget _vinilBarBodyWidget() {
    var countOfSongs =
        (widget.recordList.isEmpty) ? 5 : widget.recordList.length;
    return Container(
        decoration: decorator.bodyDecorator(),
        child: recordListView(countOfSongs));
  }

  ListView recordListView(int countOfSongs) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: countOfSongs,
      itemBuilder: (context, index) {
        final record = widget.recordList[index];
        final GlobalKey dragKey = GlobalKey();
        return LongPressDraggable<VinilRecord>(
          data: record,
          dragAnchorStrategy: pointerDragAnchorStrategy,
          feedback: DraggingListRecord(
            dragKey: dragKey,
            imageProvider: record.imageProviderSideA,
          ),
          child: Builder(
            builder: (context) {
              return VinilBarListRecord(
                record: record,
              );
            }
          ),
        );
      },
    );
  }
}
