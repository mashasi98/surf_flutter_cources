import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: const EdgeInsets.all(20),
      child: IntrinsicHeight(
        child: Column(
          children: <Widget>[
            _buildContactRow('Contact', const Icon(Icons.ice_skating)),
            const SizedBox(height: 20),
            _buildContactRow('<EMAIL>', const Icon(Icons.ice_skating)),
            const SizedBox(height: 20),
            _buildContactRow('+91 9876543210', const Icon(Icons.ice_skating)),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Row _buildContactRow(String text, Icon icon) {
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
