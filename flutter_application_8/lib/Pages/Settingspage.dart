import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/Themes/ThemeProvider.dart';

// 👇 Import provider package
import 'package:provider/provider.dart';

class Settingspage extends StatelessWidget {
  Settingspage({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          'S e t t i n g s',
          style: TextStyle(
            fontSize: 20,

            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // This is the Text
            Text(
              "BG Light Swinger",
              style: TextStyle(
                fontSize: 20,
                color: const Color.fromARGB(115, 248, 2, 2),
              ),
            ),

            CupertinoSwitch(
              // 👇 listen true here so switch updates when theme changes
              value: Provider.of<Themeprovider>(context).isDarkMode,
              onChanged:
                  (value) =>
                      Provider.of<Themeprovider>(
                        context,
                        listen: false,
                      ).Toggletheme(),
            ),
          ],
        ),
      ),
    );
  }
}
