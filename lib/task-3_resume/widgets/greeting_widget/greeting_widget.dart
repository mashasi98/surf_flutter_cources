import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/greeting_widget/profile_card.dart';

import 'more_info_widget.dart';

class GreetingWidget extends StatelessWidget {
  const  GreetingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height *0.97,
      width: size.width,
      padding: const EdgeInsets.only(bottom: 30),
      alignment: Alignment.topLeft,
      child: const Column(
        children: [
           Expanded(flex: 4, child: ProfileCardWidget()),
           Expanded(flex: 2, child: MoreInfoWidget()),
        ],
      ),
    );
  }

}


