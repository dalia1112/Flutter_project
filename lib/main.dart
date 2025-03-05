import 'package:flutter/material.dart';
import 'package:flutter_frst_project/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false, // Removes debug banner
      title: 'My Flutter App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: HomePage(), 
    );
  }
}



