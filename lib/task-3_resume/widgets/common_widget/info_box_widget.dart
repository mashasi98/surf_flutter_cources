import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'neon_text_widget.dart';

class InfoBoxWidget extends StatelessWidget {
  final Map<String, String> info;
  final BoxDecoration decoration;

  const InfoBoxWidget({super.key, required this.info, required this.decoration});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _HeadTextWidget(text: info.keys.first),
        Container(
          decoration: decoration,

          child: Container(

            padding:
                const EdgeInsets.all(55),
            child: Text(
              info.values.first,
              style:  GoogleFonts.tektur(
                fontSize: 18,
                color: const Color(0xFFFFFFFF),
                  shadows: [
                    const Shadow(
                      color: Color(0xFF00D0D1),
                      blurRadius: 2,
                      offset: Offset(-2, 1),
                    ),
                  ]
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ),
      ],
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
