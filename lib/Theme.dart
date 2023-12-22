import 'package:flutter/material.dart';

class LightTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    hintColor: Colors.lightBlue,
    backgroundColor: Colors.white,
    // ... other theme properties
  );
}

class DarkTheme {
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey,
    hintColor: Colors.blueGrey,
    backgroundColor: Colors.black,
    // ... other theme properties
  );
}