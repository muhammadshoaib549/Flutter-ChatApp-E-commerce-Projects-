import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/Services/Auth/authservice.dart';
import 'package:flutter_application_8/Components/MyButton.dart';

class Registerpage extends StatelessWidget {
  final Function()? onTappp;
  Registerpage({super.key, required this.onTappp});

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _confirmcontroller = TextEditingController();

  void register(BuildContext context) {
    // Add your registration logic here
    // We will Get the user here from the Auth Services
    final _auth = authservice();

    // Means if the pass word matches Then Create the User
    if (_passwordcontroller.text.trim() == _confirmcontroller.text.trim()) {
      try {
        _auth.signUpWithEmailandPassword(
          _emailcontroller.text.trim(),
          _passwordcontroller.text.trim(),
        );
      } catch (e) {
        // Other Wise We will add Here the Functionalities of the Adding the Alert Dialog Box
        showDialog(
          context: context,
          builder:
              (BuildContext context) => AlertDialog(title: Text(e.toString())),
        );
      }
    }
    // if the password does not match then Tell the User to fix the password First
    else {
      showDialog(
        context: context,
        builder:
            (BuildContext conext) =>
                AlertDialog(title: Text("Wrong Password Fix it First!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.message, size: 60),
            const SizedBox(height: 20),

            Text(
              "Hay Lets Create An Account For You!",
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 500,
              child: TextField(
                controller: _emailcontroller,
                decoration: InputDecoration(
                  hintText: "Email ID please!",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 500,
              child: TextField(
                controller: _passwordcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password Please!",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: 500,
              child: TextField(
                controller: _confirmcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Confirm Pass Word Please!",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Mybutton(text: "Register", ontap: () => register(context)),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have An Account? "),
                GestureDetector(
                  onTap: onTappp,
                  child: Text(
                    "Login Now",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
