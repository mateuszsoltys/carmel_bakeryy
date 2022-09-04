import 'package:flutter/material.dart';

ThemeData GlobalTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.brown), // "Register" or "Sign in" text uder title
    scaffoldBackgroundColor:
        const Color(0xffDA9166), // Background color of scaffold
    hintColor: Color.fromARGB(255, 151, 57, 115), // hint color
    textButtonTheme: TextButtonThemeData(
        // TextButton style
        style: TextButton.styleFrom(
      primary: Color.fromARGB(244, 53, 21, 21),
      backgroundColor: Color.fromARGB(255, 143, 60, 125),
    )),
    textTheme: const TextTheme(
        headline5: TextStyle(
            color: Color.fromARGB(255, 88, 45, 45)), // "Sign in" title
        caption: TextStyle(
            color: Color.fromARGB(151, 126, 44,
                23)), // "Don't have an account?" or "Already have an account" text uder title
        bodyText1: TextStyle(color: Colors.amber),
        bodyText2: TextStyle(color: Colors.purple)),
  );
}
