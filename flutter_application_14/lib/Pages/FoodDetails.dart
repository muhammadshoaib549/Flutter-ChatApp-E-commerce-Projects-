// This Page is for the Food Details
import 'package:flutter/material.dart';
import 'package:flutter_application_13/Components/MyButton.dart';
import 'package:flutter_application_13/Models/Food.dart';
import 'package:flutter_application_13/Pages/CartPage.dart';
import 'package:flutter_application_13/Themes/ThemeProvider.dart';
import 'package:google_fonts/google_fonts.dart';

class Fooddetails extends StatefulWidget {
  final Food food;
  const Fooddetails({super.key, required this.food});

  @override
  State<Fooddetails> createState() => _FooddetailsState();
}

class _FooddetailsState extends State<Fooddetails> {
  int QuantityItems = 0; // Quantity items for cart

  get _QuantityItem => QuantityItems; // getter for QuantityItems

  void Decrement() {
    setState(() {
      if (QuantityItems > 0) {
        QuantityItems--; // decrease quantity
      }
    });
  }

  void Increment() {
    setState(() {
      QuantityItems++; // increase quantity
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: provider,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 108, 100),
        title: const Text(
          "Food Details",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 11, 11, 11),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset(widget.food.ImagePath, height: 300),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.food.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Text(
                        widget.food.price,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 50),
                      Text(
                        widget.food.Rating,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 50),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Text(
                      widget.food.Discription,
                      style: GoogleFonts.pacifico(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Quantity BUTTONS
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("How many You want to Purrchase?"),
              SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: Decrement,
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: Increment,
                  icon: const Icon(Icons.add),
                ),
              ),
              //
              Text(
                QuantityItems.toString(),
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),

          Mybutton(
            text: "ADD TO CART ",
            OnTapp: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => Cartpage(
                        food: widget.food,
                        quantity:
                            QuantityItems, // send quantity to cartPage File
                      ),
                ),
              );
            },
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
