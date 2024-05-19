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
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.74,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(bottom: 20),
                child: const Text(" no name "),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(bottom: 20),
                child: const Text("no track "),
              ),
              VinilPlayerRound(),
            ],
          ),
        ],
      ),
    );
  }
}

class VinilPlayerRound extends StatelessWidget {
  const VinilPlayerRound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/p2.png'),
              fit: BoxFit.cover,
              alignment: Alignment(-1.2, 0),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.04,
          left: MediaQuery.of(context).size.width * 0.13,
          child: Container(
            width: 390,
            height: 390,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.008),
            ),
            child:
              PlayerDragTarget()
            ,
          ),
        ),
      ],
    );
  }
}

class PlayerDragTarget extends StatelessWidget {
}
