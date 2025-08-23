import 'package:flutter/material.dart';
import 'package:flutter_application_13/Components/FoodTiles.dart';
import 'package:flutter_application_13/Pages/FoodDetails.dart';
import 'package:flutter_application_13/Pages/RedeemPage.dart';
import 'package:flutter_application_13/Pages/intro.dart';
import 'package:flutter_application_13/Pages/menupage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // We called here the Intro as a Home of the App
      home: Intro(),
      // Lets Define here the Routes
      routes: {
        // Routes
        '/introPage': (context) => Intro(),

        '/MenuPage': (context) => Menupage(),

        // This is the Route of the Redeen Page
        '/redeempage': (context) => Redeempage(),
      },
    );
  }
}
