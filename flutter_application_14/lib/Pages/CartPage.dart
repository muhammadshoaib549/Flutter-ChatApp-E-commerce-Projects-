import 'package:flutter/material.dart';
import 'package:flutter_application_13/Models/Food.dart';
import 'package:flutter_application_13/Themes/ThemeProvider.dart';

class Cartpage extends StatefulWidget {
  final Food food;
  final int quantity; // ✅ quantity received from Fooddetails
  const Cartpage({super.key, required this.food, required this.quantity});

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  bool isCleared = false; // flag to check if everything is removed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: provider,
      body: Center(
        child:
            isCleared
                ? Container() // agar clear kar diya to sab empty ho jayega
                : Container(
                  child: Column(
                    mainAxisSize:
                        MainAxisSize.min, // column ko tight rakhta hai
                    children: [
                      // Image of the Food
                      Image.asset(widget.food.ImagePath, width: 200),
                      const SizedBox(height: 10),
                      Text(widget.food.name),
                      const SizedBox(height: 10),
                      Text(widget.food.price),
                      const SizedBox(height: 10),
                      Text(widget.food.Rating),
                      const SizedBox(height: 10),
                      Text(widget.food.Discription),
                      const SizedBox(height: 10),

                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isCleared = true; // sab kuch hata do
                          });
                        },
                        child: const Text("Remove From Cart"),
                      ),

                      // quantity Has been Defined in the Class That is Before this Class named Food Details
                      Text(
                        "Quantity: ${widget.quantity}",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}
