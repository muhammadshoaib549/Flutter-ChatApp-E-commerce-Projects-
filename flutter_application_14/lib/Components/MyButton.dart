// This Class is for the Button

import 'package:flutter/material.dart';
import 'package:flutter_application_13/Themes/ThemeProvider.dart';

class Mybutton extends StatelessWidget {
  // A Text for the Button
  final String text;
  // A method for the OnTap
  final VoidCallback? OnTapp;

  const Mybutton({super.key, required this.text, required this.OnTapp});

  Widget build(BuildContext context) {
    // Our this Conatianer Will have the Following Attributes
    // A Text and the Icon
    return GestureDetector(
      onTap: OnTapp,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.redAccent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text
            Text(
              text,
              style: TextStyle(
                color: const Color.fromARGB(255, 12, 4, 4),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            // An Icon g=of the Arrow Upward
            Icon(Icons.arrow_forward, size: 25),
          ],
        ),
      ),
    );
  }
}
