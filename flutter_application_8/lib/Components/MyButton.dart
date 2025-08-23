import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String text;
  // this is the Method for the on tap Functionality
  final void Function()? ontap;

  const Mybutton({super.key, required this.text, required this.ontap});

  Widget build(BuildContext context) {
    return GestureDetector(
      // Just Called the Dummy method That Has been Created in the Above
      onTap: ontap,
      child: SizedBox(
        width: 400,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
