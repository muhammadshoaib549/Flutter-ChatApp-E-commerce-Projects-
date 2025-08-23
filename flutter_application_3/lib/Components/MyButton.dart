// MyButton.dart
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;

  const MyButton({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 240, 243, 245),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 222, 202, 143),
        ),
        child: child,
      ),
    );
  }
}
