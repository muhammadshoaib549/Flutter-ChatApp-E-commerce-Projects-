import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_2/Components/MyDrawer.dart';
import 'package:flutter_application_2/Components/Productstile.dart';

import 'package:flutter_application_2/Components/Shop.dart';

import 'package:provider/provider.dart';

class Shoppage extends StatelessWidget {
  
  const Shoppage({super.key});

  @override
  Widget build(BuildContext context) {
    // Here We are Using the ShopPage to Get the Data from the Shop class

    final shop = context.watch<Shop>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shop Page",
          style: TextStyle(fontSize: 20, color: Colors.black38),
        ),
      ),
      drawer: const MyDrawer(),

      // Grid View Is just for Showing As We can Do in the Photos
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns like gallery
        ),
        itemCount: shop.products.length,
        itemBuilder: (context, index) {
          final product = shop.products[index];
          
          return Producttile(products: product);
        },
      ),
    );
  }
}
