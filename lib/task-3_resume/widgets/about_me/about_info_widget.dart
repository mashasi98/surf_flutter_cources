import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../decorator/custom_decorator.dart';
import '../neon_text_widget.dart';

class AboutWidget extends StatelessWidget {
  final Map<String, String> info;

  const AboutWidget({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _HeadTextWidget(text: info.keys.toString()),
          Container(
            decoration: CustomDecorator.instance.backgroundBorderDecorator(
              'assets/images/task-3/border_horizontal.png',
              BoxFit.fill,
              const Color(0xFFEC3EC7).withOpacity(0.2),
            ),
            child: Container(
              padding: const EdgeInsets.all(30),
              width: double.maxFinite,
              height: double.maxFinite,
              child: Text(
                info.values.toString(),
                style: const TextStyle(fontSize: 20, color: Color(0xFFEC3EC7)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeadTextWidget extends StatelessWidget {
  final String text;
  final RegExp whitespacePattern = RegExp(r'\s');

  _HeadTextWidget({
    required this.text,
  });

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
                    word: separatedWords[0],
                    topColor: const Color(0xFFB189DE),
                    bottomColor: const Color(0xd0ae67fb)),
                NeonTextWidget(
                    word: separatedWords[1],
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
