// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Components/Shop.dart';
import 'package:flutter_application_2/Pages/CartPage.dart';
import 'package:flutter_application_2/Pages/ShopPage.dart';
import 'package:flutter_application_2/Pages/intropage.dart';
// Import Shop model
import 'package:flutter_application_2/themes/lightthemes.dart';
import 'package:provider/provider.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:
          (context) =>
              Shop(), // Providing  Shop model to entire app Basically Here We have Defined the ChangeNotifier

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeData,

        home: const Intropage(),
        //concept of the routes
        routes: {
          // Route Name                  // Where to  Go
          '/IntroPage': (context) => const Intropage(),
          '/ShopPage': (context) => const Shoppage(),
          '/cartpage': (context) => const Cartpage(),
        },
      ),
    );
  }
}
