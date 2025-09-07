import 'package:flutter/material.dart';

class Mybuttons extends StatelessWidget {
  // Button Will Include the Two things
  final String text;
  final VoidCallback onpressed;

  Mybuttons({super.key, required this.text, required this.onpressed});

  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onpressed, child: Text(text));
  }
}
