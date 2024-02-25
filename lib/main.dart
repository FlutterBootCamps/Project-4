import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project4/bloc/app_bloc.dart';
import 'package:project4/screen/bottom_nav_screen.dart';



void main(List<String> args) {
  runApp(MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child:  MaterialApp(
     debugShowCheckedModeBanner: false,
      home: BottomNavScreen(),
      ),
    );
  }
}