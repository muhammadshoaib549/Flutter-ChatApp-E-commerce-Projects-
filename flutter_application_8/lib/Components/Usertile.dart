import 'package:flutter/material.dart';

class Usertile extends StatelessWidget {
  // A String Text
  // And A Function onTap
  final String text;
  final Function()? OnTapp;

  Usertile({super.key, required this.text, required this.OnTapp});

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTapp,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),

        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),

        child: Row(
          children: [
            // This is foor the Icon of the Person
            Icon(Icons.person, size: 20),
            SizedBox(width: 5),
            Text(text, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
