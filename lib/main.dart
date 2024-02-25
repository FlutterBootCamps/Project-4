import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/navigation_bloc/bloc/navigation_bloc.dart';
import 'package:project_4/bloc/news_bloc_bloc.dart';
import 'package:project_4/bloc/saved_bloc/bloc/saved_bloc_bloc.dart';
import 'package:project_4/pages/bottom_bar.dart';
import 'package:project_4/pages/edit_page.dart';
import 'package:project_4/pages/explore_page.dart';
import 'package:project_4/pages/home_page.dart';
import 'package:project_4/pages/news_page.dart';
import 'package:project_4/pages/profile_page.dart';
import 'package:project_4/pages/saved_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsBlocBloc(),
        ),
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => SavedBlocBloc(),
        ),
      ],
      child: BottomNavBar(),
    ));
  }
}
