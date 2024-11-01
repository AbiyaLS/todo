import 'package:flutter/material.dart';
import 'package:todo/pages/add_todotile.dart';
import 'package:todo/pages/todo_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
         scaffoldBackgroundColor: Colors.grey.shade100,
         appBarTheme: AppBarTheme(color: Colors.grey.shade100)
       ),
      home:todoPage(),
    );
  }
}
