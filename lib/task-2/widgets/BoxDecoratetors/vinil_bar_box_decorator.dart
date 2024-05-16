import 'package:flutter/material.dart';

class VinilBarBoxDecorator {
  BoxDecoration bodyDecorator() {
    return BoxDecoration(
      color: const Color(0xFF495B71).withOpacity(0.4),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
      ),
    );
  }

  BoxDecoration skrollBarElementDecorator() {
    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: const Color(0xFF495B71).withOpacity(0.8),
          spreadRadius: 1,
          blurRadius: 8,
          offset: const Offset(4, 7),
        ),
      ],
      borderRadius: const BorderRadius.all(Radius.circular(35.0)),
    );
  }
}
