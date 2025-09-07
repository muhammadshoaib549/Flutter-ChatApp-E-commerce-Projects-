import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/Services/Auth/AuthGate.dart';
import 'package:flutter_application_8/Themes/ThemeProvider.dart';

import 'package:flutter_application_8/Themes/lightmode.dart';

import 'package:flutter_application_8/firebase_options.dart';

// 👇 Import provider package
import 'package:provider/provider.dart';

// This is the Main Function Capable to Run the Every thing here
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => Themeprovider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Authgate(),
      // We just Have Setted the Main Theme of the App ere
      theme: Provider.of<Themeprovider>(context).themedata,
    );
  }
}
