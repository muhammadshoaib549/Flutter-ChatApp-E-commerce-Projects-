// loginorAuth.dart
import 'package:flutter/material.dart';
import 'package:flutter_application_8/Pages/LoginPage.dart';
import 'package:flutter_application_8/Pages/RegisterPage.dart';

class Loginorauth extends StatefulWidget {
  const Loginorauth({super.key});

  @override
  State<Loginorauth> createState() => _LoginorauthState();
}

class _LoginorauthState extends State<Loginorauth> {
  bool ShowLogin = true;

  void togglePages() {
    setState(() {
      ShowLogin = !ShowLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (ShowLogin) {
      return Loginpage(onTapp: togglePages);
    } else {
      return Registerpage(onTappp: togglePages);
    }
  }
}
