import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_frst_project/BMIScreen/BMIScreen.dart';
import 'package:flutter_frst_project/LoginPage.dart';
import 'package:flutter_frst_project/Messanger/messanger_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyD6-eG3tQG9I1LFbN7QI7HS8zsCZR5v_ZM",
      authDomain: "flutter-firebase-92534.firebaseapp.com",
      projectId: "flutter-firebase-92534",
      storageBucket: "flutter-firebase-92534.appspot.com",
      messagingSenderId: "22666668409",
      appId: "1:22666668409:android:2f7d5b4366f48d6a78e7a8",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Flutter App',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: LoginPage(),
    );
  }
}
