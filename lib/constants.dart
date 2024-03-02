import 'package:flutter/material.dart';

TextStyle welcomeLogoStyleText = const TextStyle(
  fontSize: 60,
  fontWeight: FontWeight.w800,
  shadows: [
    Shadow(
      color: Colors.black,
      offset: Offset(5, 3),
      blurRadius: 5,
    ),
    Shadow(
      color: Colors.black,
      offset: Offset(5, 3),
      blurRadius: 5,
    ),
  ],
);
InputDecoration textInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(width: 2),
  ),
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      width: 1.0,
      color: Color.fromARGB(255, 11, 168, 18),
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(20),
    ),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
