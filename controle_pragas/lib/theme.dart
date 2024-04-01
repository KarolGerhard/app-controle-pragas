import 'package:flutter/material.dart';

class ThemeApp {

 static final theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF994C5B),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateColor.resolveWith((states) => const Color(0xFF994C5B)),
        textStyle: MaterialStateTextStyle.resolveWith((states) => const TextStyle(color: Color.fromARGB(255, 52, 50, 50))),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Roboto',
    useMaterial3: true,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          fontSize: 50, fontWeight: FontWeight.bold, color: Color.fromRGBO(56, 52, 52, 1)),
      titleLarge: TextStyle(
          fontSize: 30.0, fontWeight: FontWeight.w300, color: Color.fromARGB(255, 247, 243, 243)),
    ),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color(0xFF994C5B),
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: Colors.white,
        fontSize: 23, 
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      elevation: 0,
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      
    ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF8CB369)).copyWith(background: const Color(0xFFF5F5F5)),
  );
}

