// this is the Dialog Box
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utilities/MyButtons.dart';

// Remember Controller is for the Access of the Text Filed in the Other Classes
class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onignore;
  Dialogbox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onignore,
  });

  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      // Added Container in the Place of the Content to the ADB
      content: Container(
        height: 200,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Add New Task.......",
                focusedBorder: OutlineInputBorder(
                  //this is For the Having the Access of the Sides Of the Border
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Now Lets Add the Buttons Here
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Save + Ignore Button
                Mybuttons(text: "Save Me", onpressed: onSave),
                SizedBox(width: 5),
                Mybuttons(text: "Ignore Me", onpressed: onignore),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
