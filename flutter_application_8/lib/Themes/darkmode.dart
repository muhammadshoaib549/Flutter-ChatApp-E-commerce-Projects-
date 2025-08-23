import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  colorScheme: ColorScheme.dark(
    // 👈 changed from light to dark
    background: const Color.fromARGB(255, 13, 0, 0),
    primary: const Color.fromARGB(255, 65, 64, 64),
    secondary: Colors.grey,
    tertiary: const Color.fromARGB(255, 91, 83, 83),
    inversePrimary: const Color.fromARGB(255, 246, 246, 246),
  ),
);
