import 'package:flutter/material.dart';

ThemeData lightMode= ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.grey[200],
    primary: Colors.grey
  )
);

ThemeData darkMode=ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
        primary: Colors.white24,
  )
);