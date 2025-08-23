// intropage.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Components/MyButton.dart';

class Intropage extends StatelessWidget {
  const Intropage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_bag, size: 100, color: Colors.black),
            const SizedBox(height: 20),

            Text(
              "Branded Things Are Waiting for You Here ",
              style: TextStyle(
                // Lets Fix the Color here First
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            Text(
              " We only have Premium Quality Products",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 20),
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/ShopPage'),
              child: const Icon(Icons.arrow_forward, size: 25),
            ),
          ],
        ),
      ),
    );
  }
}
