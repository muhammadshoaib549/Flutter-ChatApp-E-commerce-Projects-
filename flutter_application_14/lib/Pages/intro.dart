import 'package:flutter/material.dart';
import 'package:flutter_application_13/Components/MyButton.dart';
import 'package:flutter_application_13/Pages/menupage.dart';
// Importer For the Google Fonts
import 'package:google_fonts/google_fonts.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 116, 109),

      /*
    This Page is Going to Have the Four of the Major Things
    Shop Name
    Icon
    Titles 
    Subtitles
    And A Button (Where We will Cliick and Will Move to the Next of the Page)
    */
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Shoaib’s Kitchen",
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 45,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  color: const Color.fromARGB(255, 250, 249, 249),
                ),
              ),
            ),
            const SizedBox(height: 5),
            // This is for the Image I mean icon
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Image.asset(
                "asset/pngtree-food-logo-png-image_5762315.png",
                fit: BoxFit.contain,
                height: 350,
              ),
            ),
            const SizedBox(height: 10),
            // Titles
            Text(
              "Taste of Pakistani Food \n Prepared by heart \n Best For Couples ",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20,
                fontStyle: FontStyle.italic,
                color: const Color.fromARGB(255, 252, 251, 251),
              ),
            ),

            const SizedBox(height: 15),
            // This is for the Subtitles
            Text(
              "Feel taste of our food from anywhere and anytime\n We are Surviing!",
              style: GoogleFonts.dmSans(
                fontSize: 15,
                color: const Color.fromARGB(255, 243, 238, 238),
              ),
            ),
            // And A button on which WE Will CLick We will Shift to the Next Page
            // Calling here the Button Class
            const SizedBox(height: 15),
            Mybutton(
              text: "Get Started ",
              OnTapp:
                  () => {
                    // Moving to the Menu Bar Fr
                    Navigator.pushNamed(context, '/MenuPage'),
                  },
            ),

            // This is the End FOR the Intro Page
          ],
        ),
      ),
    );
  }
}
