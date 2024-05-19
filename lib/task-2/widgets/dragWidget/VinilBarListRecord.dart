import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-2/entity/vinil_record.dart';

import '../BoxDecoratetors/vinil_bar_box_decorator.dart';

class VinilBarListRecord extends StatelessWidget {
  final VinilRecord record;

  const VinilBarListRecord({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    return  Builder(
      builder: (context) {
        return Container(
          width: 100,
          height: double.infinity,
          alignment: Alignment.center,
          child: ListTile(
              leading: Image(
                image: record.imageProviderSideA,
                fit: BoxFit.cover,
              ),
          ),
        );
      }
    );
  }
}
