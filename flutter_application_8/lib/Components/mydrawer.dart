// Now Lets Work for the Drawer
import 'package:flutter/material.dart';
import 'package:flutter_application_8/Pages/Homepage.dart';
import 'package:flutter_application_8/Pages/LoginPage.dart';
import 'package:flutter_application_8/Pages/Settingspage.dart';

// Now lets make the Class
class Mydrawer extends StatelessWidget {
  Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      child: Column(
        children: [
          // Logo
          DrawerHeader(child: Icon(Icons.messenger, size: 50)),
          Divider(thickness: 2, color: Colors.black12),
          // Home TIle
          ListTile(
            leading: Icon(Icons.home_filled),
            title: Text(
              "Home",
              style: TextStyle(
                color: const Color.fromARGB(255, 10, 10, 10),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // This will go to the Home Page When We will Click On it
            onTap:
                () => {
                  // This WIll Pop the Drawer
                  Navigator.pop(context),
                },
          ),
          // Settings Tile
          ListTile(
            leading: Icon(Icons.settings),
            title: Text(
              "Settings",
              style: TextStyle(
                color: const Color.fromARGB(255, 13, 13, 13),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Now When the User Will Click On it It Will Move to the  sETTINGGS pAGE
            onTap:
                () => {
                  // This Will Just Pop
                  Navigator.pop(context),
                  // This Line Will push  to the Settings Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Settingspage()),
                  ),
                },
          ),
          // This Space Will Shift Every thing to the Below Level
          const Spacer(),

          // Logout List Tile
          ListTile(
            leading: Icon(Icons.logout),
            title: Text(
              "LogOut",
              style: TextStyle(
                color: const Color.fromARGB(255, 10, 10, 10),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            // This Will handle the Functioality of the lOGGINIG OOUT FROM THE chat app
            // Now
            onTap: () {
              // First close the drawer
              Navigator.pop(context);

              // Clear all previous pages and go to Loginpage
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Loginpage(onTapp: Homepage.new),
                ),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
