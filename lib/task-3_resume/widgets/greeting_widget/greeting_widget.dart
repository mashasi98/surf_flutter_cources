import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/greeting_widget/profile_card.dart';


class GreetingWidget extends StatelessWidget {
  const GreetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.topLeft,
      child:  Column(
        children: [
          const Expanded( flex: 3, child : ProfileCard()),
          Expanded(flex: 2, child: buildAnimationInfo()),
        ],
      ),
    );
  }

  Container buildAnimationInfo() {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(


      ),
    );
  }
}

