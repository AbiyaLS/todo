import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo/pages/add_todotile.dart';
import 'package:todo/pages/todo_page.dart';
import 'package:todo/themes/theme.dart';
import 'package:todo/themes/theme_provider.dart';

void main() async{

  // initalised hive
  await Hive.initFlutter();
  //open a box
  await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context)=>ThemeProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        darkTheme: darkMode,
        home:todoPage(),
      ),
    );
  }
}
