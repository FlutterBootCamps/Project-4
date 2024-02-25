import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:games_app/Screens/nav_bar.dart';
import 'package:games_app/bloc/news_bloc.dart';



void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => NewsBloc(),
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
        home: NavBottom(),
      ),
    );
  }
}
