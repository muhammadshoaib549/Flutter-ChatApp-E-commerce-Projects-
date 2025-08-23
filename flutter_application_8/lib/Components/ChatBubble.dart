import 'package:flutter/material.dart';

class Chatbubble extends StatelessWidget {
  final String message;
  Chatbubble({super.key, required this.message});

  Widget build(BuildContext context) {
    return Container(
      width: 20,
      margin: EdgeInsets.fromLTRB(10, 5, 900, 5),
      // gap har bubble me
      padding: EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        message,
        softWrap: true, // ✅ text wrap karega agar lamba ho
      ),
    );
  }
}
