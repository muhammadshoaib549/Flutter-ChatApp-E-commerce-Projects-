import 'package:flutter/material.dart';
import 'package:flutter_application_13/Models/Food.dart';
import 'package:google_fonts/google_fonts.dart';

// A class
class Foodtiles extends StatelessWidget {
  // Accessing the Class Food That Has been Built in the Before
  final Food food;
  // A function for the Ontap
  // Functions Data Type Must be the void Call back

  final VoidCallback onTap;

  const Foodtiles({super.key, required this.food, required this.onTap});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            // Displaying the Name of the Food Item
            Image.asset(food.ImagePath, height: 400, width: 350),
            const SizedBox(height: 5),
            // Text for the Name And the Other Things
            Text(
              food.name,
              style: GoogleFonts.abel(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 5),
            Text(food.price),
            const SizedBox(height: 5),
            Text(food.Rating),
            const SizedBox(height: 5),
            Text(food.Discription),
          ],
        ),
      ),
    );
  }
}
