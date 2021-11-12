import 'package:flutter/material.dart';
import 'package:lageado_ac/view/home_screen.dart';
import 'package:lageado_ac/view/splash_screen.dart';

void main() async{
  /* TODO Initialize Firebase */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lageado Auto Center',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}