// MyDrawer.dart this is for the MyDrawer Class for th  handling of the Drawer

import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          const DrawerHeader(
            child: Icon(
              Icons.shopping_bag_rounded,
              size: 50,
              color: Color.fromARGB(255, 193, 20, 20),
            ),
          ),

          // We Will Design here the Shop tile
          ListTile(
            leading: const Icon(Icons.shop),
            // Switching To the Main One
            onTap: () => Navigator.pop(context),
            title: const Text(
              'Shop',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
          // Now Here We WIll Design Our Second ListTile
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            onTap: () => Navigator.pushNamed(context, "/cartpage"),
            // This Will Switch every thing to the Shopping Class
            title: const Text(
              'Cart',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),

          // Now we will design the cart tile The Power of the Spacer
          const Spacer(),

          // Lets Add A More Tile For the Learning Purpose
          ListTile(
            leading: const Icon(Icons.logout),
            onTap: () {
              Navigator.pop(context); // Close drawer
              Navigator.pushReplacementNamed(
                context,
                "/login",
              ); // Example logout navigation
            },
            title: const Text(
              'Logout ',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
