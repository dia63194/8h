import 'package:flutter/material.dart';

Color cardBackGroundColor = const Color.fromARGB(255, 255, 251, 251);
Color cardOutlineColor = const Color.fromRGBO(103, 58, 183, 1);


final mainTheme = ThemeData(
  fontFamily: 'Jura',
  scaffoldBackgroundColor: const Color.fromARGB(255,148,183,202),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 40,
      ), 

    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 70,
      ),
  )

);


//Пример того, что можно задать в теме так, чтобы потом не менять параметры стиля в главной странице
final exampleTheme = ThemeData(
  scaffoldBackgroundColor: const Color.fromARGB(255, 31, 27, 27),
  colorSchemeSeed: const Color.fromARGB(255, 255, 230, 0),
  dividerColor: Colors.white24,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white),
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 31, 27, 27),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      centerTitle: true),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 20,
    ),
    headlineLarge: TextStyle(

    ),

    labelSmall: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
  ),
);



