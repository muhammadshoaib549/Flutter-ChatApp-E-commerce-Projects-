import 'package:flutter/material.dart';
import 'package:flutter_application_8/Services/Auth/authservice.dart';
import 'package:flutter_application_8/Components/MyButton.dart';
import 'package:flutter_application_8/Components/TextFields.dart';

class Loginpage extends StatelessWidget {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  final void Function()? onTapp;

  Loginpage({super.key, required this.onTapp});

  // Login method
  void login(BuildContext context) async {
    final authserviceInstance = authservice();
    try {
      await authserviceInstance.signInWithEmailPassword(
        _emailcontroller.text.trim(),
        _passwordcontroller.text.trim(),
      );

      _emailcontroller.clear();
      _passwordcontroller.clear();
    } catch (e) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: const Text("Login Failed"),
              content: Text(e.toString()),
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.message, size: 60),
            const SizedBox(height: 20),

            Text(
              "Welcome back! You were missed a lot",
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 20),

            Textfields(
              hinttext: "Email ID please!",
              obscuretext: false,
              controller: _emailcontroller,
            ),

            const SizedBox(height: 20),

            Textfields(
              hinttext: "Password Please!",
              obscuretext: true,
              controller: _passwordcontroller,
            ),

            const SizedBox(height: 20),

            Mybutton(text: "Login", ontap: () => login(context)),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Not A Member?"),
                const SizedBox(width: 5),
                GestureDetector(
                  onTap: onTapp,
                  child: Text(
                    "Register Now!",
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
