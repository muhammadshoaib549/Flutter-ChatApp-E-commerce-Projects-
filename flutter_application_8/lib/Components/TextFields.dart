import 'package:flutter/material.dart';

class Textfields extends StatelessWidget {
  final String hinttext;
  final bool obscuretext;
  final TextEditingController controller;

  const Textfields({
    super.key,
    required this.hinttext,
    required this.obscuretext,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600, // Your desired width
      child: TextField(
        obscureText: obscuretext,
        controller: controller,
        decoration: InputDecoration(
          hintText: hinttext,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12), // 👈 radius here
          ),
          focusedBorder: OutlineInputBorder(
            // WE will Fix it Here And Also  as in the Above
            borderRadius: BorderRadius.circular(20), // 👈 same radius here
          ),
        ),
      ),
    );
  }
}
