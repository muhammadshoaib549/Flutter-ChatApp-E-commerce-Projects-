// Producttile.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/models/Products.dart';
import 'package:flutter_application_2/Components/Shop.dart';
import 'package:provider/provider.dart';

class Producttile extends StatelessWidget {
  // This is the Product Model that We Will Display in the Tile
  final Products products;

  // Constructor for the Producttile
  const Producttile({super.key, required this.products});

  // This is the Function that Will Handle Adding Products to the Cart
  void addToCart(BuildContext context) {
    // This Will Show a Dialog Box When the User Clicks the Add Button
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text(
              'Add to Cart',
              // Setting the Title Style
              style: TextStyle(color: Colors.red, fontSize: 25),
            ),
            actions: [
              // First Button — This Will Cancel the Action
              MaterialButton(
                onPressed: () => Navigator.pop(context), // Close the Dialog
                child: const Text(
                  'Cancel', // Changed from "Denying" to "Cancel" for Better UX
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              ),

              // Second Button — This Will Add the Product to the Cart
              MaterialButton(
                onPressed: () {
                  // Access the Shop Provider and Add the Product
                  context.read<Shop>().addToCart(products);
                  // Close the Dialog Box
                  Navigator.pop(context);
                },
                child: const Text(
                  'Okay',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 20),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Align Text and Widgets Left
      children: [
        // Outer Container for Product Tile Styling
        Container(
          margin: const EdgeInsets.all(8), // Margin Around the Tile
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.9),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the Product Image with Rounded Corners
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  products.image,
                  fit: BoxFit.contain, // Ensuring Image Fits Properly
                  height: 260,
                ),
              ),

              const SizedBox(height: 25),

              // Display Product Name
              Text(
                products.name,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        // Display Product Price
        Text(
          "\$${products.price}",
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),

        // Display Product Description
        Text(
          products.discription,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        ),

        // Button to Add Product to Cart
        IconButton(
          onPressed: () {
            // Calling the Function to Add Product to Cart
            addToCart(context);
          },
          icon: const Icon(
            Icons.add,
            size: 40, // Large Plus Icon for Add Button
          ),
        ),
      ],
    );
  }
}
