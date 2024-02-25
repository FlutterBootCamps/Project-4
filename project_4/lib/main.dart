import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/articles_bloc.dart';
import 'package:project_4/pages/bottom_nav.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArticlesBloc(),
      child: const MaterialApp(
        home: BottomNavScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
