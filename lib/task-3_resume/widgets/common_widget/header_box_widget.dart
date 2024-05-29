import 'package:flutter/material.dart';

import 'neon_text_widget.dart';

class HeaderTextWidget extends StatelessWidget {
  final String text;
  final RegExp whitespacePattern = RegExp(r'\s');

   HeaderTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    List<String> separatedWords = _separateLine(text);
    return Container(
      margin: const EdgeInsets.only(left: 10, bottom: 10, top: 5),
      alignment: Alignment.centerLeft,
      child: _containsWhitespace(text)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NeonTextWidget(
                    word: separatedWords[0].toString(),
                    topColor: const Color(0xFFB189DE),
                    bottomColor: const Color(0xd0ae67fb)),
                NeonTextWidget(
                    word: separatedWords[1].toString(),
                    topColor: const Color(0xB67FD3E7),
                    bottomColor: const Color(0xb342cce4)),
              ],
            )
          : NeonTextWidget(
              word: text,
              topColor: const Color(0xB67FD3E7),
              bottomColor: const Color(0xb342cce4)),
    );
  }

  bool _containsWhitespace(String text) {
    return whitespacePattern.hasMatch(text);
  }

  List<String> _separateLine(String text) {
    List<String> separatedWords = text.split(whitespacePattern);
    return separatedWords.where((word) => word.isNotEmpty).toList();
  }
}
