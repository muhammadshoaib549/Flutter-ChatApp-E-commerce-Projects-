import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_8/Themes/darkmode.dart';
import 'package:flutter_application_8/Themes/lightmode.dart';

// Here We Are going to Use the Proviers To manage the State of the Pages
class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = lightmode;

  // This is the Getter for the Gettng of the theme Data
  ThemeData get themedata => _themeData;

  // Now THis Will Return Either the Theme Data is in the Dark Mode or the Not
  bool get isDarkMode => _themeData == darkmode;

  // This is the Setter for the theme Data
  set themedata(ThemeData themedata) {
    _themeData = themedata;
    notifyListeners();
  }

  //Lets now Handle the Toggling
  void Toggletheme() {
    if (_themeData == lightmode) {
      themedata = darkmode;
    }
    // Other wise Set to the Light mode
    else {
      themedata = lightmode;
    }
  }
}
