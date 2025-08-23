// CartPage.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_2/Components/Shop.dart';
import 'package:flutter_application_2/models/Products.dart';
import 'package:provider/provider.dart';

class Cartpage extends StatelessWidget {
  // This is the Constructor for the CartPage
  const Cartpage({super.key});

  // This is the Method that will Handle the Logic for Removing a Product from the Cart
  void removeFromCart(BuildContext context, Products product) {
    // Showing the Dialog Box to Confirm Removal
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text(
              'Remove',
              // Setting the Style for the Title
              style: TextStyle(color: Colors.red, fontSize: 25),
            ),
            actions: [
              // First Button — This will Cancel the Removal
              MaterialButton(
                onPressed: () => Navigator.pop(context), // Closing the Dialog
                child: const Text(
                  'Cancel', // Changed from "Denying" to "Cancel" for better UX
                  style: TextStyle(color: Colors.deepOrangeAccent),
                ),
              ),

              // Second Button — This will Confirm the Removal
              MaterialButton(
                onPressed: () {
                  // Accessing the Shop Provider and Removing the Product from the Cart
                  context.read<Shop>().removeFromCart(product);
                  // Closing the Dialog Box
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
    // Accessing the Shop Provider to Get the Cart Items
    final cart = Provider.of<Shop>(context);

    return Scaffold(
      // App Bar for the Cart Page
      appBar: AppBar(
        title: const Text("Cart Page", style: TextStyle(fontSize: 40)),
        backgroundColor: const Color.fromARGB(221, 255, 255, 255),
        centerTitle: true, // Centering the Title
      ),

      // Body Section of the Cart Page
      body: Column(
        children: [
          // Expanded is Used so the ListView Takes the Remaining Screen Space
          Expanded(
            child: ListView.builder(
              // Number of Items in the Cart
              itemCount: cart.cart.length,
              // Building Each Cart Item
              itemBuilder: (context, index) {
                // Fetching the Individual Item from the Cart
                final item = cart.cart[index];

                return ListTile(
                  // Displaying the Product Name
                  title: Text(
                    item.name,
                    style: const TextStyle(fontSize: 20.0),
                  ),

                  // Displaying the Product Price
                  subtitle: Text(
                    "\$${item.price}",
                    style: const TextStyle(fontSize: 20.0),
                  ),

                  trailing: Text(item.discription),

                  // Button to Remove the Product from the Cart
                  leading: IconButton(
                    // Here have Cllaed the Function That Was Built in the Above 
                    
                    onPressed: () => removeFromCart(context, item),
                    icon: const Icon(Icons.delete_rounded),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
