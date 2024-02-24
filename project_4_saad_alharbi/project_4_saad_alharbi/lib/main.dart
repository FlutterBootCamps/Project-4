import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4_saad_alharbi/bloc/blog_bloc.dart';
import 'package:project_4_saad_alharbi/widgets/bottm_nav_bar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => BlogBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavBar(),
      ),
    );
  }
}
