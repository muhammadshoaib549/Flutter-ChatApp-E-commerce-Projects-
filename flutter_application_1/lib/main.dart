// This is the Project of the Notes App
import 'package:flutter/material.dart';

import 'package:flutter_application_1/Pages/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

      //Setting the Color of the App Bar Here Will Fix the Color Of the Eac And the Every App Bar
      theme: ThemeData(primarySwatch: Colors.amber),
    );
  }
}
