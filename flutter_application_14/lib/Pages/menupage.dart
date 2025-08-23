import 'package:flutter/material.dart';
import 'package:flutter_application_13/Components/FoodTiles.dart';
import 'package:flutter_application_13/Components/MyButton.dart';
import 'package:flutter_application_13/Components/TextFiled.dart';
import 'package:flutter_application_13/Models/Food.dart';
import 'package:flutter_application_13/Pages/FoodDetails.dart';
import 'package:google_fonts/google_fonts.dart';

class Menupage extends StatefulWidget {
  const Menupage({super.key});

  @override
  State<Menupage> createState() => _MenupageState();
}

class _MenupageState extends State<Menupage> {
  // Lets Now Do the Working for the Class With the Food Items List

  List foodmenu = [
    // We will Wuse the Class Food for the Items To be Having in the List
    Food(
      name: "P i z z a",
      price: "\$45",
      ImagePath: "asset/pizza.png",
      Discription:
          "A cheesy delight with fresh toppings. Perfectly baked to golden perfection. Loved by pizza fans everywhere.",
      Rating: "⭐4.9",
    ),
    // This is for the Displaying Momos
    Food(
      name: "Steamed Momoms",
      price: "\$92",
      ImagePath: "asset/sushis.png",
      Rating: "⭐5.0",
      Discription:
          "Soft and juicy dumplings filled with veggies. Served hot with spicy chutney. A favorite street food snack.",
    ),

    // For the Chicken Wings
    Food(
      name: "Fried Chicken",
      price: "\$29",
      ImagePath: "asset/friedchicken.png", // renamed from long pngtree...
      Rating: "⭐4.0",
      Discription:
          "Crispy on the outside and tender inside. Marinated with secret spices. Best enjoyed with dips.",
    ),
    // For the Displaying the Samosa
    Food(
      name: "Samosa",
      price: "\$39",
      ImagePath: "asset/Samosas.png", // renamed from long pngtree...
      Rating: "⭐5.0",
      Discription:
          "Crispy pastry pockets stuffed with spiced potatoes. A traditional tea-time snack. Loved for its crunch and flavor.",
    ),
    // for Displaying the Zinger Burger
    Food(
      name: "Zinger Burger",
      price: "\$95",
      ImagePath: "asset/burger.png", // renamed
      Rating: "⭐5.0",
      Discription:
          "Crispy chicken fillet with fresh veggies. Layered with creamy sauces in a soft bun. A filling and tasty meal.",
    ),
    // For the Finger Fries
    Food(
      name: "Finger Fries",
      price: "\$100",
      ImagePath: "asset/french-fries.png",
      Rating: "⭐3.9",
      Discription:
          "Golden fries fried to perfection. Lightly salted and crispy. The ultimate side dish for any meal.",
    ),
    // For the Paneer Jamun
    Food(
      name: "Strawbarry Cake",
      price: "\$1000",
      ImagePath:
          "asset/strawberry-cake.png", // renamed from Paneer-Jamun-recipe.jpg
      Rating: "⭐5.0",
      Discription:
          "Freshly baked sponge layered with cream. Topped with juicy strawberries. A sweet treat for every occasion.",
    ),
  ];
  // Navigate to the Food Items Details Now
  void NavigateToFoodDetails(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Fooddetails(food: foodmenu[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 139, 133),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 198, 85, 85),
        title: Text(
          "Menu",
          style: GoogleFonts.dmSerifDisplay(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        // put everything in center
        child: SingleChildScrollView(
          child: Column(
            // Inside We WIll use the Childer
            mainAxisAlignment: MainAxisAlignment.center, //  center vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, //  center horizontally
            children: [
              // Promo Banner Section
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  width: 600,
                  decoration: BoxDecoration(
                    color: Colors.red.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // This is  A column inside the Row This Will HAVE these Things
                      Padding(
                        padding: const EdgeInsets.all(
                          10.0,
                        ), // added padding here
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Promo message
                            Text(
                              "Get Promo 30% off",
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 7),
                            Text(
                              "You Matters For Us!",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Promo Image
                      Image.asset(
                        "asset/sushi.png",
                        fit: BoxFit.contain,
                        width: 200,
                      ),
                    ],
                  ),
                ),
              ),

              // Lets Add Here the Text Field
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Textfileding(hinttext: "Search From Here "),
              ),

              const SizedBox(height: 10),

              // Title of the Food Items
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Food Items",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(width: 10),
                  Image.asset("asset/item.png", width: 40, height: 40),
                ],
              ),

              const SizedBox(height: 10),

              // This is for the Food Tile Means to Display the Food Items Here
              // Grid Delegate is Bery Necessary to use the GridView.builder
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: foodmenu.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // number of items per row
                  childAspectRatio: 1, // adjust size ratio
                ),
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 40,
                      ),
                      child: Foodtiles(
                        food: foodmenu[index],
                        onTap: () {
                          NavigateToFoodDetails(index);
                        },
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
