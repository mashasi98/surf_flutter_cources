import 'package:flutter/material.dart';
import 'package:surf_flutter_cources/task-3_resume/widgets/decorator/custom_decorator.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: CustomDecorator.instance.backgroundBorderDecorator("assets/images/task-3/border_horizontal.png",
          BoxFit.fill),

      margin: const EdgeInsets.all(10),
      child: const IntrinsicHeight(
        child: Column(
          children: <Widget>[
            NewWidget(text: 'Contact', icon: Icon(Icons.ice_skating)),
            NewWidget(text: '<EMAIL>', icon: Icon(Icons.ice_skating)),
            NewWidget(text: '+91 9876543210', icon: Icon(Icons.ice_skating)),
          ],
        ),
      ),
    );
  }

}



class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
    required this.text,
    required this.icon,
  });

  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        IconButton(onPressed: null, icon: icon),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
