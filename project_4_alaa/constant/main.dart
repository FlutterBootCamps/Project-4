import 'package:flutter/material.dart';
// import 'package:project_4_alaa/home_screen.dart';
import 'package:project_4_alaa/screens/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
     
      home: ProfileScreen(),// HomeScreen(),
    );
  }
}
