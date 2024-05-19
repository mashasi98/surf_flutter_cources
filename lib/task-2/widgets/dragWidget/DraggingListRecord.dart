import 'package:flutter/cupertino.dart';

class DraggingListRecord extends StatelessWidget {
  final GlobalKey dragKey;
  final ImageProvider imageProvider;

  const DraggingListRecord(
      {super.key, required this.dragKey, required this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: dragKey,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
